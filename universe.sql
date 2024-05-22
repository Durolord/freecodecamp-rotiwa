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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    nationality character varying(255) NOT NULL,
    biography text,
    is_active boolean NOT NULL
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    description text,
    age numeric NOT NULL,
    is_visible boolean NOT NULL,
    discovered boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    name character varying(255) NOT NULL,
    type character varying(255),
    mass numeric NOT NULL,
    radius integer,
    planet_id integer NOT NULL,
    is_habitable boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
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
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    mass numeric NOT NULL,
    radius integer NOT NULL,
    star_id integer NOT NULL,
    has_moons boolean NOT NULL,
    is_habitable boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    mass numeric NOT NULL,
    radius integer NOT NULL,
    galaxy_id integer NOT NULL,
    has_planets boolean NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Galileo Galilei', 77, 'Italian', 'Father of observational astronomy.', false);
INSERT INTO public.astronomer VALUES (2, 'Carl Sagan', 62, 'American', 'Popularized science with Cosmos.', false);
INSERT INTO public.astronomer VALUES (3, 'Edwin Hubble', 63, 'American', 'Proved the universe is expanding.', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our galaxy', 13.51, true, true, '2024-05-22 11:43:33.249728', '2024-05-22 11:43:33.249728');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Closest large galaxy', 10.0, true, true, '2024-05-22 11:44:15.943767', '2024-05-22 11:44:15.943767');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third largest galaxy in the Local Group', 12.0, true, true, '2024-05-22 11:44:15.943767', '2024-05-22 11:44:15.943767');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Interacting grand-design spiral galaxy', 13.0, true, true, '2024-05-22 11:44:15.943767', '2024-05-22 11:44:15.943767');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 'Galaxy with a bright nucleus', 13.0, true, true, '2024-05-22 11:44:15.943767', '2024-05-22 11:44:15.943767');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 'Face-on spiral galaxy', 13.2, true, true, '2024-05-22 11:44:15.943767', '2024-05-22 11:44:15.943767');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural Satellite', 0.0123, 0, 3, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural Satellite', 0.000000008, 0, 4, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural Satellite', 0.000000001, 0, 4, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (4, 'Europa', 'Natural Satellite', 0.00803, 0, 5, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Natural Satellite', 0.025, 0, 5, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (6, 'Callisto', 'Natural Satellite', 0.018, 0, 5, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (7, 'Io', 'Natural Satellite', 0.015, 0, 5, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (8, 'Titan', 'Natural Satellite', 0.0225, 0, 6, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Natural Satellite', 0.000001, 0, 6, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (10, 'Mimas', 'Natural Satellite', 0.000001, 0, 6, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (11, 'Triton', 'Natural Satellite', 0.0036, 0, 8, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (12, 'Charon', 'Natural Satellite', 0.002, 0, 7, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (13, 'Nereid', 'Natural Satellite', 0.00003, 0, 8, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (14, 'Proteus', 'Natural Satellite', 0.00005, 0, 8, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (15, 'Dysnomia', 'Natural Satellite', 0.0000001, 0, 9, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (16, 'Dactyl', 'Natural Satellite', 0.00000003, 0, 10, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (17, 'Nix', 'Natural Satellite', 0.0000001, 0, 9, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (18, 'Hydra', 'Natural Satellite', 0.0000001, 0, 9, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (19, 'Kari', 'Natural Satellite', 0.0000001, 0, 11, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');
INSERT INTO public.moon VALUES (20, 'Eurydome', 'Natural Satellite', 0.00000002, 0, 12, false, '2024-05-22 11:45:48.480408', '2024-05-22 11:45:48.480408');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 0.055, 0, 1, false, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 0.815, 1, 1, false, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1.0, 1, 1, true, true, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 0.107, 1, 1, true, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 317.8, 11, 1, true, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 95.2, 9, 1, true, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 14.5, 4, 1, true, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 17.1, 4, 1, true, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', 1.27, 1, 4, false, true, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 'Terrestrial', 1.1, 1, 2, false, true, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (11, 'Rigel b', 'Gas Giant', 1.2, 1, 5, true, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');
INSERT INTO public.planet VALUES (12, 'Sirius b', 'Gas Giant', 1.5, 1, 6, true, false, '2024-05-22 11:45:15.202613', '2024-05-22 11:45:15.202613');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1.0, 1, 1, true, true, '2024-05-22 11:44:46.984363', '2024-05-22 11:44:46.984363');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'G-type', 1.1, 1, 1, true, true, '2024-05-22 11:44:46.984363', '2024-05-22 11:44:46.984363');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'M-type', 20.0, 950, 1, false, true, '2024-05-22 11:44:46.984363', '2024-05-22 11:44:46.984363');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'M-type', 0.12, 0, 1, true, true, '2024-05-22 11:44:46.984363', '2024-05-22 11:44:46.984363');
INSERT INTO public.star VALUES (5, 'Rigel', 'B-type', 21.0, 78, 1, false, true, '2024-05-22 11:44:46.984363', '2024-05-22 11:44:46.984363');
INSERT INTO public.star VALUES (6, 'Sirius', 'A-type', 2.02, 2, 1, true, true, '2024-05-22 11:44:46.984363', '2024-05-22 11:44:46.984363');


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 3, true);


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
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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

