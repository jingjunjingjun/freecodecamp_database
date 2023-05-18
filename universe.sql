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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    dimensions_km character varying(60),
    discovery_year integer,
    visited_by character varying(60)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_commet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_commet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_commet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_commet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_commet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth_in_millions_of_ly numeric(8,4),
    diameter integer,
    galaxy_types character varying(60),
    note text
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
    name character varying(50) NOT NULL,
    is_spherical boolean,
    discovery_year integer,
    discovered_by character varying(60),
    planet_id integer
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
    name character varying(50) NOT NULL,
    planet_type character varying(60),
    has_life boolean,
    rings boolean,
    orbital_period_in_years numeric(6,2),
    confirmed_moons integer,
    star_id integer
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
    name character varying(50) NOT NULL,
    distance_from_earth_ly numeric(5,2),
    age_in_million_years integer,
    visual_brightness_v numeric(6,2),
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_commet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Giacobini-Zinner', '2', 1900, 'ICE');
INSERT INTO public.comet VALUES (2, 'Halley', '15*9', 1759, 'Vega 1');
INSERT INTO public.comet VALUES (3, 'Grigg-Skjellerup', '2.6', 1902, 'Giotto');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 0.0265, 87400, 'SBbc', 'Home galaxy of earth. Barred Sprial galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 0.0250, NULL, 'Irr', 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Draco II', 0.0701, 120, '', 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Tucana III', 0.0747, 220, '', 'Satellite of Milky Way that is being tidally disrupted.');
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 0.0750, NULL, 'dSph or Glob Clus', 'Satellite of Mily Way');
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Sphr SagDEG', 0.0780, 10000, 'dSph/E7', 'Satellite of MilyWay(partial accretion by Milky Way)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 1877, 'Hall', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 1877, 'Hall', 4);
INSERT INTO public.moon VALUES (4, 'Io', true, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 1892, 'Barnard', 5);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 1904, 'Perrine', 5);
INSERT INTO public.moon VALUES (10, 'Elara', false, 1905, 'Perrine', 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', false, 1908, 'Melotte', 5);
INSERT INTO public.moon VALUES (12, 'Sinope', false, 1914, 'Nicholson', 5);
INSERT INTO public.moon VALUES (13, 'Lysithea', false, 1938, 'Nicholson', 5);
INSERT INTO public.moon VALUES (14, 'Carme', false, 1938, 'Nicholson', 5);
INSERT INTO public.moon VALUES (15, 'Ananke', false, 1951, 'Nocholson', 5);
INSERT INTO public.moon VALUES (16, 'Leda', false, 1974, 'Kowal', 5);
INSERT INTO public.moon VALUES (17, 'Thebe', false, 1979, 'Synnott (Voyager 1)', 5);
INSERT INTO public.moon VALUES (18, 'Adrastea', false, 1979, 'Jewitt, Danielson (Voyager 1)', 5);
INSERT INTO public.moon VALUES (19, 'Metis', false, 1979, 'Synnott (Voyager 1)', 5);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', false, 2000, ' Scotti, Sphar, McMillan, Larsen, Montani, Gleason, Gehrels', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', false, false, 0.24, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', false, false, 0.62, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', true, false, 1.00, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', false, false, 1.88, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giants', false, true, 11.86, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giants', false, true, 29.45, 145, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giants', false, true, 84.02, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giants', false, true, 164.79, 14, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 'dwarf planet', false, false, 4.60, 0, 1);
INSERT INTO public.planet VALUES (10, 'Orcus', 'dwarf planet', false, false, 247.50, 1, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 'dwarf planet', false, false, 247.90, 5, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 'dwarf planet', false, true, 283.80, 2, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 0.00, 4600, -26.74, 1);
INSERT INTO public.star VALUES (2, 'Sirus', 8.60, 228, -1.46, NULL);
INSERT INTO public.star VALUES (3, 'Canopus', 310.00, 25, -0.74, NULL);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus & Toliman', 4.34, 5300, -0.27, NULL);
INSERT INTO public.star VALUES (5, 'Arcturus', 37.00, 7100, -0.05, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 25.00, 455, 0.03, NULL);
INSERT INTO public.star VALUES (7, 'Capella', 43.00, 620, 0.08, NULL);


--
-- Name: comet_commet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_commet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

