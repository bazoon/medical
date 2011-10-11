SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

COPY refdoctor_types (id, name, created_at, updated_at) FROM stdin;
1	Терапевт	2011-10-03 04:01:38.619865	2011-10-03 04:01:38.619865
2	Хирург 	2011-10-03 04:01:46.391956	2011-10-03 04:02:05.179372
4	Офтальмолог	2011-10-05 07:31:06.549488	2011-10-05 07:31:06.549488
5	Лор	2011-10-05 07:31:13.234007	2011-10-05 07:31:13.234007
6	Онколог	2011-10-05 07:31:20.469887	2011-10-05 07:31:20.469887
7	Уролог	2011-10-05 07:31:27.805075	2011-10-05 07:31:27.805075
8	Гинеколог	2011-10-05 07:31:35.595103	2011-10-05 07:31:35.595103
9	Эндокринолог	2011-10-05 07:31:45.499681	2011-10-05 07:31:45.499681
10	Невролог	2011-10-05 07:31:53.987547	2011-10-05 07:31:53.987547
\.
