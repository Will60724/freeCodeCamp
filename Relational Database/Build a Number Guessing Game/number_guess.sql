--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (15, 'user_1736912650516', 0, NULL);
INSERT INTO public.users VALUES (1, 'will', 1, 9);
INSERT INTO public.users VALUES (16, 'user_1736912650515', 0, NULL);
INSERT INTO public.users VALUES (2, 'mag', 2, 13);
INSERT INTO public.users VALUES (18, 'user_1736912846902', 2, 219);
INSERT INTO public.users VALUES (4, 'user_1736912146602', 2, 321);
INSERT INTO public.users VALUES (17, 'user_1736912846903', 5, 41);
INSERT INTO public.users VALUES (3, 'user_1736912146603', 5, 113);
INSERT INTO public.users VALUES (34, 'user_1736913450992', 2, 114);
INSERT INTO public.users VALUES (20, 'user_1736912941939', 2, 816);
INSERT INTO public.users VALUES (6, 'user_1736912193459', 2, 565);
INSERT INTO public.users VALUES (33, 'user_1736913450993', 5, 226);
INSERT INTO public.users VALUES (19, 'user_1736912941940', 5, 26);
INSERT INTO public.users VALUES (5, 'user_1736912193460', 5, 468);
INSERT INTO public.users VALUES (8, 'user_1736912476886', 2, 252);
INSERT INTO public.users VALUES (22, 'user_1736913042047', 2, 314);
INSERT INTO public.users VALUES (7, 'user_1736912476887', 5, 14);
INSERT INTO public.users VALUES (36, 'user_1736914288177', 2, 396);
INSERT INTO public.users VALUES (21, 'user_1736913042048', 5, 110);
INSERT INTO public.users VALUES (10, 'user_1736912497201', 2, 115);
INSERT INTO public.users VALUES (9, 'user_1736912497202', 5, 221);
INSERT INTO public.users VALUES (35, 'user_1736914288178', 5, 373);
INSERT INTO public.users VALUES (24, 'user_1736913106272', 2, 157);
INSERT INTO public.users VALUES (12, 'user_1736912521564', 2, 296);
INSERT INTO public.users VALUES (11, 'user_1736912521565', 5, 19);
INSERT INTO public.users VALUES (23, 'user_1736913106273', 5, 343);
INSERT INTO public.users VALUES (14, 'user_1736912552296', 2, 231);
INSERT INTO public.users VALUES (13, 'user_1736912552297', 5, 201);
INSERT INTO public.users VALUES (26, 'user_1736913166369', 2, 343);
INSERT INTO public.users VALUES (38, 'user_1736914455698', 2, 767);
INSERT INTO public.users VALUES (25, 'user_1736913166370', 5, 142);
INSERT INTO public.users VALUES (37, 'user_1736914455699', 5, 239);
INSERT INTO public.users VALUES (28, 'user_1736913227957', 2, 284);
INSERT INTO public.users VALUES (27, 'user_1736913227958', 5, 140);
INSERT INTO public.users VALUES (40, 'user_1736914487271', 2, 668);
INSERT INTO public.users VALUES (30, 'user_1736913254826', 2, 385);
INSERT INTO public.users VALUES (29, 'user_1736913254827', 5, 150);
INSERT INTO public.users VALUES (39, 'user_1736914487272', 5, 276);
INSERT INTO public.users VALUES (32, 'user_1736913388099', 2, 507);
INSERT INTO public.users VALUES (31, 'user_1736913388100', 5, 560);
INSERT INTO public.users VALUES (42, 'user_1736914516643', 2, 342);
INSERT INTO public.users VALUES (41, 'user_1736914516644', 5, 52);
INSERT INTO public.users VALUES (44, 'user_1736914612865', 2, 486);
INSERT INTO public.users VALUES (43, 'user_1736914612866', 5, 18);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 44, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

