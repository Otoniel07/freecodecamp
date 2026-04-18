--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type text,
    diameter_in_light_years text,
    number_of_stars text
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
    name character varying(30) NOT NULL,
    planet_id integer,
    has_atmosphere boolean,
    composition character varying(30),
    period numeric(5,2)
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
-- Name: organization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.organization (
    name character varying(30) NOT NULL,
    registry_code character varying(20),
    is_government boolean,
    headquarters character varying(30),
    organization_id integer NOT NULL,
    founded_year integer,
    active_missions integer
);


ALTER TABLE public.organization OWNER TO freecodecamp;

--
-- Name: organization_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.organization_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organization_organization_id_seq OWNER TO freecodecamp;

--
-- Name: organization_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.organization_organization_id_seq OWNED BY public.organization.organization_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    discovery_method character varying(20),
    planet_category character varying(20)
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type character varying(30),
    solar_mass numeric(4,1)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: organization organization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organization ALTER COLUMN organization_id SET DEFAULT nextval('public.organization_organization_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', '~100,000', '~100-400 Billion');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', '~152,000', '~1 Trillion');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', '~60,000', '~40 Billion');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', '~14,000', '~30 Billion');
INSERT INTO public.galaxy VALUES (5, 'Sagittarius Dwarf', 'Elliptical / Spheroidal', '~10,000', '~100 Million');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Unbarred Spiral', '~50,000', '~800 Billion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 'Silicate Rock', 27.30);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 'Carbonaceous Rock', 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 'Carbonaceous Rock', 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 3, true, 'Silicate/Sulfur', 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 3, true, 'Water Ice', 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, true, 'Silicate/Ice', 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, 'Water Ice/Rock', 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 'Nitrogen/Ice', 15.95);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, false, 'Water Ice', 4.52);
INSERT INTO public.moon VALUES (10, 'Dione', 4, false, 'Water Ice', 2.74);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4, true, 'Fresh Ice', 1.37);
INSERT INTO public.moon VALUES (12, 'Neith', 5, false, 'Hypothetical', 10.00);
INSERT INTO public.moon VALUES (13, 'Triton', 6, true, 'Nitrogen Ice', 5.87);
INSERT INTO public.moon VALUES (14, 'Proteus', 6, false, 'Silicate/Ice', 1.12);
INSERT INTO public.moon VALUES (15, 'Ignis', 7, true, 'Volcanic Ash', 14.50);
INSERT INTO public.moon VALUES (16, 'Aethel', 8, false, 'Frozen Methane', 400.00);
INSERT INTO public.moon VALUES (17, 'Selene-2', 9, false, 'Water Ice', 12.20);
INSERT INTO public.moon VALUES (18, 'Magellan-A', 10, false, 'Iron-rich', 5.80);
INSERT INTO public.moon VALUES (19, 'Voros', 11, false, 'Crystalline Carbon', 3.10);
INSERT INTO public.moon VALUES (20, 'Kopis', 12, false, 'Silicate Dust', 8.40);


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.organization VALUES ('NASA', 'NASA-001', true, 'Washington, D.C.', 1, 1958, 85);
INSERT INTO public.organization VALUES ('ESA', 'ESA-002', true, 'Paris, France', 2, 1975, 42);
INSERT INTO public.organization VALUES ('JAXA', 'JAXA-003', true, 'Tokyo, Japan', 3, 2003, 18);
INSERT INTO public.organization VALUES ('SpaceX', 'SPX-004', false, 'Hawthorne, USA', 4, 2002, 120);
INSERT INTO public.organization VALUES ('Andromeda Initiative', 'AND-005', false, 'Deep Space', 5, 2184, 4);
INSERT INTO public.organization VALUES ('LMC Survey Group', 'LMC-006', true, 'LMC Orbit', 6, 2012, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Direct Observation', 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Direct Observation', 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Direct Observation', 'Gas Giant');
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Direct Observation', 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'Direct Observation', 'Terrestrial');
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Mathematical/Direct', 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'VY CMa-b', 2, 'Candidate', 'Gas Giant');
INSERT INTO public.planet VALUES (8, 'PA-99-N2b', 3, 'Microlensing', 'Super-Jupiter');
INSERT INTO public.planet VALUES (9, 'Andromeda-1b', 4, 'Candidate', 'Ice Giant');
INSERT INTO public.planet VALUES (10, 'LMC-Alpha', 5, 'Candidate', 'Super-Earth');
INSERT INTO public.planet VALUES (11, 'Tarantula-G1', 6, 'Candidate', 'Mega-Jupiter');
INSERT INTO public.planet VALUES (12, 'Tarantula-G2', 6, 'Candidate', 'Gas Giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 1.0);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 1, 'Red Hypergiant', 17.0);
INSERT INTO public.star VALUES (3, 'PA-99-N2', 2, 'Blue Supergiant', 10.0);
INSERT INTO public.star VALUES (4, 'V1', 2, 'Cepheid Variable', 20.0);
INSERT INTO public.star VALUES (5, 'WOH G64', 4, 'Red Supergiant', 25.0);
INSERT INTO public.star VALUES (6, 'R136a1', 4, 'Wolf-Rayet Star', 196.0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: organization_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.organization_organization_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: organization organization_organization_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_organization_id_key UNIQUE (organization_id);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (organization_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

