--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: classification; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.classification (
    classification_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_classification character varying(20)
);


ALTER TABLE public.classification OWNER TO freecodecamp;

--
-- Name: classification_classification_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.classification_classification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classification_classification_id_seq OWNER TO freecodecamp;

--
-- Name: classification_classification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.classification_classification_id_seq OWNED BY public.classification.classification_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type text,
    number_of_stars text,
    age character varying(30),
    size_in_light_years numeric(6,3)
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
    name character varying(30),
    category character varying(30),
    orbits_direction character varying(30),
    discovery_date integer,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    size_km numeric(6,1),
    is_habitable boolean,
    number_moons integer,
    star_id integer NOT NULL
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
    name character varying(30),
    has_planet boolean,
    number_of_planet integer,
    constellation character varying(30),
    galaxy_id integer NOT NULL
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
-- Name: classification classification_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification ALTER COLUMN classification_id SET DEFAULT nextval('public.classification_classification_id_seq'::regclass);


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
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.classification VALUES (1, 'Earth', 'Terrestrial');
INSERT INTO public.classification VALUES (2, 'Mars', 'Terrestrial');
INSERT INTO public.classification VALUES (3, 'Venus', 'Terrestrial');
INSERT INTO public.classification VALUES (4, 'Mercury', 'Terrestrial');
INSERT INTO public.classification VALUES (5, 'Saturn', 'Jovian');
INSERT INTO public.classification VALUES (6, 'Jupiter', 'Jovian');
INSERT INTO public.classification VALUES (7, 'Neptune', 'Jovian');
INSERT INTO public.classification VALUES (8, 'Uranus', 'Jovian');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 'about 200 billion', '13.6 billion years', 100.000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'Spiral galaxy', '1 trillion', '10.01 billion years', 200.000);
INSERT INTO public.galaxy VALUES (4, 'NGC 262', 'Spiral galaxy', '15 trillion', NULL, 650.000);
INSERT INTO public.galaxy VALUES (5, 'Rubin Galaxy', 'Spiral galaxy', '1 trillion', NULL, 250.000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Supergiant elliptical galaxy', '1 trillion', '13.24 billion years', 60.000);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'Spiral galaxy', '100 billion', '13.25 billion years', 25.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Regular', 'Prograde', 1609, 1);
INSERT INTO public.moon VALUES (2, 'Io', 'Regular', 'Prograde', 1610, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 'Regular', 'Prograde', 1610, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Regular', 'Prograde', 1610, 5);
INSERT INTO public.moon VALUES (5, 'Metis', 'Regular', 'Prograde', 1979, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Regular', 'Prograde', 1610, 5);
INSERT INTO public.moon VALUES (7, 'Adrastea', 'Regular', 'Prograde', 1979, 5);
INSERT INTO public.moon VALUES (8, 'Themisto', 'Irregular', 'Prograde', 1975, 5);
INSERT INTO public.moon VALUES (9, 'Carme', 'Irregular', 'Retrograde', 1938, 5);
INSERT INTO public.moon VALUES (10, 'Valetudo', 'Irregular', 'Prograde', 2016, 5);
INSERT INTO public.moon VALUES (11, 'Ananke', 'Irregular', 'Retrograde', 1951, 5);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Regular', 'Prograde', 1789, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Regular', 'Prograde', 1789, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 'Regular', 'Prograde', 1684, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 'Regular', 'Prograde', 1684, 6);
INSERT INTO public.moon VALUES (16, 'Titan', 'Regular', 'Prograde', 1655, 6);
INSERT INTO public.moon VALUES (17, 'Calypso', 'Regular', 'Prograde', 1980, 6);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Regular', 'Prograde', 1851, 7);
INSERT INTO public.moon VALUES (19, 'Cordelia', 'Regular', 'Prograde', 1986, 7);
INSERT INTO public.moon VALUES (20, 'Margaret', 'Irregular', 'Prograde', 2003, 7);
INSERT INTO public.moon VALUES (21, 'Triton', 'Irregular', 'Retrograde', 1846, 8);
INSERT INTO public.moon VALUES (22, 'Nereid', 'Irregular', 'Retrograde', 1949, 8);
INSERT INTO public.moon VALUES (23, 'Naiad', 'Regular', 'Prograde', 1989, 8);
INSERT INTO public.moon VALUES (24, 'Charon', 'Regular', 'Prograde', 1978, 9);
INSERT INTO public.moon VALUES (25, 'Nix', 'Regular', 'Prograde', 2003, 9);
INSERT INTO public.moon VALUES (26, 'Phoebe', 'Irregular', 'Retrograde', 1899, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371.0, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 3389.5, false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911.0, false, 92, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232.0, false, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362.0, false, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622.0, false, 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 1188.3, false, 5, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 2439.7, false, 0, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 6051.8, false, 0, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 6569.5, true, 0, 2);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 b', 8307.4, false, 0, 3);
INSERT INTO public.planet VALUES (17, 'Proxima Centauri d', NULL, false, 0, 2);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 84180.0, true, 0, 4);
INSERT INTO public.planet VALUES (13, 'Trappist-1f', 6657.7, true, 0, 4);
INSERT INTO public.planet VALUES (16, 'Saffar', NULL, false, 0, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', true, 2, 'Centaurus', 1);
INSERT INTO public.star VALUES (3, 'Lalande 21185', true, 2, 'Ursa Major', 1);
INSERT INTO public.star VALUES (4, 'Trappist-1', true, 7, 'Aquarius', 1);
INSERT INTO public.star VALUES (5, 'Upsilon Andromedae', true, 3, 'Andromeda', 3);
INSERT INTO public.star VALUES (6, 'Alpheratz', false, 0, 'Andromeda', 3);
INSERT INTO public.star VALUES (1, 'Sun', true, 9, 'none', 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', false, 0, 'Centaurus', 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauri B', false, 0, 'Centaurus', 1);


--
-- Name: classification_classification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.classification_classification_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: classification classification_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_name_key UNIQUE (name);


--
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (classification_id);


--
-- Name: galaxy galaxy_name_galaxy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_galaxy_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

