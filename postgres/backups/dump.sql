--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-03 13:35:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "vue-db" WITH (FORCE);
--
-- TOC entry 3461 (class 1262 OID 16384)
-- Name: vue-db; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "vue-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\connect -reuse-previous=on "dbname='vue-db'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 856 (class 1247 OID 24577)
-- Name: action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.action AS ENUM (
    'read',
    'create',
    'update',
    'delete'
);


--
-- TOC entry 859 (class 1247 OID 24586)
-- Name: clearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.clearance AS ENUM (
    'denied',
    'if_owned',
    'allowed'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 24593)
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts (
    login text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    user_id integer,
    active boolean DEFAULT false NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 24598)
-- Name: departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departments (
    dep_id integer NOT NULL,
    name text NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 24603)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 216
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.dep_id;


--
-- TOC entry 217 (class 1259 OID 24604)
-- Name: permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissions (
    perm_id integer NOT NULL,
    table_name text NOT NULL,
    clearance public.clearance NOT NULL,
    system_role integer NOT NULL,
    action public.action NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 24609)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 218
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.perm_id;


--
-- TOC entry 219 (class 1259 OID 24610)
-- Name: positions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.positions (
    pos_id integer NOT NULL,
    name text NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 24615)
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 220
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.pos_id;


--
-- TOC entry 221 (class 1259 OID 24616)
-- Name: project_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_roles (
    proj_role_id integer NOT NULL,
    name text NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 24621)
-- Name: project_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 222
-- Name: project_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_roles_id_seq OWNED BY public.project_roles.proj_role_id;


--
-- TOC entry 223 (class 1259 OID 24622)
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    proj_id integer NOT NULL,
    name text NOT NULL,
    start date NOT NULL,
    "end" date,
    description text NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 24627)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 224
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.proj_id;


--
-- TOC entry 225 (class 1259 OID 24628)
-- Name: skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- TOC entry 226 (class 1259 OID 24633)
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 226
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.skill_id;


--
-- TOC entry 227 (class 1259 OID 24634)
-- Name: system_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.system_roles (
    system_role_id integer NOT NULL,
    name text NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 24639)
-- Name: system_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.system_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 228
-- Name: system_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.system_roles_id_seq OWNED BY public.system_roles.system_role_id;


--
-- TOC entry 229 (class 1259 OID 24640)
-- Name: user_x_project_x_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_x_project_x_role (
    "user" integer NOT NULL,
    project_role integer,
    project integer NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 24643)
-- Name: user_x_skill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_x_skill (
    "user" integer NOT NULL,
    skill integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 24646)
-- Name: user_x_sys_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_x_sys_role (
    "user" integer NOT NULL,
    system_role integer NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 24649)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    patronymic text NOT NULL,
    department integer,
    "position" integer
);


--
-- TOC entry 233 (class 1259 OID 24654)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3254 (class 2604 OID 32271)
-- Name: departments dep_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments ALTER COLUMN dep_id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 32272)
-- Name: permissions perm_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions ALTER COLUMN perm_id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 32273)
-- Name: positions pos_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.positions ALTER COLUMN pos_id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 32274)
-- Name: project_roles proj_role_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_roles ALTER COLUMN proj_role_id SET DEFAULT nextval('public.project_roles_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 32275)
-- Name: projects proj_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN proj_id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 32276)
-- Name: skills skill_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- TOC entry 3260 (class 2604 OID 32277)
-- Name: system_roles system_role_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_roles ALTER COLUMN system_role_id SET DEFAULT nextval('public.system_roles_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 32278)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3436 (class 0 OID 24593)
-- Dependencies: 214
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts (login, password, email, user_id, active) FROM stdin;
sss	$argon2id$v=19$m=65536,t=3,p=4$AM6i+Sddqr2PYY+8ThcJvw$rEYscFBFqq+1ErAqlHxgyIg1ABbW0+08BoZP2DqABeg	aaa.aaa@aaa.com	\N	t
dsa	$argon2id$v=19$m=65536,t=3,p=4$pxuokpYeegvFfltsyE2EZg$ZXOEJoLqyQor2bW+yufiDWyONNXgwT3dpkUbhwu0o/k	dadsadasdsada	\N	t
dsaa	$argon2id$v=19$m=65536,t=3,p=4$2qMf4mcizJwM9V1TdtTu3g$OStmhfp/hugAJPh66Rwn4K9ETq6xmpxCCLjSsncCh1c	sadsad	\N	t
\.


--
-- TOC entry 3437 (class 0 OID 24598)
-- Dependencies: 215
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.departments (dep_id, name) FROM stdin;
1	AS400
7	sdssds
8	sdsc
9	sadsadsadsada
10	aaaaaaaaaa
11	sddssd
12	asdwewq
13	aaa
5	saaaaske
6	Коноха
\.


--
-- TOC entry 3439 (class 0 OID 24604)
-- Dependencies: 217
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.permissions (perm_id, table_name, clearance, system_role, action) FROM stdin;
\.


--
-- TOC entry 3441 (class 0 OID 24610)
-- Dependencies: 219
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.positions (pos_id, name) FROM stdin;
2	Middle Data Engineer
3	Senior C++ developer
4	System Architect
5	CEO
30	wqe
31	qwew
\.


--
-- TOC entry 3443 (class 0 OID 24616)
-- Dependencies: 221
-- Data for Name: project_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project_roles (proj_role_id, name) FROM stdin;
3	Operator
6	Viewer
7	swag
2	Administrator
\.


--
-- TOC entry 3445 (class 0 OID 24622)
-- Dependencies: 223
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects (proj_id, name, start, "end", description) FROM stdin;
7	qwqwwq	2022-11-08	2022-11-19	qwwwww
2	Work	2022-11-12	2022-11-26	Роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать 
1	Studysn	2000-01-02	2022-11-26	nnnnnn
\.


--
-- TOC entry 3447 (class 0 OID 24628)
-- Dependencies: 225
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.skills (skill_id, name, description) FROM stdin;
3	Java	\N
4	JavaScript	\N
5	Architecture	\N
6	Databases	\N
7	SQL	\N
8	C++	\N
9	C#	\N
10	Коммуникабельность	\N
11	sssss	sssss
12	пык	пек
1	wrokaholic	23324
2	Python	\N
13	sdsddssddsc	xxxxxxxxxxxxxx
\.


--
-- TOC entry 3449 (class 0 OID 24634)
-- Dependencies: 227
-- Data for Name: system_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.system_roles (system_role_id, name) FROM stdin;
1	admin
3	junior dev
2	middle dev
4	HR
\.


--
-- TOC entry 3451 (class 0 OID 24640)
-- Dependencies: 229
-- Data for Name: user_x_project_x_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_x_project_x_role ("user", project_role, project) FROM stdin;
1	6	7
2	3	2
19	\N	7
1	\N	2
3	3	1
2	2	1
20	3	1
19	7	1
1	6	1
\.


--
-- TOC entry 3452 (class 0 OID 24643)
-- Dependencies: 230
-- Data for Name: user_x_skill; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_x_skill ("user", skill) FROM stdin;
1	4
1	5
3	5
1	7
1	8
1	9
1	10
3	10
1	11
1	2
1	3
20	8
20	9
2	6
2	10
2	11
2	1
3	11
3	12
3	7
3	6
3	3
3	4
3	1
3	8
3	2
3	9
19	10
19	6
19	5
19	4
19	3
\.


--
-- TOC entry 3453 (class 0 OID 24646)
-- Dependencies: 231
-- Data for Name: user_x_sys_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_x_sys_role ("user", system_role) FROM stdin;
1	2
2	2
3	2
\.


--
-- TOC entry 3454 (class 0 OID 24649)
-- Dependencies: 232
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, name, surname, patronymic, department, "position") FROM stdin;
20	Ивашка	Дурашкович	Дурашка	8	4
1	sadad	sda	patr	1	2
2	Ivan	sfdfsdfsv	Ivanovich	8	2
19	Ыыы	Ыыывов	Ывовичь	9	5
26	sdbg	ads	,,,mnnn	\N	3
3	Petr	Petrov	Petrovich	1	3
\.


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 216
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.departments_id_seq', 1, false);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 218
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.permissions_id_seq', 2, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 220
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.positions_id_seq', 1, false);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 222
-- Name: project_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.project_roles_id_seq', 1, false);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 224
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 226
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.skills_id_seq', 1, false);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 228
-- Name: system_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.system_roles_id_seq', 4, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- TOC entry 3265 (class 2606 OID 24664)
-- Name: departments departments_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pk PRIMARY KEY (dep_id);


--
-- TOC entry 3268 (class 2606 OID 24666)
-- Name: positions positions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pk PRIMARY KEY (pos_id);


--
-- TOC entry 3270 (class 2606 OID 24668)
-- Name: project_roles project_roles_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT project_roles_pk PRIMARY KEY (proj_role_id);


--
-- TOC entry 3272 (class 2606 OID 24670)
-- Name: projects projects_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pk PRIMARY KEY (proj_id);


--
-- TOC entry 3274 (class 2606 OID 24672)
-- Name: skills skills_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pk PRIMARY KEY (skill_id);


--
-- TOC entry 3280 (class 2606 OID 24674)
-- Name: user_x_sys_role system_clearance_person_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_sys_role
    ADD CONSTRAINT system_clearance_person_key UNIQUE ("user");


--
-- TOC entry 3276 (class 2606 OID 24676)
-- Name: system_roles system_roles_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_roles
    ADD CONSTRAINT system_roles_pk PRIMARY KEY (system_role_id);


--
-- TOC entry 3282 (class 2606 OID 24678)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- TOC entry 3262 (class 1259 OID 24679)
-- Name: accounts_email_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX accounts_email_idx ON public.accounts USING btree (email);


--
-- TOC entry 3263 (class 1259 OID 24680)
-- Name: accounts_login_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX accounts_login_idx ON public.accounts USING btree (login);


--
-- TOC entry 3266 (class 1259 OID 24681)
-- Name: permissions_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX permissions_id_idx ON public.permissions USING btree (perm_id);


--
-- TOC entry 3277 (class 1259 OID 24682)
-- Name: project_clearance_person_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX project_clearance_person_idx ON public.user_x_project_x_role USING btree ("user", project);


--
-- TOC entry 3278 (class 1259 OID 24683)
-- Name: user_x_skill_user_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX user_x_skill_user_idx ON public.user_x_skill USING btree ("user", skill);


--
-- TOC entry 3283 (class 2606 OID 24684)
-- Name: accounts accounts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 3284 (class 2606 OID 24689)
-- Name: permissions permissions_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_fk FOREIGN KEY (system_role) REFERENCES public.system_roles(system_role_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3285 (class 2606 OID 24694)
-- Name: user_x_project_x_role project_clearance_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_project_x_role
    ADD CONSTRAINT project_clearance_fk0 FOREIGN KEY ("user") REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3286 (class 2606 OID 24699)
-- Name: user_x_project_x_role project_clearance_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_project_x_role
    ADD CONSTRAINT project_clearance_fk1 FOREIGN KEY (project_role) REFERENCES public.project_roles(proj_role_id) ON DELETE SET NULL;


--
-- TOC entry 3287 (class 2606 OID 24704)
-- Name: user_x_project_x_role project_clearance_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_project_x_role
    ADD CONSTRAINT project_clearance_fk2 FOREIGN KEY (project) REFERENCES public.projects(proj_id) ON DELETE CASCADE;


--
-- TOC entry 3288 (class 2606 OID 24709)
-- Name: user_x_skill skill_allocation_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_skill
    ADD CONSTRAINT skill_allocation_fk0 FOREIGN KEY ("user") REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3289 (class 2606 OID 24714)
-- Name: user_x_skill skill_allocation_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_skill
    ADD CONSTRAINT skill_allocation_fk1 FOREIGN KEY (skill) REFERENCES public.skills(skill_id) ON DELETE CASCADE;


--
-- TOC entry 3290 (class 2606 OID 24719)
-- Name: user_x_sys_role system_clearance_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_sys_role
    ADD CONSTRAINT system_clearance_fk0 FOREIGN KEY ("user") REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3291 (class 2606 OID 24724)
-- Name: user_x_sys_role system_clearance_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_x_sys_role
    ADD CONSTRAINT system_clearance_fk1 FOREIGN KEY (system_role) REFERENCES public.system_roles(system_role_id) ON DELETE CASCADE;


--
-- TOC entry 3292 (class 2606 OID 24729)
-- Name: users users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk FOREIGN KEY (department) REFERENCES public.departments(dep_id) ON DELETE SET NULL;


--
-- TOC entry 3293 (class 2606 OID 24734)
-- Name: users users_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk1 FOREIGN KEY ("position") REFERENCES public.positions(pos_id) ON DELETE SET NULL;


-- Completed on 2023-01-03 13:35:38

--
-- PostgreSQL database dump complete
--

