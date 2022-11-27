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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    g_weight_in_sm character varying(30),
    g_size_in_light_years numeric(8,2),
    is_real_id integer,
    is_collapsing boolean
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
-- Name: is_real; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.is_real (
    is_real_id integer NOT NULL,
    name character varying(10),
    real_flag boolean NOT NULL
);


ALTER TABLE public.is_real OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    m_weight_in_kg character varying(30),
    m_size_in_kmsq numeric(6,2),
    is_real_id integer,
    num_of_visitors integer
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
    star_id integer NOT NULL,
    p_size_in_kmsq numeric(6,2),
    p_weight_in_kg character varying(30),
    is_real_id integer,
    population integer,
    planet_desc text
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    s_size_in_kmsq numeric(6,2),
    s_weight_in_kg character varying(30),
    is_real_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '1.5 Trillion Solar Masses', 100000.00, 1, true);
INSERT INTO public.galaxy VALUES (6, 'A Galaxy Far, Far Away...', NULL, 120000.00, 2, false);
INSERT INTO public.galaxy VALUES (2, 'Sombrero', '~0.0000008 Solar Masses', 25000.00, 1, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', '~50 Billion Solar Masses', 30000.00, 1, false);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', '~1.23 Trillion Solar Masses', 110000.00, 1, false);
INSERT INTO public.galaxy VALUES (5, 'Dimension X', 'Classified', NULL, 2, true);


--
-- Data for Name: is_real; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.is_real VALUES (1, 'Yes', true);
INSERT INTO public.is_real VALUES (2, 'No', false);
INSERT INTO public.is_real VALUES (3, 'default', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Io', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Triton', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Nereid', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Naiad', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Hippocamp', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titania', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Oberon', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Puck', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Desdemona', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Sycorax', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Dione', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Tethys', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Iapetus', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Phoebe', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Rhea', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Telesto', 5, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Uranus', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Neptune', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Thestias', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Gatasioux', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Tevsiluanos', 5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'New Earth', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Palz', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Rof Allux', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'HZ1223D-0', 4, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Nurvurna', 1, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Mirach', 3, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Adhil', 3, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Epsion Trianguli', 4, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Pollux', 1, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: is_real is_real_is_real_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_real
    ADD CONSTRAINT is_real_is_real_id_key UNIQUE (is_real_id);


--
-- Name: is_real is_real_is_real_id_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_real
    ADD CONSTRAINT is_real_is_real_id_pkey PRIMARY KEY (is_real_id);


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
-- Name: galaxy galaxy_is_real_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_is_real_id_fkey FOREIGN KEY (is_real_id) REFERENCES public.is_real(is_real_id);


--
-- Name: moon moon_is_real_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_is_real_id_fkey FOREIGN KEY (is_real_id) REFERENCES public.is_real(is_real_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_is_real_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_is_real_id_fkey FOREIGN KEY (is_real_id) REFERENCES public.is_real(is_real_id);


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
-- Name: star star_is_real_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_is_real_id_fkey FOREIGN KEY (is_real_id) REFERENCES public.is_real(is_real_id);


--
-- PostgreSQL database dump complete
--

