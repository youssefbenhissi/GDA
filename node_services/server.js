const express = require('express');
var crypto = require('crypto');
var bodyParser = require('body-parser');

var mysql = require('mysql');
var mysqlHost = process.env.MYSQL_HOST || 'localhost';
var mysqlPort = process.env.MYSQL_PORT || '3306';
var mysqlUser = process.env.MYSQL_USER || 'root';
var mysqlPass = process.env.MYSQL_PASS || '';
var mysqlDB = process.env.MYSQL_DB || 'saepmobile';

const cors = require('cors');
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(cors());
var con = mysql.createConnection({
  host: mysqlHost,
  port: mysqlPort,
  user: mysqlUser,
  password: mysqlPass,
  database: mysqlDB
});
app.listen(3305,()=>{
    console.log('Restful Running on port 3305');
});
con.connect((err)=> {
    if(!err)
        console.log('Connection Established Successfully');
    else
        console.log('Connection Failed!'+ JSON.stringify(err,undefined,2));
});
module.exports = con;
function checkHashPassword(userPassword,salt) {
    var passwordData = sha512(userPassword,salt);
    return passwordData;
    
}
var sha512 = function (password,salt) {
    var hash = crypto.createHmac('sha512',salt) ; 
    hash.update(password);
    var value = hash.digest('hex');
    return {
        salt:salt,
        passwordHash:value
    };
    
};



app.post('/updateuser',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;
  var plaint_password = post_data.password;
  var hash_data = saltHashPassword(plaint_password);
  var password = hash_data.passwordHash;  //Get Hash value
  var salt = hash_data.salt; 
  con.query('SELECT * FROM jhi_user u where u.login=? ',[login],function (err,result,fields) {
    con.on('error', function (err) {
      console.log('[MYSQL ERROR]', err);
    });
    if (result && result.length){
        con.query("UPDATE `jhi_user` SET `password_hash` =  ? , `salt` = ? WHERE `login` = ?", [password,salt,login], function (error, results, fields) {
          if (error) throw error;
          res.status(200).send()
        });
    }
    else{
      res.status(400).send()
    }
  });
});

app.post('/specifiqueindicateur',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;

});
  app.post('/login',(req,res,next)=>{
  var post_data = req.body;
  var user_password = post_data.password;
  var email = post_data.login;
  con.query('SELECT * FROM jhi_user u , jhi_user_authority j  where u.id = j.user_id AND u.login=? ',[email],function (err,result,fields) {
      con.on('error', function (err) {
          console.log('[MYSQL ERROR]', err);
      });
      if (result && result.length){
        var salt = result[0].salt;
        var encrypted_password = result[0].password_hash;
        var hashed_password = checkHashPassword(user_password, salt).passwordHash;
        if (encrypted_password == hashed_password){
          if(result[0].authority_name == "ROLE_ADMIN"){
            res.status(200).send(JSON.stringify(result[0]))
          }else if(result[0].authority_name == "ROLE_CENTRAL"){
            res.status(201).send(JSON.stringify(result[0]))
          }else if(result[0].authority_name == "ROLE_GOUV"){
            res.status(202).send(JSON.stringify(result[0]))
          }else if(result[0].authority_name == "ROLE_USER"){
            res.status(203).send(JSON.stringify(result[0]))
          }
        }else{
          res.status(404).send("worng password");
        }
      }
      else{
        res.status(400).send()
      }
  });
})
var genRandomString = function (length) {
  return crypto.randomBytes(Math.ceil(length/2))
      .toString('hex') //Convert to hexa format
      .slice(0,length);
  
};
function saltHashPassword(userPassword) {
  var salt = genRandomString(16); //Gen Random string with 16 charachters
  var passwordData = sha512(userPassword,salt) ;
  return passwordData;
  
}
app.post('/register',(req,res,next)=>{
  var post_data = req.body;  //Get POST params
  var plaint_password = post_data.password ;  //Get password from post params
  var hash_data = saltHashPassword(plaint_password);
  var password = hash_data.passwordHash;  //Get Hash value
  var salt = hash_data.salt; 
  var email = post_data.email;
  con.query('INSERT INTO `jhi_user`(`login` , `id_gda`, `password_hash`, `first_name`, `last_name`, `activated`, `created_by`,`created_date`,`salt`) ' +
      'VALUES ("youssef",157,?,"youssef","benhissi",1,"system",NOW(),?)',[password,salt],function (err,result,fields) {
      if (err) throw err;
      let resultId = result.insertId;
  res.status(200).send();

})});

app.post('/getdonneesidentification', function (req, res) {
  let login = req.body.login;
  con.query('SELECT u.id_gouv , rgo.lib_ar , rgo.lib_fr ,rgd.lib_ar as rgdarabe , rgd.lib_fr as rgdfrancais, rgd.id_delegation , rgd.code ,rgd.date_creation,rgd.nom_president,rgd.tel_president, rgd.nom_dir_technique , rgd.tel_dir_technique , rgd.nom_saep , rgd.date_mise_service , rgd.src_eau_forage , rgd.src_eau_piquage_sonede, rgd.src_eau_piquage_gr ,rgd.src_eau_puit ,rgd.src_eau_source_naturelle ,rgd.nb_beneficiaires ,rgd.longueur_reseau,rgd.nb_stations_pompage,rgd.nb_reservoirs,rgd.nb_bi ,rgd.nb_bep , refdelegation.lib_ar as refdelegationarabe, refdelegation.lib_fr as refdelegationfrancais   FROM jhi_user u , ref_gda rgd , ref_gouvernorat rgo , ref_delegation refdelegation  where rgd.id_delegation = refdelegation.id AND u.login=? AND u.id_gouv = rgo.id AND u.id_gda = rgd.id ',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send();  
      }
      return res.status(200).send(results);
  });
});

app.post('/getspecificdonneesidentification', function (req, res) {
  let gda = req.body.gda;
  con.query('SELECT rgd.lib_ar as rgdarabe , rgd.lib_fr as rgdfrancais  ,rgd.code as rgdcode ,  rgd.id_delegation as iddelegation , refdelegation.lib_ar as refdelegationarabe, refdelegation.lib_fr as refdelegationfrancais , rgo.id as rgoid ,rgo.lib_ar , rgo.lib_fr  FROM ref_gda rgd , ref_delegation refdelegation , ref_gouvernorat rgo where rgd.code = ? AND rgd.id_delegation = refdelegation.id AND refdelegation.id_gov = rgo.id',[gda], function (error, results, fields) {
    if (error) {
      return res.status(400).send();  
    }
    return res.status(200).send(results);
  });
});

app.post('/volumepompe', function (req, res) {
  let gda = req.body.gda;
  let month = req.body.month;
  let year = req.body.year;
  con.query('SELECT input_value AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 2)',[gda,month , year], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/volumedistribue', function (req, res) {
  let gda = req.body.gda;
  let month = req.body.month;
  let year = req.body.year;
  con.query('SELECT input_value AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 4)',[gda,month , year], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/volumeeaujavel', function (req, res) {
  let gda = req.body.gda;
  let month = req.body.month;
  let year = req.body.year;
  con.query('SELECT input_value AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 10)',[gda,month , year], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/tarifadapte', function (req, res) {
  let gda = req.body.gda;
  let month = req.body.month;
  let year = req.body.year;
  con.query('SELECT input_value AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 41)',[gda,month , year], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/couteau', function (req, res) {
  let gda = req.body.gda;
  let month = req.body.month;
  let year = req.body.year;
  con.query('SELECT input_value AS average_value FROM indicateur_saisie_value WHERE (code_gda = ?  AND month = ? AND year = ? AND id_indicateur = 40)',[gda,month , year], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/nombredejourarret', function (req, res) {
  let gda = req.body.gda;
  let month = req.body.month;
  let year = req.body.year;
  con.query('SELECT input_value AS average_value FROM indicateur_saisie_value WHERE (code_gda = ?  AND month = ? AND year = ? AND id_indicateur = 1)',[gda,month , year], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/tauxdeperte', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 8)',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/tauxdepertestatistics', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value , month ,year  FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 8) GROUP BY month , year',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/specifiqueindicateurtauxdeperte',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT CAST(i.input_value AS float ) AS average_value FROM indicateur_saisie_value i , ref_gda rg , ref_delegation rd , ref_gouvernorat rgo WHERE (created_by = ? AND i.id_indicateur = 8  AND i.month = ? AND i.year = ? AND i.code_gda =  rg.code AND rg.id_delegation = rd.id AND rd.id_gov = rgo.id   ) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/tauxderecouvrement', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 9)',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/specificrecettevente',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value  FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 21) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificrecetteabonnement',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value  FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 23) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificrecetteadhesion',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value  FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 24)',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificrecettecotisation',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value  FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 22) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificautresrecettes',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value  FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 25) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepensesachateau',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 26 )',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepensesenergie',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 27)',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepensessalairesetprimes',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 28) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepensesmaintenaceetentretien',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 29)',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepenseslocation',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 30) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepensesrenouvellementdesequipement',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 32) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepensesgestiondga',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 33) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificdepensesdinvestissement',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 34) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});

app.post('/specificautredepenses',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.gda;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value WHERE (code_gda = ? AND  month = ? AND year = ? AND id_indicateur = 35) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});
app.post('/specifiqueindicateurtauxderecouvrement',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT AVG(CAST(input_value AS float )) AS average_value FROM indicateur_saisie_value i , ref_gda rg , ref_delegation rd , ref_gouvernorat rgo WHERE (created_by = ? AND i.id_indicateur = 9  AND i.month = ? AND i.year = ? AND i.code_gda =  rg.code AND rg.id_delegation = rd.id AND rd.id_gov = rgo.id   ) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});
app.post('/consommationspecifique', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 42)',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/specifiqueindicateurconsommationspecifique',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT CAST(i.input_value AS float ) AS average_value FROM indicateur_saisie_value i , ref_gda rg , ref_delegation rd , ref_gouvernorat rgo WHERE (created_by = ? AND i.id_indicateur = 42  AND i.month = ? AND i.year = ? AND i.code_gda =  rg.code AND rg.id_delegation = rd.id AND rd.id_gov = rgo.id   ) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});
app.post('/consommationspecifiquestatics', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value , month ,year  FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 42) GROUP BY month , year',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/consommationspecifiqueeaudejavel', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 43)',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/specifiqueindicateurconsommationspecifiqueeaudejavel',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT CAST(i.input_value AS float ) AS average_value FROM indicateur_saisie_value i , ref_gda rg , ref_delegation rd , ref_gouvernorat rgo WHERE (created_by = ? AND i.id_indicateur = 43  AND i.month = ? AND i.year = ? AND i.code_gda =  rg.code AND rg.id_delegation = rd.id AND rd.id_gov = rgo.id   ) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});
app.post('/consommationspecifiqueeaudejavelstatics', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value , month ,year  FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 43) GROUP BY month , year',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/recettemoyenne', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 44)',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/specifiqueindicateurrecettemoyenne',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT CAST(i.input_value AS float  ) AS average_value FROM indicateur_saisie_value i , ref_gda rg , ref_delegation rd , ref_gouvernorat rgo WHERE (created_by = ? AND i.id_indicateur = 44  AND i.month = ? AND i.year = ? AND i.code_gda =  rg.code AND rg.id_delegation = rd.id AND rd.id_gov = rgo.id   ) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});
app.post('/recettemoyennestatics', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value , month ,year  FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 44) GROUP BY month , year',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});
app.post('/nombredejourarret', function (req, res) {
  let login = req.body.login;
  con.query('SELECT AVG(CAST(input_value AS float)) AS average_value FROM indicateur_saisie_value WHERE (created_by = ? AND id_indicateur = 1)',[login], function (error, results, fields) {
      if (error) {
        return res.status(400).send(error);  
      }
      return res.status(200).send(results);
  });
});

app.post('/specifiqueindicateurnombredejourarret',(req,res,next)=>{
  var post_data = req.body;
  var login = post_data.login;
  var month = post_data.month;
  var year = post_data.year;
  con.query('SELECT CAST(i.input_value AS float ) AS average_value FROM indicateur_saisie_value i , ref_gda rg , ref_delegation rd , ref_gouvernorat rgo WHERE (created_by = ? AND i.id_indicateur = 1  AND i.month = ? AND i.year = ? AND i.code_gda =  rg.code AND rg.id_delegation = rd.id AND rd.id_gov = rgo.id   ) ',[login,month,year], function (error, results, fields) {
    if (error) {
      return res.status(400).send(error);  
    }
    return res.status(200).send(results);
  });
});


app.post('/donneestechniques', function (req, res) {
  let createdby = req.body.createdby;
  let inputvaluevolumepompe = req.body.inputvaluevolumepompe;
  let idindicateurvolumepompe = req.body.idindicateurvolumepompe;
  let inputvaluevolumedistribue = req.body.inputvaluevolumedistribue;
  let idindicateurvolumedistribue = req.body.idindicateurvolumedistribue;
  let inputvaluevolumeeaudejavel = req.body.inputvaluevolumeeaudejavel;
  let idindicateurvolumeeaudejavel = req.body.idindicateurvolumeeaudejavel;
  let inputvaluetarifadopte = req.body.inputvaluetarifadopte;
  let idindicateurtarifadopte = req.body.idindicateurtarifadopte;
  let inputvaluecouteau = req.body.inputvaluecouteau;
  let idindicateurcouteau = req.body.idindicateurcouteau;
  let inputvaluenombredejoursarret = req.body.inputvaluenombredejoursarret;
  let idindicateur = req.body.idindicateur;
  let idsaisie = req.body.idsaisie;
  let month = req.body.month;
  let year = req.body.year;
  con.query('INSERT INTO `indicateur_saisie_value`(`created_by` , `date_creation`, `input_value`, `id_indicateur`, `id_saisie`, `month`, `year`) ' +
  'VALUES (?,NOW(),?,?,?,?,?),(?,NOW(),?,?,?,?,?),(?,NOW(),?,?,?,?,?),(?,NOW(),?,?,?,?,?),(?,NOW(),?,?,?,?,?)',[createdby,inputvaluevolumepompe,idindicateurvolumepompe,idsaisie,month,year,createdby,inputvaluevolumedistribue,idindicateurvolumedistribue,idsaisie,month,year,createdby,inputvaluevolumeeaudejavel,idindicateurvolumeeaudejavel,idsaisie,month,year,createdby,inputvaluetarifadopte,idindicateurtarifadopte,idsaisie,month,year,createdby,inputvaluecouteau,idindicateurcouteau,idsaisie,month,year,createdby,inputvaluenombredejoursarret,idindicateur,idsaisie,month,year],function (err,result,fields) {
  if (err) throw err;
//	sendVerificationEmail(email,randomCode);
  res.status(200).send()})
});

app.post('/recettesrealisees', function (req, res) {
  let createdby = req.body.createdby;
  let inputvaluerecettesventeeau = req.body.inputvaluerecettesventeeau;
  let idindicateurrecettesventeeau = req.body.idindicateurrecettesventeeau;
  let inputvaluerecettesadhesion = req.body.inputvaluerecettesadhesion;
  let idindicateurrecettesadhesion = req.body.idindicateurrecettesadhesion;
  let inputvaluerecettesabonnement = req.body.inputvaluerecettesabonnement;
  let idindicateurrecettesabonnement = req.body.idindicateurrecettesabonnement;
  let inputvaluerecettescotisations = req.body.inputvaluerecettescotisations;
  let idindicateurrecettescotisations = req.body.idindicateurrecettescotisations;
  let inputvalueautresrecettes = req.body.inputvalueautresrecettes;
  let idindicateurautresrecettes = req.body.idindicateurautresrecettes;
  let idsaisie = req.body.idsaisie;
  let month = req.body.month;
  let year = req.body.year;
  con.query('INSERT INTO `indicateur_saisie_value`(`created_by` , `date_creation`, `input_value`, `id_indicateur`, `id_saisie`, `month`, `year`) ' +
  'VALUES (?,NOW(),?,?,?,?,?),(?,NOW(),?,?,?,?,?),(?,NOW(),?,?,?,?,?),(?,NOW(),?,?,?,?,?)',[createdby,inputvaluerecettesventeeau,idindicateurrecettesventeeau,idsaisie,month,year,createdby,inputvaluerecettesadhesion,idindicateurrecettesadhesion,idsaisie,month,year,createdby,inputvaluerecettesabonnement,idindicateurrecettesabonnement,idsaisie,month,year,createdby,inputvaluerecettescotisations,idindicateurrecettescotisations,idsaisie,month,year,createdby,inputvalueautresrecettes,idindicateurautresrecettes,idsaisie,month,year,month,year],function (err,result,fields) {
  if (err) throw err;
//	sendVerificationEmail(email,randomCode);
  res.status(200).send()})
});