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
CREATE MATERIALIZED VIEW m0 AS WITH with_0 AS (SELECT (REAL '205') AS col_0 FROM nation AS t_1 WHERE true GROUP BY t_1.n_name HAVING (((SMALLINT '893') + ((BIGINT '-7518917497657607782') + (BIGINT '554'))) <> (REAL '219'))) SELECT ((BIGINT '801') + (BIGINT '0')) AS col_0, DATE '2021-12-19' AS col_1, DATE '2021-12-13' AS col_2 FROM with_0;
CREATE MATERIALIZED VIEW m1 AS SELECT t_0.p_comment AS col_0, (split_part(t_0.p_brand, min(t_0.p_comment), ((SMALLINT '238') + (INT '928968434')))) AS col_1, (t_0.p_size > (SMALLINT '0')) AS col_2 FROM part AS t_0 GROUP BY t_0.p_name, t_0.p_brand, t_0.p_comment, t_0.p_size;
CREATE MATERIALIZED VIEW m2 AS WITH with_0 AS (SELECT t_1.col_0 AS col_0, (CASE WHEN t_1.col_2 THEN t_1.col_2 ELSE (false) END) AS col_1, t_1.col_0 AS col_2, true AS col_3 FROM m1 AS t_1 WHERE t_1.col_2 GROUP BY t_1.col_2, t_1.col_0) SELECT (CASE WHEN true THEN (REAL '564316825') WHEN true THEN (REAL '781') ELSE (REAL '526') END) AS col_0, (INT '764') AS col_1, (SMALLINT '28419') AS col_2, DATE '2021-12-20' AS col_3 FROM with_0 WHERE false;
CREATE MATERIALIZED VIEW m3 AS WITH with_0 AS (WITH with_1 AS (WITH with_2 AS (SELECT t_4.c2 AS col_0, ((((t_3.o_orderkey | (INT '431')) & t_4.c2) % (INT '650')) | t_4.c2) AS col_1, (INTERVAL '-1') AS col_2 FROM orders AS t_3 JOIN alltypes2 AS t_4 ON t_3.o_orderkey = t_4.c4 GROUP BY t_3.o_orderkey, t_4.c13, t_3.o_orderdate, t_4.c2, t_4.c6, t_4.c4, t_4.c11, t_4.c16, t_3.o_orderstatus, t_4.c10 HAVING false) SELECT (INT '317') AS col_0, TIMESTAMP '2021-12-15 17:50:19' AS col_1, 'pMLFyztRtb' AS col_2, (402887959) AS col_3 FROM with_2) SELECT (ARRAY[(FLOAT '278030729'), (FLOAT '797'), (FLOAT '1')]) AS col_0, (128) AS col_1, CAST(NULL AS STRUCT<a DATE, b DATE>) AS col_2 FROM with_1) SELECT (SMALLINT '198') AS col_0 FROM with_0 WHERE true;
CREATE MATERIALIZED VIEW m4 AS SELECT (SMALLINT '836') AS col_0 FROM hop(alltypes2, alltypes2.c11, INTERVAL '86400', INTERVAL '3628800') AS hop_0 GROUP BY hop_0.c8 HAVING false;
CREATE MATERIALIZED VIEW m6 AS SELECT tumble_0.c11 AS col_0, ((FLOAT '176')) AS col_1, (tumble_0.c4 & (tumble_0.c2 + (INT '569'))) AS col_2 FROM tumble(alltypes1, alltypes1.c11, INTERVAL '99') AS tumble_0 WHERE tumble_0.c1 GROUP BY tumble_0.c4, tumble_0.c1, tumble_0.c2, tumble_0.c8, tumble_0.c14, tumble_0.c11, tumble_0.c5 HAVING tumble_0.c1;
CREATE MATERIALIZED VIEW m7 AS SELECT tumble_0.c1 AS col_0, tumble_0.c3 AS col_1 FROM tumble(alltypes2, alltypes2.c11, INTERVAL '42') AS tumble_0 GROUP BY tumble_0.c11, tumble_0.c6, tumble_0.c16, tumble_0.c14, tumble_0.c4, tumble_0.c1, tumble_0.c3;
CREATE MATERIALIZED VIEW m8 AS SELECT (- hop_0.seller) AS col_0, hop_0.seller AS col_1, hop_0.seller AS col_2, (FLOAT '0') AS col_3 FROM hop(auction, auction.date_time, INTERVAL '3600', INTERVAL '331200') AS hop_0 GROUP BY hop_0.item_name, hop_0.seller, hop_0.id, hop_0.reserve;
CREATE MATERIALIZED VIEW m9 AS SELECT (INT '2147483647') AS col_0, tumble_0.channel AS col_1 FROM tumble(bid, bid.date_time, INTERVAL '43') AS tumble_0 WHERE true GROUP BY tumble_0.price, tumble_0.extra, tumble_0.channel HAVING (tumble_0.price <> ((INT '1') * (822)));