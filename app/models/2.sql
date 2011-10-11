--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctor_deseases; Type: TABLE; Schema: public; Owner: vit; Tablespace: 
--

CREATE TABLE doctor_deseases (
    id integer NOT NULL,
    doctor_type_id integer,
    desease_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.doctor_deseases OWNER TO vit;

--
-- Name: doctor_deseases_id_seq; Type: SEQUENCE; Schema: public; Owner: vit
--

CREATE SEQUENCE doctor_deseases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.doctor_deseases_id_seq OWNER TO vit;

--
-- Name: doctor_deseases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vit
--

ALTER SEQUENCE doctor_deseases_id_seq OWNED BY doctor_deseases.id;


--
-- Name: doctor_deseases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vit
--

SELECT pg_catalog.setval('doctor_deseases_id_seq', 56, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vit
--

ALTER TABLE doctor_deseases ALTER COLUMN id SET DEFAULT nextval('doctor_deseases_id_seq'::regclass);


--
-- Data for Name: doctor_deseases; Type: TABLE DATA; Schema: public; Owner: vit
--

INSERT INTO doctor_deseases VALUES (2, 4, 1, '2011-10-05 08:01:27.53574', '2011-10-05 08:01:27.53574');
INSERT INTO doctor_deseases VALUES (3, 4, 6, '2011-10-05 08:04:32.92198', '2011-10-05 08:04:32.92198');
INSERT INTO doctor_deseases VALUES (4, 4, 7, '2011-10-05 08:04:53.066479', '2011-10-05 08:04:53.066479');
INSERT INTO doctor_deseases VALUES (5, 4, 8, '2011-10-05 08:05:01.917086', '2011-10-05 08:05:01.917086');
INSERT INTO doctor_deseases VALUES (6, 4, 9, '2011-10-05 08:05:09.785008', '2011-10-05 08:05:09.785008');
INSERT INTO doctor_deseases VALUES (7, 4, 10, '2011-10-05 08:05:26.42667', '2011-10-05 08:05:26.42667');
INSERT INTO doctor_deseases VALUES (8, 4, 11, '2011-10-05 08:05:37.122696', '2011-10-05 08:05:37.122696');
INSERT INTO doctor_deseases VALUES (9, 5, 12, '2011-10-05 08:08:35.472183', '2011-10-05 08:08:35.472183');
INSERT INTO doctor_deseases VALUES (10, 5, 13, '2011-10-05 08:08:49.579879', '2011-10-05 08:08:49.579879');
INSERT INTO doctor_deseases VALUES (11, 5, 14, '2011-10-05 08:09:00.757068', '2011-10-05 08:09:00.757068');
INSERT INTO doctor_deseases VALUES (12, 5, 15, '2011-10-05 08:09:13.211678', '2011-10-05 08:09:13.211678');
INSERT INTO doctor_deseases VALUES (13, 5, 16, '2011-10-05 08:09:25.75745', '2011-10-05 08:09:25.75745');
INSERT INTO doctor_deseases VALUES (14, 5, 17, '2011-10-05 08:09:39.352407', '2011-10-05 08:09:39.352407');
INSERT INTO doctor_deseases VALUES (15, 2, 18, '2011-10-05 08:10:30.068932', '2011-10-05 08:10:30.068932');
INSERT INTO doctor_deseases VALUES (16, 2, 19, '2011-10-05 08:10:49.806676', '2011-10-05 08:10:49.806676');
INSERT INTO doctor_deseases VALUES (17, 2, 20, '2011-10-05 08:12:30.389303', '2011-10-05 08:12:30.389303');
INSERT INTO doctor_deseases VALUES (18, 2, 21, '2011-10-05 08:12:46.35265', '2011-10-05 08:12:46.35265');
INSERT INTO doctor_deseases VALUES (19, 6, 22, '2011-10-05 08:13:03.923994', '2011-10-05 08:13:03.923994');
INSERT INTO doctor_deseases VALUES (20, 6, 23, '2011-10-05 08:13:23.134566', '2011-10-05 08:13:23.134566');
INSERT INTO doctor_deseases VALUES (21, 7, 24, '2011-10-05 08:14:01.821556', '2011-10-05 08:14:01.821556');
INSERT INTO doctor_deseases VALUES (22, 7, 25, '2011-10-05 08:14:20.385987', '2011-10-05 08:14:20.385987');
INSERT INTO doctor_deseases VALUES (23, 7, 26, '2011-10-05 08:14:45.619418', '2011-10-05 08:14:45.619418');
INSERT INTO doctor_deseases VALUES (24, 7, 27, '2011-10-05 08:15:00.81513', '2011-10-05 08:15:00.81513');
INSERT INTO doctor_deseases VALUES (25, 7, 28, '2011-10-05 08:15:45.85319', '2011-10-05 08:15:45.85319');
INSERT INTO doctor_deseases VALUES (26, 7, 29, '2011-10-05 08:16:19.56224', '2011-10-05 08:16:19.56224');
INSERT INTO doctor_deseases VALUES (27, 8, 30, '2011-10-05 08:16:53.230011', '2011-10-05 08:16:53.230011');
INSERT INTO doctor_deseases VALUES (28, 8, 31, '2011-10-05 08:17:18.550645', '2011-10-05 08:17:18.550645');
INSERT INTO doctor_deseases VALUES (29, 8, 32, '2011-10-05 08:17:45.652265', '2011-10-05 08:17:45.652265');
INSERT INTO doctor_deseases VALUES (30, 8, 33, '2011-10-05 08:18:21.420784', '2011-10-05 08:18:21.420784');
INSERT INTO doctor_deseases VALUES (31, 8, 34, '2011-10-05 08:29:16.030548', '2011-10-05 08:29:16.030548');
INSERT INTO doctor_deseases VALUES (32, 8, 35, '2011-10-05 08:29:49.776936', '2011-10-05 08:29:49.776936');
INSERT INTO doctor_deseases VALUES (33, 8, 36, '2011-10-05 08:30:11.937782', '2011-10-05 08:30:11.937782');
INSERT INTO doctor_deseases VALUES (34, 8, 37, '2011-10-05 08:30:26.885037', '2011-10-05 08:30:26.885037');
INSERT INTO doctor_deseases VALUES (35, 8, 36, '2011-10-05 08:30:42.415876', '2011-10-05 08:30:42.415876');
INSERT INTO doctor_deseases VALUES (36, 9, 39, '2011-10-05 08:31:05.240315', '2011-10-05 08:31:05.240315');
INSERT INTO doctor_deseases VALUES (37, 9, 40, '2011-10-05 08:31:18.942154', '2011-10-05 08:31:18.942154');
INSERT INTO doctor_deseases VALUES (38, 9, 41, '2011-10-05 08:31:30.61688', '2011-10-05 08:31:30.61688');
INSERT INTO doctor_deseases VALUES (39, 9, 42, '2011-10-05 08:31:43.731758', '2011-10-05 08:31:43.731758');
INSERT INTO doctor_deseases VALUES (40, 9, 43, '2011-10-05 08:31:59.374003', '2011-10-05 08:31:59.374003');
INSERT INTO doctor_deseases VALUES (41, 9, 44, '2011-10-05 08:32:17.178996', '2011-10-05 08:32:17.178996');
INSERT INTO doctor_deseases VALUES (42, 9, 45, '2011-10-05 08:33:01.832225', '2011-10-05 08:33:01.832225');
INSERT INTO doctor_deseases VALUES (43, 9, 46, '2011-10-05 08:33:15.011221', '2011-10-05 08:33:15.011221');
INSERT INTO doctor_deseases VALUES (44, 9, 47, '2011-10-05 08:33:32.184727', '2011-10-05 08:33:32.184727');
INSERT INTO doctor_deseases VALUES (45, 9, 48, '2011-10-05 08:33:45.451572', '2011-10-05 08:33:45.451572');
INSERT INTO doctor_deseases VALUES (46, 9, 49, '2011-10-05 08:34:00.500946', '2011-10-05 08:34:00.500946');
INSERT INTO doctor_deseases VALUES (47, 10, 50, '2011-10-05 08:34:23.345823', '2011-10-05 08:34:23.345823');
INSERT INTO doctor_deseases VALUES (48, 10, 51, '2011-10-05 08:34:44.718698', '2011-10-05 08:34:44.718698');
INSERT INTO doctor_deseases VALUES (49, 10, 52, '2011-10-05 08:35:04.437953', '2011-10-05 08:35:04.437953');
INSERT INTO doctor_deseases VALUES (50, 10, 53, '2011-10-05 08:35:18.122552', '2011-10-05 08:35:18.122552');
INSERT INTO doctor_deseases VALUES (51, 10, 54, '2011-10-05 08:35:34.909241', '2011-10-05 08:35:34.909241');
INSERT INTO doctor_deseases VALUES (52, 10, 55, '2011-10-05 08:35:51.772525', '2011-10-05 08:35:51.772525');
INSERT INTO doctor_deseases VALUES (53, 10, 44, '2011-10-05 08:36:24.444385', '2011-10-05 08:36:24.444385');
INSERT INTO doctor_deseases VALUES (54, 10, 56, '2011-10-05 08:36:39.300737', '2011-10-05 08:36:39.300737');
INSERT INTO doctor_deseases VALUES (55, 10, 58, '2011-10-05 08:37:45.094654', '2011-10-05 08:37:45.094654');
INSERT INTO doctor_deseases VALUES (56, 10, 57, '2011-10-05 08:37:58.049855', '2011-10-05 08:37:58.049855');


--
-- Name: doctor_deseases_pkey; Type: CONSTRAINT; Schema: public; Owner: vit; Tablespace: 
--

ALTER TABLE ONLY doctor_deseases
    ADD CONSTRAINT doctor_deseases_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

