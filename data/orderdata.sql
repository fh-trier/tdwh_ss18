prompt Tabelle weborder loeschen...
set feedback off
set define off

DROP TABLE weborders CASCADE CONSTRAINTS;


prompt Tabelle weborders anlegen
CREATE TABLE weborders
(
  format VARCHAR2(20),
  custcode VARCHAR2(20),
  jsonord CLOB  CHECK (jsonord IS JSON)
);

prompt Inhalte in Tabelle weborders einfuegen
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 0,
    "active": false,
    "age": 44,
    "firstname": "Wright Cote",
    "lastname": "Simmons",
    "gender": "male",
    "email": "wrightsimmons@xoggle.com",
    "phone": "+1 (978) 575-3520",
    "address": "858 Gold Street, Bainbridge, Missouri, 6337",
    "registered": "2014-10-17T06:39:02 -02:00",
    "items": [
      {
        "product_id": 2316,
        "quantity": 51
      },
      {
        "product_id": 2322,
        "quantity": 39
      },
      {
        "product_id": 2330,
        "quantity": 60
      },
      {
        "product_id": 2322,
        "quantity": 57
      },
      {
        "product_id": 2326,
        "quantity": 27
      },
      {
        "product_id": 2335,
        "quantity": 56
      },
      {
        "product_id": 2231,
        "quantity": 51
      },
      {
        "product_id": 2272,
        "quantity": 18
      },
      {
        "product_id": 2326,
        "quantity": 38
      }
    ]
  }');
 INSERT INTO weborders VALUES('json', 'C00', '{  "index": 1,
    "active": true,
    "age": 48,
    "firstname": "Ruth Villarreal",
    "lastname": "Barton",
    "gender": "female",
    "email": "ruthbarton@xoggle.com",
    "phone": "+1 (921) 568-3647",
    "address": "438 Polhemus Place, Coral, Palau, 6892",
    "registered": "2016-01-23T10:54:41 -01:00",
    "items": [
      {
        "product_id": 2299,
        "quantity": 24
      },
      {
        "product_id": 2308,
        "quantity": 19
      },
      {
        "product_id": 2293,
        "quantity": 31
      },
      {
        "product_id": 1772,
        "quantity": 31
      },
      {
        "product_id": 2316,
        "quantity": 18
      },
      {
        "product_id": 2308,
        "quantity": 29
      },
      {
        "product_id": 2308,
        "quantity": 27
      },
      {
        "product_id": 1763,
        "quantity": 51
      },
      {
        "product_id": 2231,
        "quantity": 59
      }
    ]
  }');
 INSERT INTO weborders VALUES('json', 'C00', '{  "index": 2,
    "active": true,
    "age": 19,
    "firstname": "Lynn May",
    "lastname": "Hardin",
    "gender": "male",
    "email": "lynnhardin@xoggle.com",
    "phone": "+1 (988) 582-3186",
    "address": "163 Harman Street, Lodoga, Virgin Islands, 8833",
    "registered": "2014-07-28T02:42:13 -02:00",
    "items": [
      {
        "product_id": 2311,
        "quantity": 54
      },
      {
        "product_id": 2339,
        "quantity": 39
      },
      {
        "product_id": 2231,
        "quantity": 22
      },
      {
        "product_id": 2322,
        "quantity": 33
      },
      {
        "product_id": 2339,
        "quantity": 26
      },
      {
        "product_id": 2337,
        "quantity": 36
      },
      {
        "product_id": 2330,
        "quantity": 48
      },
      {
        "product_id": 2274,
        "quantity": 21
      },
      {
        "product_id": 2231,
        "quantity": 60
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 3,
    "active": false,
    "age": 19,
    "firstname": "Pruitt Hays",
    "lastname": "Mann",
    "gender": "male",
    "email": "pruittmann@xoggle.com",
    "phone": "+1 (965) 502-3118",
    "address": "300 Dunne Court, Cotopaxi, Montana, 4933",
    "registered": "2014-07-30T09:50:08 -02:00",
    "items": [
      {
        "product_id": 2323,
        "quantity": 59
      },
      {
        "product_id": 2231,
        "quantity": 55
      },
      {
        "product_id": 2293,
        "quantity": 21
      },
      {
        "product_id": 2337,
        "quantity": 37
      },
      {
        "product_id": 1763,
        "quantity": 25
      },
      {
        "product_id": 2308,
        "quantity": 22
      },
      {
        "product_id": 1763,
        "quantity": 28
      },
      {
        "product_id": 2311,
        "quantity": 34
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 4,
    "active": false,
    "age": 40,
    "firstname": "Bethany Middleton",
    "lastname": "English",
    "gender": "female",
    "email": "bethanyenglish@xoggle.com",
    "phone": "+1 (947) 528-3474",
    "address": "822 Plymouth Street, Hendersonville, Mississippi, 1206",
    "registered": "2016-02-15T03:23:41 -01:00",
    "items": [
      {
        "product_id": 2359,
        "quantity": 36
      },
      {
        "product_id": 1772,
        "quantity": 44
      },
      {
        "product_id": 1772,
        "quantity": 25
      },
      {
        "product_id": 2293,
        "quantity": 44
      },
      {
        "product_id": 1772,
        "quantity": 52
      },
      {
        "product_id": 2293,
        "quantity": 26
      },
      {
        "product_id": 2293,
        "quantity": 26
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 5,
    "active": true,
    "age": 31,
    "firstname": "Earline Garza",
    "lastname": "Mcguire",
    "gender": "female",
    "email": "earlinemcguire@xoggle.com",
    "phone": "+1 (871) 456-3529",
    "address": "850 Seaview Court, Florence, Oregon, 7782",
    "registered": "2015-02-03T02:00:18 -01:00",
    "items": [
      {
        "product_id": 2289,
        "quantity": 33
      },
      {
        "product_id": 1772,
        "quantity": 49
      },
      {
        "product_id": 2299,
        "quantity": 53
      },
      {
        "product_id": 2335,
        "quantity": 21
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 6,
    "active": true,
    "age": 35,
    "firstname": "Wilma Sparks",
    "lastname": "Vega",
    "gender": "female",
    "email": "wilmavega@xoggle.com",
    "phone": "+1 (861) 454-3116",
    "address": "689 Roosevelt Court, Cowiche, North Carolina, 1759",
    "registered": "2014-09-22T01:36:54 -02:00",
    "items": [
      {
        "product_id": 2293,
        "quantity": 59
      },
      {
        "product_id": 2231,
        "quantity": 59
      },
      {
        "product_id": 2323,
        "quantity": 38
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 7,
    "active": false,
    "age": 19,
    "firstname": "Nielsen Schroeder",
    "lastname": "Carver",
    "gender": "male",
    "email": "nielsencarver@xoggle.com",
    "phone": "+1 (900) 461-2830",
    "address": "515 School Lane, Saticoy, Indiana, 8612",
    "registered": "2015-11-21T10:32:53 -01:00",
    "items": [
      {
        "product_id": 2359,
        "quantity": 45
      },
      {
        "product_id": 2308,
        "quantity": 25
      },
      {
        "product_id": 2330,
        "quantity": 43
      },
      {
        "product_id": 2272,
        "quantity": 27
      },
      {
        "product_id": 1772,
        "quantity": 57
      },
      {
        "product_id": 2337,
        "quantity": 53
      },
      {
        "product_id": 2299,
        "quantity": 60
      },
      {
        "product_id": 2326,
        "quantity": 36
      },
      {
        "product_id": 2335,
        "quantity": 40
      },
      {
        "product_id": 2335,
        "quantity": 35
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 8,
    "active": false,
    "age": 40,
    "firstname": "Valdez Atkinson",
    "lastname": "Valencia",
    "gender": "male",
    "email": "valdezvalencia@xoggle.com",
    "phone": "+1 (887) 546-2293",
    "address": "620 Lawton Street, Elliott, Arkansas, 5548",
    "registered": "2014-11-03T08:21:53 -01:00",
    "items": [
      {
        "product_id": 2272,
        "quantity": 54
      },
      {
        "product_id": 2289,
        "quantity": 60
      },
      {
        "product_id": 2326,
        "quantity": 59
      },
      {
        "product_id": 2323,
        "quantity": 43
      },
      {
        "product_id": 2330,
        "quantity": 31
      },
      {
        "product_id": 2359,
        "quantity": 46
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 9,
    "active": false,
    "age": 47,
    "firstname": "Caitlin Stafford",
    "lastname": "Swanson",
    "gender": "female",
    "email": "caitlinswanson@xoggle.com",
    "phone": "+1 (952) 421-3022",
    "address": "421 Vista Place, Bendon, Washington, 5725",
    "registered": "2014-01-15T11:00:12 -01:00",
    "items": [
      {
        "product_id": 2339,
        "quantity": 59
      },
      {
        "product_id": 2274,
        "quantity": 33
      },
      {
        "product_id": 2335,
        "quantity": 36
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 10,
    "active": false,
    "age": 38,
    "firstname": "Courtney Winters",
    "lastname": "Hopper",
    "gender": "female",
    "email": "courtneyhopper@xoggle.com",
    "phone": "+1 (887) 522-2218",
    "address": "301 Fleet Walk, Orick, North Dakota, 7542",
    "registered": "2016-03-12T02:42:08 -01:00",
    "items": [
      {
        "product_id": 2311,
        "quantity": 19
      },
      {
        "product_id": 1772,
        "quantity": 27
      },
      {
        "product_id": 1772,
        "quantity": 43
      },
      {
        "product_id": 2274,
        "quantity": 60
      },
      {
        "product_id": 2359,
        "quantity": 50
      },
      {
        "product_id": 2308,
        "quantity": 40
      },
      {
        "product_id": 2316,
        "quantity": 44
      },
      {
        "product_id": 2299,
        "quantity": 45
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 11,
    "active": true,
    "age": 42,
    "firstname": "Juliette Holder",
    "lastname": "Molina",
    "gender": "female",
    "email": "juliettemolina@xoggle.com",
    "phone": "+1 (897) 418-3870",
    "address": "124 Atkins Avenue, Brady, Kansas, 1730",
    "registered": "2015-12-05T07:59:36 -01:00",
    "items": [
      {
        "product_id": 2299,
        "quantity": 52
      },
      {
        "product_id": 2289,
        "quantity": 53
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 12,
    "active": false,
    "age": 60,
    "firstname": "Constance Holloway",
    "lastname": "Flynn",
    "gender": "female",
    "email": "constanceflynn@xoggle.com",
    "phone": "+1 (919) 416-2736",
    "address": "944 Howard Avenue, Allamuchy, Minnesota, 4471",
    "registered": "2016-05-17T10:05:30 -02:00",
    "items": [
      {
        "product_id": 2330,
        "quantity": 40
      },
      {
        "product_id": 2339,
        "quantity": 41
      },
      {
        "product_id": 2272,
        "quantity": 60
      },
      {
        "product_id": 2308,
        "quantity": 56
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 13,
    "active": false,
    "age": 23,
    "firstname": "Franks Hawkins",
    "lastname": "Moore",
    "gender": "male",
    "email": "franksmoore@xoggle.com",
    "phone": "+1 (849) 519-3536",
    "address": "530 Carroll Street, Vallonia, Alaska, 7993",
    "registered": "2014-12-03T05:13:09 -01:00",
    "items": [
      {
        "product_id": 2316,
        "quantity": 22
      },
      {
        "product_id": 2323,
        "quantity": 44
      },
      {
        "product_id": 2272,
        "quantity": 22
      },
      {
        "product_id": 2322,
        "quantity": 53
      },
      {
        "product_id": 2231,
        "quantity": 43
      },
      {
        "product_id": 1763,
        "quantity": 24
      },
      {
        "product_id": 2274,
        "quantity": 44
      },
      {
        "product_id": 2339,
        "quantity": 43
      },
      {
        "product_id": 2272,
        "quantity": 47
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 14,
    "active": false,
    "age": 58,
    "firstname": "Mcfarland Castro",
    "lastname": "Sherman",
    "gender": "male",
    "email": "mcfarlandsherman@xoggle.com",
    "phone": "+1 (958) 587-2392",
    "address": "843 Middagh Street, Troy, Wisconsin, 9863",
    "registered": "2015-09-15T06:49:58 -02:00",
    "items": [
      {
        "product_id": 2231,
        "quantity": 57
      },
      {
        "product_id": 2308,
        "quantity": 22
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 15,
    "active": true,
    "age": 26,
    "firstname": "Patterson Mcintosh",
    "lastname": "Jenkins",
    "gender": "male",
    "email": "pattersonjenkins@xoggle.com",
    "phone": "+1 (964) 510-2114",
    "address": "942 Doone Court, Clarence, Idaho, 7233",
    "registered": "2014-10-28T03:57:04 -01:00",
    "items": [
      {
        "product_id": 1772,
        "quantity": 30
      },
      {
        "product_id": 2272,
        "quantity": 38
      },
      {
        "product_id": 2337,
        "quantity": 37
      },
      {
        "product_id": 2289,
        "quantity": 50
      },
      {
        "product_id": 2323,
        "quantity": 42
      },
      {
        "product_id": 2359,
        "quantity": 43
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 16,
    "active": true,
    "age": 60,
    "firstname": "Bryant Crawford",
    "lastname": "Holt",
    "gender": "male",
    "email": "bryantholt@xoggle.com",
    "phone": "+1 (864) 535-3819",
    "address": "239 Boardwalk , Forestburg, New York, 9121",
    "registered": "2015-01-11T06:40:45 -01:00",
    "items": [
      {
        "product_id": 2308,
        "quantity": 40
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 17,
    "active": true,
    "age": 53,
    "firstname": "Wolf Mcdaniel",
    "lastname": "Gilliam",
    "gender": "male",
    "email": "wolfgilliam@xoggle.com",
    "phone": "+1 (906) 405-3098",
    "address": "924 Arkansas Drive, Curtice, Pennsylvania, 2165",
    "registered": "2016-01-17T01:48:04 -01:00",
    "items": [
      {
        "product_id": 1763,
        "quantity": 42
      },
      {
        "product_id": 2323,
        "quantity": 42
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 18,
    "active": true,
    "age": 45,
    "firstname": "Elvira Mcpherson",
    "lastname": "Sweeney",
    "gender": "female",
    "email": "elvirasweeney@xoggle.com",
    "phone": "+1 (979) 456-3686",
    "address": "777 Tompkins Avenue, Boonville, Northern Mariana Islands, 7080",
    "registered": "2016-01-04T06:55:20 -01:00",
    "items": [
      {
        "product_id": 1772,
        "quantity": 22
      },
      {
        "product_id": 2308,
        "quantity": 23
      },
      {
        "product_id": 2311,
        "quantity": 54
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 19,
    "active": true,
    "age": 19,
    "firstname": "Velma Best",
    "lastname": "Bonner",
    "gender": "female",
    "email": "velmabonner@xoggle.com",
    "phone": "+1 (966) 574-2028",
    "address": "362 Williamsburg Street, Northchase, Arizona, 3701",
    "registered": "2016-03-11T03:00:28 -01:00",
    "items": [
      {
        "product_id": 1772,
        "quantity": 53
      },
      {
        "product_id": 1772,
        "quantity": 18
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 20,
    "active": false,
    "age": 30,
    "firstname": "Sutton Woods",
    "lastname": "Zimmerman",
    "gender": "male",
    "email": "suttonzimmerman@xoggle.com",
    "phone": "+1 (869) 440-2112",
    "address": "658 Forest Place, Kingstowne, American Samoa, 2874",
    "registered": "2014-03-18T04:49:54 -01:00",
    "items": [
      {
        "product_id": 2339,
        "quantity": 58
      },
      {
        "product_id": 2293,
        "quantity": 56
      },
      {
        "product_id": 1772,
        "quantity": 59
      },
      {
        "product_id": 1763,
        "quantity": 21
      },
      {
        "product_id": 2359,
        "quantity": 41
      },
      {
        "product_id": 2274,
        "quantity": 22
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 21,
    "active": true,
    "age": 27,
    "firstname": "Maryellen Evans",
    "lastname": "Bray",
    "gender": "female",
    "email": "maryellenbray@xoggle.com",
    "phone": "+1 (880) 582-3798",
    "address": "590 Kings Place, Adamstown, Marshall Islands, 5393",
    "registered": "2014-01-23T09:21:10 -01:00",
    "items": [
      {
        "product_id": 2337,
        "quantity": 29
      },
      {
        "product_id": 2272,
        "quantity": 32
      },
      {
        "product_id": 2330,
        "quantity": 51
      },
      {
        "product_id": 2359,
        "quantity": 52
      },
      {
        "product_id": 2330,
        "quantity": 46
      },
      {
        "product_id": 2231,
        "quantity": 50
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 22,
    "active": false,
    "age": 25,
    "firstname": "Manuela Dorsey",
    "lastname": "Dunn",
    "gender": "female",
    "email": "manueladunn@xoggle.com",
    "phone": "+1 (981) 571-3446",
    "address": "245 Liberty Avenue, Chautauqua, Connecticut, 4439",
    "registered": "2015-03-13T11:21:08 -01:00",
    "items": [
      {
        "product_id": 2337,
        "quantity": 32
      },
      {
        "product_id": 2323,
        "quantity": 40
      },
      {
        "product_id": 2231,
        "quantity": 50
      },
      {
        "product_id": 2316,
        "quantity": 41
      },
      {
        "product_id": 2322,
        "quantity": 40
      },
      {
        "product_id": 2326,
        "quantity": 38
      },
      {
        "product_id": 2322,
        "quantity": 41
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 23,
    "active": false,
    "age": 20,
    "firstname": "Marci Stuart",
    "lastname": "David",
    "gender": "female",
    "email": "marcidavid@xoggle.com",
    "phone": "+1 (897) 562-2298",
    "address": "939 Ditmars Street, Monument, Alabama, 4270",
    "registered": "2016-04-10T02:42:23 -02:00",
    "items": [
      {
        "product_id": 2339,
        "quantity": 37
      },
      {
        "product_id": 2359,
        "quantity": 53
      },
      {
        "product_id": 2330,
        "quantity": 43
      },
      {
        "product_id": 2311,
        "quantity": 18
      },
      {
        "product_id": 2316,
        "quantity": 24
      },
      {
        "product_id": 2299,
        "quantity": 44
      },
      {
        "product_id": 1763,
        "quantity": 44
      },
      {
        "product_id": 2326,
        "quantity": 51
      },
      {
        "product_id": 2274,
        "quantity": 51
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 24,
    "active": true,
    "age": 50,
    "firstname": "Kenya Harding",
    "lastname": "Dennis",
    "gender": "female",
    "email": "kenyadennis@xoggle.com",
    "phone": "+1 (857) 598-2204",
    "address": "347 Franklin Street, Healy, California, 8266",
    "registered": "2014-01-28T11:41:08 -01:00",
    "items": [
      {
        "product_id": 2289,
        "quantity": 18
      },
      {
        "product_id": 2330,
        "quantity": 57
      },
      {
        "product_id": 2337,
        "quantity": 30
      },
      {
        "product_id": 2231,
        "quantity": 31
      },
      {
        "product_id": 2337,
        "quantity": 36
      },
      {
        "product_id": 2299,
        "quantity": 50
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 25,
    "active": true,
    "age": 46,
    "firstname": "Monica Gutierrez",
    "lastname": "Garrison",
    "gender": "female",
    "email": "monicagarrison@xoggle.com",
    "phone": "+1 (962) 492-3669",
    "address": "511 Bayview Avenue, Hessville, Maine, 8587",
    "registered": "2015-12-22T09:33:10 -01:00",
    "items": [
      {
        "product_id": 1772,
        "quantity": 36
      },
      {
        "product_id": 2322,
        "quantity": 50
      },
      {
        "product_id": 2316,
        "quantity": 23
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 26,
    "active": false,
    "age": 59,
    "firstname": "Sonja Buchanan",
    "lastname": "Page",
    "gender": "female",
    "email": "sonjapage@xoggle.com",
    "phone": "+1 (911) 453-3956",
    "address": "667 Irving Street, Kent, Vermont, 743",
    "registered": "2014-01-14T12:37:50 -01:00",
    "items": [
      {
        "product_id": 2323,
        "quantity": 31
      },
      {
        "product_id": 2337,
        "quantity": 48
      },
      {
        "product_id": 2272,
        "quantity": 28
      },
      {
        "product_id": 2330,
        "quantity": 29
      },
      {
        "product_id": 2359,
        "quantity": 45
      },
      {
        "product_id": 2339,
        "quantity": 50
      },
      {
        "product_id": 2308,
        "quantity": 60
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 27,
    "active": false,
    "age": 32,
    "firstname": "Maxwell Leonard",
    "lastname": "Simpson",
    "gender": "male",
    "email": "maxwellsimpson@xoggle.com",
    "phone": "+1 (898) 454-2131",
    "address": "324 Union Street, Zeba, Georgia, 6395",
    "registered": "2015-02-14T10:06:11 -01:00",
    "items": [
      {
        "product_id": 2308,
        "quantity": 58
      },
      {
        "product_id": 2308,
        "quantity": 40
      },
      {
        "product_id": 2322,
        "quantity": 44
      },
      {
        "product_id": 2311,
        "quantity": 38
      },
      {
        "product_id": 1772,
        "quantity": 20
      },
      {
        "product_id": 2337,
        "quantity": 20
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 28,
    "active": true,
    "age": 53,
    "firstname": "Lucia Benton",
    "lastname": "Alvarez",
    "gender": "female",
    "email": "luciaalvarez@xoggle.com",
    "phone": "+1 (876) 520-3204",
    "address": "489 Division Avenue, Muse, Tennessee, 4787",
    "registered": "2015-04-15T01:22:22 -02:00",
    "items": [
      {
        "product_id": 2272,
        "quantity": 57
      },
      {
        "product_id": 2311,
        "quantity": 52
      },
      {
        "product_id": 2330,
        "quantity": 28
      },
      {
        "product_id": 2323,
        "quantity": 41
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 29,
    "active": true,
    "age": 56,
    "firstname": "Shelton Merrill",
    "lastname": "Walters",
    "gender": "male",
    "email": "sheltonwalters@xoggle.com",
    "phone": "+1 (871) 531-3680",
    "address": "311 Ebony Court, Brandermill, Nevada, 2459",
    "registered": "2015-05-28T10:04:11 -02:00",
    "items": [
      {
        "product_id": 1763,
        "quantity": 23
      },
      {
        "product_id": 2231,
        "quantity": 60
      },
      {
        "product_id": 2337,
        "quantity": 18
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 30,
    "active": false,
    "age": 41,
    "firstname": "Strickland Harvey",
    "lastname": "Flowers",
    "gender": "male",
    "email": "stricklandflowers@xoggle.com",
    "phone": "+1 (821) 444-3175",
    "address": "206 Bartlett Place, Iola, Wyoming, 3202",
    "registered": "2014-03-04T11:44:44 -01:00",
    "items": [
      {
        "product_id": 2322,
        "quantity": 36
      },
      {
        "product_id": 2335,
        "quantity": 32
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 31,
    "active": true,
    "age": 28,
    "firstname": "Concepcion Ayers",
    "lastname": "Terry",
    "gender": "female",
    "email": "concepcionterry@xoggle.com",
    "phone": "+1 (932) 589-2431",
    "address": "717 Ridge Boulevard, Montura, Rhode Island, 2067",
    "registered": "2016-04-18T03:10:31 -02:00",
    "items": [
      {
        "product_id": 2339,
        "quantity": 24
      },
      {
        "product_id": 2293,
        "quantity": 20
      },
      {
        "product_id": 2322,
        "quantity": 57
      },
      {
        "product_id": 2289,
        "quantity": 32
      },
      {
        "product_id": 2335,
        "quantity": 47
      },
      {
        "product_id": 1772,
        "quantity": 56
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 32,
    "active": true,
    "age": 27,
    "firstname": "Berg Cabrera",
    "lastname": "Salas",
    "gender": "male",
    "email": "bergsalas@xoggle.com",
    "phone": "+1 (848) 402-2581",
    "address": "884 Eckford Street, Aurora, New Hampshire, 6514",
    "registered": "2014-09-13T06:37:25 -02:00",
    "items": [
      {
        "product_id": 2323,
        "quantity": 45
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 33,
    "active": true,
    "age": 50,
    "firstname": "Buck Hayden",
    "lastname": "Bass",
    "gender": "male",
    "email": "buckbass@xoggle.com",
    "phone": "+1 (941) 570-3324",
    "address": "863 Nautilus Avenue, Lumberton, Guam, 4321",
    "registered": "2014-06-20T08:22:50 -02:00",
    "items": [
      {
        "product_id": 2330,
        "quantity": 58
      },
      {
        "product_id": 2335,
        "quantity": 23
      },
      {
        "product_id": 2335,
        "quantity": 18
      },
      {
        "product_id": 2293,
        "quantity": 19
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 34,
    "active": false,
    "age": 34,
    "firstname": "Amalia Compton",
    "lastname": "Olsen",
    "gender": "female",
    "email": "amaliaolsen@xoggle.com",
    "phone": "+1 (995) 534-2012",
    "address": "208 Schenectady Avenue, Durham, West Virginia, 3450",
    "registered": "2014-08-02T01:20:52 -02:00",
    "items": [
      {
        "product_id": 1772,
        "quantity": 27
      },
      {
        "product_id": 2299,
        "quantity": 54
      },
      {
        "product_id": 2339,
        "quantity": 23
      },
      {
        "product_id": 2231,
        "quantity": 19
      },
      {
        "product_id": 2231,
        "quantity": 20
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 35,
    "active": true,
    "age": 49,
    "firstname": "Annette Hubbard",
    "lastname": "Avery",
    "gender": "female",
    "email": "annetteavery@xoggle.com",
    "phone": "+1 (830) 575-2667",
    "address": "131 Shale Street, Clayville, District Of Columbia, 8165",
    "registered": "2015-06-04T11:19:35 -02:00",
    "items": [
      {
        "product_id": 2274,
        "quantity": 58
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 36,
    "active": true,
    "age": 57,
    "firstname": "Reeves Greer",
    "lastname": "Gray",
    "gender": "male",
    "email": "reevesgray@xoggle.com",
    "phone": "+1 (953) 531-3163",
    "address": "676 Alice Court, Winfred, Texas, 9029",
    "registered": "2015-10-28T02:33:47 -01:00",
    "items": [
      {
        "product_id": 2289,
        "quantity": 57
      },
      {
        "product_id": 1763,
        "quantity": 27
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 37,
    "active": false,
    "age": 52,
    "firstname": "Sara Floyd",
    "lastname": "Beard",
    "gender": "female",
    "email": "sarabeard@xoggle.com",
    "phone": "+1 (805) 505-2270",
    "address": "111 Franklin Avenue, Sisquoc, South Dakota, 7449",
    "registered": "2014-08-16T10:44:36 -02:00",
    "items": [
      {
        "product_id": 2311,
        "quantity": 32
      },
      {
        "product_id": 2322,
        "quantity": 57
      },
      {
        "product_id": 2272,
        "quantity": 26
      },
      {
        "product_id": 2359,
        "quantity": 21
      },
      {
        "product_id": 1763,
        "quantity": 21
      },
      {
        "product_id": 2359,
        "quantity": 51
      },
      {
        "product_id": 2311,
        "quantity": 60
      },
      {
        "product_id": 2323,
        "quantity": 37
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 38,
    "active": false,
    "age": 45,
    "firstname": "Shauna Everett",
    "lastname": "Strickland",
    "gender": "female",
    "email": "shaunastrickland@xoggle.com",
    "phone": "+1 (998) 463-2237",
    "address": "636 Cumberland Street, Ebro, Puerto Rico, 5334",
    "registered": "2016-04-25T07:48:56 -02:00",
    "items": [
      {
        "product_id": 2299,
        "quantity": 57
      },
      {
        "product_id": 2330,
        "quantity": 34
      },
      {
        "product_id": 2339,
        "quantity": 29
      },
      {
        "product_id": 2231,
        "quantity": 35
      },
      {
        "product_id": 2231,
        "quantity": 52
      },
      {
        "product_id": 2322,
        "quantity": 37
      },
      {
        "product_id": 1763,
        "quantity": 50
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 39,
    "active": false,
    "age": 47,
    "firstname": "Janie Schultz",
    "lastname": "Dudley",
    "gender": "female",
    "email": "janiedudley@xoggle.com",
    "phone": "+1 (968) 515-2357",
    "address": "777 Hoyts Lane, Wacissa, Colorado, 2106",
    "registered": "2016-01-04T07:50:26 -01:00",
    "items": [
      {
        "product_id": 2316,
        "quantity": 31
      },
      {
        "product_id": 2322,
        "quantity": 28
      },
      {
        "product_id": 2337,
        "quantity": 46
      },
      {
        "product_id": 2359,
        "quantity": 31
      },
      {
        "product_id": 2330,
        "quantity": 42
      },
      {
        "product_id": 2272,
        "quantity": 58
      },
      {
        "product_id": 1772,
        "quantity": 56
      },
      {
        "product_id": 2272,
        "quantity": 37
      },
      {
        "product_id": 2326,
        "quantity": 39
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 40,
    "active": false,
    "age": 26,
    "firstname": "Tyson Whitaker",
    "lastname": "Yates",
    "gender": "male",
    "email": "tysonyates@xoggle.com",
    "phone": "+1 (806) 515-2390",
    "address": "148 Herbert Street, Berwind, Michigan, 282",
    "registered": "2015-09-09T07:12:59 -02:00",
    "items": [
      {
        "product_id": 2323,
        "quantity": 28
      },
      {
        "product_id": 2330,
        "quantity": 58
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 41,
    "active": true,
    "age": 40,
    "firstname": "Mcclain Mccormick",
    "lastname": "Barrett",
    "gender": "male",
    "email": "mcclainbarrett@xoggle.com",
    "phone": "+1 (949) 421-3322",
    "address": "288 Harkness Avenue, Hackneyville, Nebraska, 5864",
    "registered": "2015-04-11T12:44:16 -02:00",
    "items": [
      {
        "product_id": 1763,
        "quantity": 21
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 42,
    "active": false,
    "age": 21,
    "firstname": "Oneil Gay",
    "lastname": "Weiss",
    "gender": "male",
    "email": "oneilweiss@xoggle.com",
    "phone": "+1 (826) 430-3923",
    "address": "206 Forbell Street, Morgandale, Iowa, 7381",
    "registered": "2014-12-13T12:42:09 -01:00",
    "items": [
      {
        "product_id": 2323,
        "quantity": 54
      },
      {
        "product_id": 2274,
        "quantity": 49
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 43,
    "active": false,
    "age": 21,
    "firstname": "Cortez Huff",
    "lastname": "Koch",
    "gender": "male",
    "email": "cortezkoch@xoggle.com",
    "phone": "+1 (904) 444-3058",
    "address": "762 Auburn Place, Orason, South Carolina, 5395",
    "registered": "2014-05-10T03:25:44 -02:00",
    "items": [
      {
        "product_id": 2316,
        "quantity": 20
      },
      {
        "product_id": 2272,
        "quantity": 39
      },
      {
        "product_id": 2326,
        "quantity": 49
      },
      {
        "product_id": 1772,
        "quantity": 27
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 44,
    "active": true,
    "age": 46,
    "firstname": "Shelia Barr",
    "lastname": "Kelley",
    "gender": "female",
    "email": "sheliakelley@xoggle.com",
    "phone": "+1 (879) 589-2794",
    "address": "984 Williams Place, Bethpage, Virginia, 5666",
    "registered": "2015-12-04T08:03:40 -01:00",
    "items": [
      {
        "product_id": 1772,
        "quantity": 25
      },
      {
        "product_id": 2359,
        "quantity": 32
      },
      {
        "product_id": 2330,
        "quantity": 59
      },
      {
        "product_id": 2308,
        "quantity": 24
      },
      {
        "product_id": 2272,
        "quantity": 21
      },
      {
        "product_id": 2311,
        "quantity": 49
      },
      {
        "product_id": 2323,
        "quantity": 24
      },
      {
        "product_id": 2337,
        "quantity": 21
      },
      {
        "product_id": 2231,
        "quantity": 49
      },
      {
        "product_id": 2326,
        "quantity": 51
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 45,
    "active": false,
    "age": 28,
    "firstname": "Tracie Knowles",
    "lastname": "Dawson",
    "gender": "female",
    "email": "traciedawson@xoggle.com",
    "phone": "+1 (877) 564-2903",
    "address": "226 Cobek Court, Urbana, Oklahoma, 8130",
    "registered": "2015-02-23T03:25:58 -01:00",
    "items": [
      {
        "product_id": 2308,
        "quantity": 42
      },
      {
        "product_id": 1763,
        "quantity": 47
      },
      {
        "product_id": 2289,
        "quantity": 59
      },
      {
        "product_id": 1763,
        "quantity": 24
      },
      {
        "product_id": 2231,
        "quantity": 55
      },
      {
        "product_id": 2335,
        "quantity": 26
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 46,
    "active": true,
    "age": 23,
    "firstname": "Lakeisha Wood",
    "lastname": "Cameron",
    "gender": "female",
    "email": "lakeishacameron@xoggle.com",
    "phone": "+1 (914) 536-2858",
    "address": "682 Batchelder Street, Westboro, Florida, 1468",
    "registered": "2014-05-06T10:52:43 -02:00",
    "items": [
      {
        "product_id": 1772,
        "quantity": 34
      },
      {
        "product_id": 2289,
        "quantity": 50
      },
      {
        "product_id": 2311,
        "quantity": 26
      },
      {
        "product_id": 2322,
        "quantity": 53
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 47,
    "active": true,
    "age": 56,
    "firstname": "Jenifer Silva",
    "lastname": "Sexton",
    "gender": "female",
    "email": "jenifersexton@xoggle.com",
    "phone": "+1 (932) 510-3597",
    "address": "136 Hausman Street, Roland, Massachusetts, 996",
    "registered": "2014-07-08T01:27:27 -02:00",
    "items": [
      {
        "product_id": 2311,
        "quantity": 30
      },
      {
        "product_id": 2339,
        "quantity": 27
      },
      {
        "product_id": 2322,
        "quantity": 60
      },
      {
        "product_id": 2289,
        "quantity": 30
      },
      {
        "product_id": 2289,
        "quantity": 49
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 48,
    "active": true,
    "age": 49,
    "firstname": "Shelley Howell",
    "lastname": "Short",
    "gender": "female",
    "email": "shelleyshort@xoggle.com",
    "phone": "+1 (881) 419-3162",
    "address": "611 Beacon Court, Emerald, Utah, 8066",
    "registered": "2015-01-02T04:25:45 -01:00",
    "items": [
      {
        "product_id": 2311,
        "quantity": 25
      },
      {
        "product_id": 2330,
        "quantity": 54
      },
      {
        "product_id": 2289,
        "quantity": 42
      },
      {
        "product_id": 2272,
        "quantity": 30
      },
      {
        "product_id": 2231,
        "quantity": 20
      },
      {
        "product_id": 1772,
        "quantity": 31
      },
      {
        "product_id": 2299,
        "quantity": 18
      }
    ]
  }');
  INSERT INTO weborders VALUES('json', 'C00', '{  "index": 49,
    "active": true,
    "age": 36,
    "firstname": "Winnie Bailey",
    "lastname": "Jackson",
    "gender": "female",
    "email": "winniejackson@xoggle.com",
    "phone": "+1 (814) 418-3055",
    "address": "320 Oakland Place, Grenelefe, Illinois, 7245",
    "registered": "2015-07-26T03:09:54 -02:00",
    "items": [
      {
        "product_id": 2316,
        "quantity": 57
      },
      {
        "product_id": 2326,
        "quantity": 30
      },
      {
        "product_id": 2311,
        "quantity": 60
      },
      {
        "product_id": 2311,
        "quantity": 31
      }
    ]
  }');

COMMIT;
prompt Inhalte eingefuegt
set feedback on
set define on
