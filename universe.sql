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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_of_the_galaxy character varying(50),
    diameter_in_light_years integer NOT NULL,
    distance_from_earth_in_ly numeric(12,6) NOT NULL
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
    diameter_size_in_miles numeric(10,3),
    planet_id integer,
    orbits character varying(50)
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
-- Name: observable_universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observable_universe (
    galaxy_id integer NOT NULL,
    observable_universe_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.observable_universe OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    diameter_size_in_miles numeric(10,3),
    distance_from_sun text NOT NULL,
    has_moon boolean
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
    galaxy_id integer,
    surface_temperature_kelvin numeric(4,3),
    color character varying(30),
    distance_from_earth_in_ly text NOT NULL,
    size_compared_to_our_sun integer NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Solar System', true);
INSERT INTO public.constellation VALUES (2, 'Andromeda Constellation', false);
INSERT INTO public.constellation VALUES (3, 'Ursa Major Constellation', false);
INSERT INTO public.constellation VALUES (4, 'Cetus Constellation', false);
INSERT INTO public.constellation VALUES (5, 'Cygnus Constellation', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '13.61 Billion years', 100000, 0.000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', '10.01 Billion years', 152000, 2.500000);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', '13.31 Billion years', 90000, 11.740000);
INSERT INTO public.galaxy VALUES (4, 'Messier 101', '400 Million years', 170000, 25.000000);
INSERT INTO public.galaxy VALUES (5, 'Holmberg 15A', '', 270000, 700.000000);
INSERT INTO public.galaxy VALUES (6, 'Fireworks Galaxy', '12 Million Years', 40000, 22.000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2.159, 1, 'Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 7.000, 2, 'Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4.000, 2, 'Mars');
INSERT INTO public.moon VALUES (4, 'Europa', 1.940, 3, 'Jupiter');
INSERT INTO public.moon VALUES (5, 'Io', 1.131, 3, 'Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3.270, 3, 'Jupiter');
INSERT INTO public.moon VALUES (7, 'Titan', 3.200, 4, 'Saturn');
INSERT INTO public.moon VALUES (8, 'Enceladus', 314.000, 4, 'Saturn');
INSERT INTO public.moon VALUES (9, 'Mimas', 246.000, 4, 'Saturn');
INSERT INTO public.moon VALUES (10, 'Titania', 980.000, 5, 'Uranus');
INSERT INTO public.moon VALUES (11, 'Oberon', 946.000, 5, 'Uranus');
INSERT INTO public.moon VALUES (12, 'Miranda', 290.000, 5, 'Uranus');
INSERT INTO public.moon VALUES (13, 'Triton', 1.680, 6, 'Neptune');
INSERT INTO public.moon VALUES (14, 'Despina', 93.000, 6, 'Neptune');
INSERT INTO public.moon VALUES (15, 'Charon', 753.000, 7, 'Pluto');
INSERT INTO public.moon VALUES (16, 'Namaka', 106.000, 8, 'Haumea');
INSERT INTO public.moon VALUES (17, 'Weywot', 120.000, 9, 'Quaoar');
INSERT INTO public.moon VALUES (18, 'S/2015', 100.000, 10, 'Makemake');
INSERT INTO public.moon VALUES (19, 'Xiangliu', 60.000, 11, 'Gongong');
INSERT INTO public.moon VALUES (20, 'Dysnomia', 400.000, 12, 'Eris');


--
-- Data for Name: observable_universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observable_universe VALUES (1, 1, 'Milky Way');
INSERT INTO public.observable_universe VALUES (2, 2, 'Andromeda');
INSERT INTO public.observable_universe VALUES (3, 3, 'Ursa Major');
INSERT INTO public.observable_universe VALUES (5, 5, 'Cetus');
INSERT INTO public.observable_universe VALUES (6, 6, 'Cygnus');
INSERT INTO public.observable_universe VALUES (4, 4, 'Ursa Minor');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 8.000, '93.648 Million Miles', true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 4.000, '129.21 Million Miles', true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 3, 88.900, '465.64 Million Miles', true);
INSERT INTO public.planet VALUES (4, 'Saturn', 4, 74.897, '886 Mllion Miles', true);
INSERT INTO public.planet VALUES (5, 'Uranus', 5, 31.763, '1.8 Billion Miles', true);
INSERT INTO public.planet VALUES (6, 'Neptune', 6, 30.775, '2.8 Billion Miles', true);
INSERT INTO public.planet VALUES (7, 'Pluto', 7, 14.000, '3.7 Billion Miles', true);
INSERT INTO public.planet VALUES (8, 'Haumea', 8, 1.800, '4 Billion Miles', true);
INSERT INTO public.planet VALUES (9, 'Quaoar', 12, 690.000, '4.06 Billion Miles', true);
INSERT INTO public.planet VALUES (10, 'Makemake', 10, 870.000, '4.3 Billion Miles', true);
INSERT INTO public.planet VALUES (11, 'Gonggong', 11, 760.000, '6 Billion Miles', true);
INSERT INTO public.planet VALUES (12, 'Eris', 9, 1.445, '6.3 Billion Miles', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Antares', 1, 3.700, 'Red', '550 ly', 883);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3.042, 'Red-yellow', '4.24 ly', -75);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, 8.500, 'Blue-white', '97 ly', 3);
INSERT INTO public.star VALUES (4, 'Mirach', 2, 3.800, 'Red', '200 ly', 100);
INSERT INTO public.star VALUES (5, 'Dubhe', 3, 4.500, 'Orange', '123 ly', 27);
INSERT INTO public.star VALUES (6, 'Muscida', 3, 5.163, 'Yellow', '179 ly', 15);
INSERT INTO public.star VALUES (7, 'Mizar', 4, 9.500, 'Blue-white', '82 ly', 3);
INSERT INTO public.star VALUES (8, 'Alcor', 4, 8.221, 'Blue-white', '83 ly', 2);
INSERT INTO public.star VALUES (9, 'Tau Ceti', 5, 5.320, 'Yellow-orange', '12 ly', -25);
INSERT INTO public.star VALUES (10, 'Chi Ceti', 5, 7.000, 'Blue-white', '75 ly', 2);
INSERT INTO public.star VALUES (11, 'Gamma Cygny', 6, 6.100, 'Yellow-white', '1.826 ly', 12);
INSERT INTO public.star VALUES (12, 'Delta Cygni', 6, 9.000, 'Blue-white', '166 ly', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: constellation constellation_constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


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
-- Name: observable_universe observable_universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observable_universe
    ADD CONSTRAINT observable_universe_name_key UNIQUE (name);


--
-- Name: observable_universe observable_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observable_universe
    ADD CONSTRAINT observable_universe_pkey PRIMARY KEY (observable_universe_id);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


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
-- Name: observable_universe observable_universe_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observable_universe
    ADD CONSTRAINT observable_universe_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

