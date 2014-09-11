#!/bin/bash
. ./conf.sh

curl -XPUT localhost:9200/$index/$typeCustomer/_mapping -d '{
    "Customer" : {
                  "settings" : {
                  }, 
                  "properties"   : { 
                    "customerId" : { "type":"String" , "index" : "not_analyzed"}, 
                    "documentIndex" : { "type":"String"}, 
                    "documentCount" : { "type":"Integer"}, 
                    "firstName"  : { "type":"String" , "index" : "not_analyzed"}, 
                    "middleName" : { "type":"String" , "index" : "not_analyzed"}, 
                    "lastName"   : { "type":"String" , "index" : "not_analyzed"}, 
                    "tags"       : { "type":"String" , "position_offset_gap": 100}, 
                    "balance"    : { "type":"Double" }, 
                    "created": {
                         "type"   : "date",
                         "format" : "yyyy-MM-dd HH:mm:ss"
                     },
                     "transactions": {
                       "type": "nested",
                       "properties": {
                          "transactionId": {
                             "type"  : "string", 
			     "index" : "not_analyzed"
                           },                           
                          "nestedCount" : { "type":"Integer"}, 
                          "createdDate": {
                             "type"   : "date",
                             "format" : "dateOptionalTime"
                          },
                          "amount" : {
                             "type" : "Double"
                          },
			  "ipAddress":{
			     "type" : "string"
		          },
                          "status" : {
                              "type" : "string"
                          }
                      } 
                   }
              }
      }
}'
