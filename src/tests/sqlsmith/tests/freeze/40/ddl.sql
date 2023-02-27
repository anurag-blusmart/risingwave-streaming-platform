CREATE TABLE supplier (s_suppkey INT, s_name CHARACTER VARYING, s_address CHARACTER VARYING, s_nationkey INT, s_phone CHARACTER VARYING, s_acctbal NUMERIC, s_comment CHARACTER VARYING, PRIMARY KEY (s_suppkey));
CREATE TABLE part (p_partkey INT, p_name CHARACTER VARYING, p_mfgr CHARACTER VARYING, p_brand CHARACTER VARYING, p_type CHARACTER VARYING, p_size INT, p_container CHARACTER VARYING, p_retailprice NUMERIC, p_comment CHARACTER VARYING, PRIMARY KEY (p_partkey));
CREATE TABLE partsupp (ps_partkey INT, ps_suppkey INT, ps_availqty INT, ps_supplycost NUMERIC, ps_comment CHARACTER VARYING, PRIMARY KEY (ps_partkey, ps_suppkey));
CREATE TABLE customer (c_custkey INT, c_name CHARACTER VARYING, c_address CHARACTER VARYING, c_nationkey INT, c_phone CHARACTER VARYING, c_acctbal NUMERIC, c_mktsegment CHARACTER VARYING, c_comment CHARACTER VARYING, PRIMARY KEY (c_custkey));
CREATE TABLE orders (o_orderkey BIGINT, o_custkey INT, o_orderstatus CHARACTER VARYING, o_totalprice NUMERIC, o_orderdate DATE, o_orderpriority CHARACTER VARYING, o_clerk CHARACTER VARYING, o_shippriority INT, o_comment CHARACTER VARYING, PRIMARY KEY (o_orderkey));
CREATE TABLE lineitem (l_orderkey BIGINT, l_partkey INT, l_suppkey INT, l_linenumber INT, l_quantity NUMERIC, l_extendedprice NUMERIC, l_discount NUMERIC, l_tax NUMERIC, l_returnflag CHARACTER VARYING, l_linestatus CHARACTER VARYING, l_shipdate DATE, l_commitdate DATE, l_receiptdate DATE, l_shipinstruct CHARACTER VARYING, l_shipmode CHARACTER VARYING, l_comment CHARACTER VARYING, PRIMARY KEY (l_orderkey, l_linenumber));
CREATE TABLE nation (n_nationkey INT, n_name CHARACTER VARYING, n_regionkey INT, n_comment CHARACTER VARYING, PRIMARY KEY (n_nationkey));
CREATE TABLE region (r_regionkey INT, r_name CHARACTER VARYING, r_comment CHARACTER VARYING, PRIMARY KEY (r_regionkey));
CREATE TABLE person (id BIGINT, name CHARACTER VARYING, email_address CHARACTER VARYING, credit_card CHARACTER VARYING, city CHARACTER VARYING, state CHARACTER VARYING, date_time TIMESTAMP, extra CHARACTER VARYING, PRIMARY KEY (id));
CREATE TABLE auction (id BIGINT, item_name CHARACTER VARYING, description CHARACTER VARYING, initial_bid BIGINT, reserve BIGINT, date_time TIMESTAMP, expires TIMESTAMP, seller BIGINT, category BIGINT, extra CHARACTER VARYING, PRIMARY KEY (id));
CREATE TABLE bid (auction BIGINT, bidder BIGINT, price BIGINT, channel CHARACTER VARYING, url CHARACTER VARYING, date_time TIMESTAMP, extra CHARACTER VARYING);
CREATE TABLE alltypes1 (c1 BOOLEAN, c2 SMALLINT, c3 INT, c4 BIGINT, c5 REAL, c6 DOUBLE, c7 NUMERIC, c8 DATE, c9 CHARACTER VARYING, c10 TIME, c11 TIMESTAMP, c13 INTERVAL, c14 STRUCT<a INT>, c15 INT[], c16 CHARACTER VARYING[]);
CREATE TABLE alltypes2 (c1 BOOLEAN, c2 SMALLINT, c3 INT, c4 BIGINT, c5 REAL, c6 DOUBLE, c7 NUMERIC, c8 DATE, c9 CHARACTER VARYING, c10 TIME, c11 TIMESTAMP, c13 INTERVAL, c14 STRUCT<a INT>, c15 INT[], c16 CHARACTER VARYING[]);
CREATE MATERIALIZED VIEW m1 AS SELECT false AS col_0, (t_0.o_shippriority | (SMALLINT '93')) AS col_1, (173425279) AS col_2 FROM orders AS t_0 FULL JOIN partsupp AS t_1 ON t_0.o_orderstatus = t_1.ps_comment WHERE (CASE WHEN ((REAL '19') <> t_1.ps_suppkey) THEN true WHEN false THEN false WHEN true THEN true ELSE (t_1.ps_supplycost = ((1))) END) GROUP BY t_1.ps_partkey, t_0.o_shippriority, t_1.ps_supplycost, t_1.ps_availqty, t_0.o_custkey, t_0.o_orderpriority;
CREATE MATERIALIZED VIEW m2 AS WITH with_0 AS (WITH with_1 AS (SELECT (BIGINT '991') AS col_0, t_2.c1 AS col_1, t_3.r_name AS col_2 FROM alltypes1 AS t_2 LEFT JOIN region AS t_3 ON t_2.c9 = t_3.r_name AND t_2.c1 GROUP BY t_2.c14, t_2.c9, t_3.r_name, t_2.c1, t_2.c16 HAVING t_2.c1) SELECT DATE '2022-03-05' AS col_0, (((avg((SMALLINT '882')) FILTER(WHERE false) + (BIGINT '3330021805915732228')) + (INT '701')) * min(((INT '-2147483648') * ((SMALLINT '848') / (SMALLINT '32767')))) FILTER(WHERE ((BIGINT '616') <> (FLOAT '603')))) AS col_1, '5w48Vq4i6S' AS col_2, (1) AS col_3 FROM with_1) SELECT ((SMALLINT '495') - (count(TIMESTAMP '2022-03-06 04:10:10') FILTER(WHERE true) * (889))) AS col_0 FROM with_0 WHERE false;
CREATE MATERIALIZED VIEW m3 AS SELECT (INT '626') AS col_0 FROM m1 AS t_0 GROUP BY t_0.col_1, t_0.col_0 HAVING t_0.col_0;
CREATE MATERIALIZED VIEW m4 AS SELECT (TIMESTAMP '2022-03-06 04:10:11') AS col_0 FROM alltypes1 AS t_0 LEFT JOIN part AS t_1 ON t_0.c9 = t_1.p_brand WHERE true GROUP BY t_0.c2, t_0.c4, t_0.c8, t_0.c7, t_1.p_partkey, t_0.c11, t_0.c16, t_1.p_container, t_0.c10, t_1.p_size, t_1.p_retailprice, t_1.p_comment;
CREATE MATERIALIZED VIEW m5 AS SELECT sq_2.col_0 AS col_0, ARRAY[(BIGINT '0'), (BIGINT '-9223372036854775808'), (BIGINT '846'), (BIGINT '415')] AS col_1, (ARRAY[(BIGINT '475'), (BIGINT '261'), (BIGINT '-7941424532872074511'), (BIGINT '367')]) AS col_2, (SMALLINT '833') AS col_3 FROM (WITH with_0 AS (SELECT t_1.ps_suppkey AS col_0, (CASE WHEN false THEN t_1.ps_suppkey WHEN false THEN t_1.ps_suppkey WHEN (false) THEN t_1.ps_suppkey ELSE (DATE '2022-03-06' - DATE '2022-03-06') END) AS col_1, (SMALLINT '431') AS col_2, true AS col_3 FROM partsupp AS t_1 WHERE true GROUP BY t_1.ps_comment, t_1.ps_suppkey HAVING true) SELECT (INTERVAL '-86400') AS col_0, (TIMESTAMP '2022-03-06 05:10:10') AS col_1, ARRAY[(BIGINT '590'), (BIGINT '598'), (BIGINT '-5077043438386467438'), (BIGINT '1')] AS col_2 FROM with_0 WHERE true) AS sq_2 GROUP BY sq_2.col_0, sq_2.col_2;
CREATE MATERIALIZED VIEW m6 AS SELECT tumble_0.email_address AS col_0, 'bOwpASpocN' AS col_1, tumble_0.state AS col_2 FROM tumble(person, person.date_time, INTERVAL '12') AS tumble_0 WHERE true GROUP BY tumble_0.state, tumble_0.email_address, tumble_0.id HAVING (((INTERVAL '-60') < TIME '05:10:12') IS TRUE);
CREATE MATERIALIZED VIEW m7 AS SELECT (BIGINT '162') AS col_0, (hop_0.category & (SMALLINT '502')) AS col_1, (((SMALLINT '-27538') & (SMALLINT '0')) % (BIGINT '195')) AS col_2 FROM hop(auction, auction.expires, INTERVAL '55387', INTERVAL '664644') AS hop_0 GROUP BY hop_0.id, hop_0.category, hop_0.date_time, hop_0.extra;
CREATE MATERIALIZED VIEW m8 AS SELECT t_2.description AS col_0, (BIGINT '603') AS col_1, (FLOAT '1962159714') AS col_2 FROM auction AS t_2 GROUP BY t_2.reserve, t_2.initial_bid, t_2.item_name, t_2.description;
CREATE MATERIALIZED VIEW m9 AS SELECT t_2.c15 AS col_0 FROM alltypes2 AS t_2 WHERE true GROUP BY t_2.c14, t_2.c7, t_2.c8, t_2.c9, t_2.c15, t_2.c13, t_2.c11, t_2.c10 HAVING (coalesce(true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL));