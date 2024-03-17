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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_attributes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_attributes (
    galaxy_attributes_id integer NOT NULL,
    galaxy_id integer,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spiral boolean,
    is_elliptical boolean,
    is_irregular boolean,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy_attributes OWNER TO freecodecamp;

--
-- Name: galaxy_attributes_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_attributes_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_attributes_attribute_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_attributes_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_attributes_attribute_id_seq OWNED BY public.galaxy_attributes.galaxy_attributes_id;


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
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter_km integer,
    is_inhabited boolean NOT NULL,
    CONSTRAINT moon_diameter_km_check CHECK ((diameter_km >= 0))
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
    name character varying(100) NOT NULL,
    star_id integer,
    distance_from_earth numeric,
    planet_type text,
    has_atmosphere boolean NOT NULL,
    CONSTRAINT planet_distance_from_earth_check CHECK ((distance_from_earth >= (0)::numeric))
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    color character varying(50) NOT NULL,
    mass numeric,
    is_main_sequence boolean NOT NULL
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
-- Name: galaxy_attributes galaxy_attributes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_attributes ALTER COLUMN galaxy_attributes_id SET DEFAULT nextval('public.galaxy_attributes_attribute_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 'spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 14000, 'spiral', false, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 10000, 'elliptical', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 10000, 'spiral', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 12000, 'spiral', false, true);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 13000, 'spiral', false, true);


--
-- Data for Name: galaxy_attributes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_attributes VALUES (1, 1, 'The Milky Way is a barred spiral galaxy', 13000, 0, true, true, false, false, 'Milky Way');
INSERT INTO public.galaxy_attributes VALUES (2, 2, 'Andromeda is a spiral galaxy', 14000, 2537000, false, true, false, false, 'Andromeda');
INSERT INTO public.galaxy_attributes VALUES (3, 3, 'Messier 87 is a supergiant elliptical galaxy', 10000, 53490000, false, false, true, false, 'Messier 87');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3660, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, false);
INSERT INTO public.moon VALUES (10, 'Triton', 9, 2706, false);
INSERT INTO public.moon VALUES (11, 'Proteus', 9, 436, false);
INSERT INTO public.moon VALUES (12, 'Charon', 10, 1212, false);
INSERT INTO public.moon VALUES (13, 'Kepler-186f-b', 9, 3150, false);
INSERT INTO public.moon VALUES (14, 'Kepler-442b-b', 10, 2730, false);
INSERT INTO public.moon VALUES (15, 'HD 40307 g-b', 11, 4565, false);
INSERT INTO public.moon VALUES (16, 'Gliese 667 Cc-b', 11, 3778, false);
INSERT INTO public.moon VALUES (17, 'Luna', 3, 3240, false);
INSERT INTO public.moon VALUES (18, 'Phoebe', 7, 213, false);
INSERT INTO public.moon VALUES (19, 'Miranda', 9, 472, false);
INSERT INTO public.moon VALUES (20, 'Ariel', 9, 1160, false);
INSERT INTO public.moon VALUES (21, 'Umbriel', 9, 1169, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 77000000, 'Terrestrial', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 261000000, 'Terrestrial', true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 0, 'Terrestrial', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 54600000, 'Terrestrial', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 629000000, 'Gas Giant', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 1300000000, 'Gas Giant', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 2700000000, 'Ice Giant', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 4300000000, 'Ice Giant', false);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 3, 500000000000000, 'Terrestrial', true);
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 3, 120000000000000, 'Terrestrial', true);
INSERT INTO public.planet VALUES (11, 'HD 40307 g', 4, 4200000000000000, 'Super Earth', true);
INSERT INTO public.planet VALUES (12, 'Gliese 667 Cc', 4, 2300000000000000, 'Super Earth', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'yellow', 1989000000000000000000000000000, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'white', 2063000000000000000000000000000, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'yellow', 2180000000000000000000000000000, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 'orange', 1560000000000000000000000000000, true);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 1, 'red', 300000000000000000000000000000, true);
INSERT INTO public.star VALUES (6, 'Wolf 359', 1, 'red', 200000000000000000000000000000, true);


--
-- Name: galaxy_attributes_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_attributes_attribute_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_attributes galaxy_attributes_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_attributes
    ADD CONSTRAINT galaxy_attributes_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy_attributes galaxy_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_attributes
    ADD CONSTRAINT galaxy_attributes_pkey PRIMARY KEY (galaxy_attributes_id);


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
-- Name: galaxy_attributes galaxy_attributes_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_attributes
    ADD CONSTRAINT galaxy_attributes_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

