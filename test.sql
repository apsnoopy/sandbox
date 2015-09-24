CREATE EXTERNAL TABLE xmltest 
(id STRING, author STRING, title STRING, price FLOAT, publish_date STRING)
ROW FORMAT SERDE 'com.ibm.spss.hive.serde2.xml.XmlSerDe' 
WITH SERDEPROPERTIES (
"column.xpath.id"="/book/@id",
"column.xpath.author"="/book/author/text()",
"column.xpath.title"="/book/title/text()",
"column.xpath.price"="/book/price/text()",
"column.xpath.publish_date"="/book/publish_date/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
LOCATION '/tmp/data/wbdemo'
TBLPROPERTIES (
"xmlinput.start"="<book id",
"xmlinput.end"="</book>"
);
