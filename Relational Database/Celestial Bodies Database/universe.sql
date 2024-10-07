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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    event_name character varying(30) NOT NULL,
    event_type character varying(30) NOT NULL,
    description text,
    date_of_event date NOT NULL,
    observed_from_earth boolean NOT NULL,
    happened_or_not boolean NOT NULL,
    planet_name character varying(30) NOT NULL,
    star_name character varying(30) NOT NULL,
    galaxy_name character varying(30) NOT NULL,
    distance_from_earth integer NOT NULL,
    intensity numeric(10,2) NOT NULL,
    name character varying(20)
);


ALTER TABLE public.event OWNER TO freecodecamp;

--
-- Name: event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_event_id_seq OWNER TO freecodecamp;

--
-- Name: event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.event_event_id_seq OWNED BY public.event.event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    has_star boolean NOT NULL,
    age_in_millions_of_years numeric(4,1) NOT NULL,
    star_num_in_billion integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying(30) NOT NULL,
    moon_type character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    planet_name character varying(30) NOT NULL,
    distance_from_earth integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying(30) NOT NULL,
    planet_type character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    has_satellite boolean NOT NULL,
    is_spherical boolean NOT NULL,
    satellite_num integer NOT NULL,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    star_name character varying(30) NOT NULL,
    distance_from_earth integer,
    name character varying(20)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(30) NOT NULL,
    star_type character varying(30) NOT NULL,
    description text,
    planet_num integer NOT NULL,
    has_life boolean NOT NULL,
    has_planet boolean NOT NULL,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    galaxy_name character varying(30) NOT NULL,
    name character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: event event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.event ALTER COLUMN event_id SET DEFAULT nextval('public.event_event_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.event VALUES (1, 'Solar_Flare_2023', 'Solar_Flare', 'Intense burst of radiation from the Sun', '2023-08-10', true, true, 'Earth', 'Sun', 'Milky Way', 0, 1.00, NULL);
INSERT INTO public.event VALUES (2, 'Solar_Flare_2022', 'Solar_Flare', 'Intense burst of radiation from the Sun', '2022-08-10', true, true, 'Earth', 'Sun', 'Milky Way', 0, 2.00, NULL);
INSERT INTO public.event VALUES (3, 'Solar_Flare_2021', 'Solar_Flare', 'Intense burst of radiation from the Sun', '2021-08-10', true, true, 'Earth', 'Sun', 'Milky Way', 0, 3.00, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'The galaxy that contains our Solar System.', true, true, 13.8, 100, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The closest spiral galaxy to the Milky Way.', true, true, 10.0, 1000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A member of the Local Group of galaxies.', true, true, 3.0, 40, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral', 'Known for its beautiful spiral structure.', false, true, 1.5, 300, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Spiral', 'Features a bright bulge and a prominent dust lane.', true, true, 10.0, 800, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 'A satellite galaxy of the Milky Way.', false, true, 3.0, 10, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural', 'Earths only natural satellite, influences tides.', false, true, 4500.00, 'Earth', 0, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural', 'A small and irregularly shaped moon of Mars.', false, false, 4503.00, 'Mars', 225, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural', 'Mars smaller moon, with a smooth, cratered surface.', false, false, 4503.00, 'Mars', 225, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 'Natural', 'Icy moon of Jupiter, suspected to have an ocean beneath.', false, true, 4503.00, 'Jupiter', 628, NULL);
INSERT INTO public.moon VALUES (5, 'Io', 'Natural', 'Volcanically active moon orbiting Jupiter.', false, true, 4503.00, 'Jupiter', 628, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Natural', 'The largest moon in the Solar System, orbits Jupiter.', false, true, 4503.00, 'Jupiter', 628, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Natural', 'Heavily cratered and ancient moon of Jupiter.', false, true, 4503.00, 'Jupiter', 628, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 'Natural', 'Saturns largest moon, has a thick atmosphere and lakes of methane.', false, true, 4503.00, 'Saturn', 1430, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Natural', 'Icy moon of Saturn, known for geysers of water vapor.', false, true, 4503.00, 'Saturn', 1430, NULL);
INSERT INTO public.moon VALUES (10, 'Triton', 'Natural', 'Neptunes largest moon, retrograde orbit and icy surface.', false, true, 4503.00, 'Neptune', 4350, NULL);
INSERT INTO public.moon VALUES (11, 'Oberon', 'Natural', 'A large moon of Uranus, heavily cratered and icy.', false, true, 4503.00, 'Uranus', 2875, NULL);
INSERT INTO public.moon VALUES (12, 'Titania', 'Natural', 'The largest moon of Uranus, shows signs of past geological activity.', false, true, 4503.00, 'Uranus', 2875, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 'Natural', 'Small moon of Uranus with extreme surface features.', false, true, 4503.00, 'Uranus', 2875, NULL);
INSERT INTO public.moon VALUES (15, 'Kepler-22b-1', 'Exomoon', 'Hypothetical exomoon orbiting the exoplanet Kepler-22b.', false, true, 6000.00, 'Kepler-22b', 1400, NULL);
INSERT INTO public.moon VALUES (16, 'Proxima-b-1', 'Exomoon', 'Potential moon orbiting Proxima b, the closest exoplanet to Earth.', false, true, 4850.00, 'Proxima_b', 4, NULL);
INSERT INTO public.moon VALUES (17, 'Gliese-581g-1', 'Exomoon', 'Hypothetical exomoon of Gliese 581g, potentially habitable.', false, true, 7000.00, 'Gliese_581g', 20, NULL);
INSERT INTO public.moon VALUES (18, 'HD189733b-1', 'Exomoon', 'Potential exomoon orbiting HD 189733b, possibly stormy.', false, true, 6300.00, 'HD_189733b', 63, NULL);
INSERT INTO public.moon VALUES (19, 'Mercury-M1', 'Artificial', 'Hypothetical artificial satellite orbiting Mercury for research purposes.', false, false, 0.00, 'Mercury', 77, NULL);
INSERT INTO public.moon VALUES (20, 'Venus-Moon1', 'Artificial', 'Hypothetical artificial satellite orbiting Venus.', false, false, 0.00, 'Venus', 42, NULL);
INSERT INTO public.moon VALUES (14, 'Proteus', 'Natural', 'Largest moon of Pluto, shares a binary relationship with its planet.', false, true, 4503.00, 'Neptune', 7500, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 'The only planet known to have life.', true, true, true, 1, 4543.00, 'Sun', 0, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 'Known as the Red Planet, may have had water in the past.', false, true, true, 2, 4603.00, 'Sun', 225, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas_Giant', 'The largest planet in our Solar System.', false, true, true, 79, 4503.00, 'Sun', 778, NULL);
INSERT INTO public.planet VALUES (4, 'Venus', 'Terrestrial', 'Hottest planet in the Solar System due to thick atmosphere.', false, false, true, 0, 4543.00, 'Sun', 42, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas_Giant', 'Famous for its stunning ring system.', false, true, true, 83, 4503.00, 'Sun', 1430, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice_Giant', 'The farthest planet from the Sun.', false, true, true, 14, 4503.00, 'Sun', 4350, NULL);
INSERT INTO public.planet VALUES (8, 'Proxima_b', 'Terrestrial', 'Orbits Proxima Centauri, potentially habitable.', false, true, true, 0, 4850.00, 'Proxima_Centauri', 4, NULL);
INSERT INTO public.planet VALUES (9, 'Uranus', 'Ice_Giant', 'Rotates on its side and has faint rings.', false, true, true, 27, 4503.00, 'Sun', 2875, NULL);
INSERT INTO public.planet VALUES (11, 'Mercury', 'Terrestrial', 'The smallest planet and closest to the Sun.', false, false, true, 0, 4503.00, 'Sun', 77, NULL);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 'Super-Earth', 'A potentially habitable exoplanet.', false, true, true, 0, 6000.00, 'Kepler-22', 1400, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese_581g', 'Super-Earth', 'An exoplanet that might support life.', false, true, true, 0, 7000.00, 'Sirius', 20, NULL);
INSERT INTO public.planet VALUES (12, 'HD_189733b', 'Gas_Giant', 'A gas giant with blue skies and violent weather.', false, false, true, 0, 6300.00, 'Sirius', 63, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red Supergiant', 'A massive star nearing the end of its life cycle.', 0, false, false, 10.00, 'Milky Way', NULL);
INSERT INTO public.star VALUES (4, 'Kepler-22', 'Sun-like', 'A bright star known for its multiple planets.', 5, true, true, 2.00, 'Milky Way', NULL);
INSERT INTO public.star VALUES (5, 'Sirius', 'Main Sequence', 'An important star for navigation and astronomy.', 1, true, true, 200.00, 'Milky Way', NULL);
INSERT INTO public.star VALUES (6, 'T_Tau', 'T_Tauri', 'A young star still forming its planetary system.', 2, true, true, 1.00, 'Milky Way', NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'G-type Main Sequence', 'The star at the center of our Solar System.', 9, true, true, 4600.00, 'Milky Way', NULL);
INSERT INTO public.star VALUES (2, 'Proxima_Centauri', 'Red Dwarf', 'A well-studied star with a planetary system.', 3, true, true, 4.80, 'Milky Way', NULL);


--
-- Name: event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.event_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: event event_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_event_name_key UNIQUE (event_name);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--

