PGDMP                          z            atipikhouse    12.4    12.4 +    G           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            H           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            I           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            J           1262    16393    atipikhouse    DATABASE     ?   CREATE DATABASE atipikhouse WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE atipikhouse;
                postgres    false                        3079    16394 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            K           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    16575    booking    TABLE     ?   CREATE TABLE public.booking (
    id integer NOT NULL,
    price money,
    start_date integer NOT NULL,
    end_date integer NOT NULL,
    reserved_by uuid NOT NULL,
    house integer NOT NULL,
    reserved_names character varying(255)
);
    DROP TABLE public.booking;
       public         heap    postgres    false            ?            1259    16573    booking_ID_seq    SEQUENCE     ?   CREATE SEQUENCE public."booking_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."booking_ID_seq";
       public          postgres    false    209            L           0    0    booking_ID_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."booking_ID_seq" OWNED BY public.booking.id;
          public          postgres    false    208            ?            1259    16553    comments    TABLE     
  CREATE TABLE public.comments (
    id integer NOT NULL,
    content text,
    created_date integer,
    created_by uuid NOT NULL,
    status character varying(25) DEFAULT 'pending'::character varying NOT NULL,
    stars_number integer,
    house integer NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false            ?            1259    16551    comments_ID_seq    SEQUENCE     ?   CREATE SEQUENCE public."comments_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."comments_ID_seq";
       public          postgres    false    207            M           0    0    comments_ID_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."comments_ID_seq" OWNED BY public.comments.id;
          public          postgres    false    206            ?            1259    16531    houses    TABLE     ?  CREATE TABLE public.houses (
    id integer NOT NULL,
    title character varying(255),
    description text,
    status character varying(25) DEFAULT 'pending'::character varying NOT NULL,
    type character varying(255),
    nbr_couchage integer,
    capacity character varying(255),
    price money,
    photos json,
    created_by uuid NOT NULL,
    created_date integer,
    updated_by uuid,
    updated_date integer,
    off_days integer[]
);
    DROP TABLE public.houses;
       public         heap    postgres    false            ?            1259    16529    houses_ID_seq    SEQUENCE     ?   CREATE SEQUENCE public."houses_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."houses_ID_seq";
       public          postgres    false    205            N           0    0    houses_ID_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."houses_ID_seq" OWNED BY public.houses.id;
          public          postgres    false    204            ?            1259    16593    pages    TABLE     f   CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying,
    content json
);
    DROP TABLE public.pages;
       public         heap    postgres    false            ?            1259    16591    page_ID_seq    SEQUENCE     ?   CREATE SEQUENCE public."page_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."page_ID_seq";
       public          postgres    false    211            O           0    0    page_ID_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public."page_ID_seq" OWNED BY public.pages.id;
          public          postgres    false    210            ?            1259    16510    users    TABLE     {  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    last_name character varying(150),
    first_name character varying(255),
    email character varying(255),
    address character varying(255),
    phone character varying(25),
    social_link json,
    grade character varying(25) DEFAULT 'customer'::bpchar NOT NULL,
    is_online boolean DEFAULT false NOT NULL,
    created_date integer,
    updated_date integer,
    password character varying(255),
    confirmation_token character varying(255),
    login_session_token character varying(255),
    last_login integer,
    login_history json
);
    DROP TABLE public.users;
       public         heap    postgres    false    2            ?
           2604    16578 
   booking id    DEFAULT     j   ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public."booking_ID_seq"'::regclass);
 9   ALTER TABLE public.booking ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            ?
           2604    16556    comments id    DEFAULT     l   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public."comments_ID_seq"'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            ?
           2604    16534 	   houses id    DEFAULT     h   ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public."houses_ID_seq"'::regclass);
 8   ALTER TABLE public.houses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            ?
           2604    16596    pages id    DEFAULT     e   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public."page_ID_seq"'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            B          0    16575    booking 
   TABLE DATA           f   COPY public.booking (id, price, start_date, end_date, reserved_by, house, reserved_names) FROM stdin;
    public          postgres    false    209   $2       @          0    16553    comments 
   TABLE DATA           f   COPY public.comments (id, content, created_date, created_by, status, stars_number, house) FROM stdin;
    public          postgres    false    207   A2       >          0    16531    houses 
   TABLE DATA           ?   COPY public.houses (id, title, description, status, type, nbr_couchage, capacity, price, photos, created_by, created_date, updated_by, updated_date, off_days) FROM stdin;
    public          postgres    false    205   ^2       D          0    16593    pages 
   TABLE DATA           3   COPY public.pages (id, title, content) FROM stdin;
    public          postgres    false    211   {2       <          0    16510    users 
   TABLE DATA           ?   COPY public.users (id, last_name, first_name, email, address, phone, social_link, grade, is_online, created_date, updated_date, password, confirmation_token, login_session_token, last_login, login_history) FROM stdin;
    public          postgres    false    203   ?2       P           0    0    booking_ID_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."booking_ID_seq"', 1, false);
          public          postgres    false    208            Q           0    0    comments_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."comments_ID_seq"', 1, false);
          public          postgres    false    206            R           0    0    houses_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."houses_ID_seq"', 1, false);
          public          postgres    false    204            S           0    0    page_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."page_ID_seq"', 1, true);
          public          postgres    false    210            ?
           2606    16580    booking booking_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_pkey;
       public            postgres    false    209            ?
           2606    16562    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    207            ?
           2606    16603    users email_uniq 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_uniq UNIQUE (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT email_uniq;
       public            postgres    false    203            ?
           2606    16540    houses houses_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.houses DROP CONSTRAINT houses_pkey;
       public            postgres    false    205            ?
           2606    16601    pages page_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.pages DROP CONSTRAINT page_pkey;
       public            postgres    false    211            ?
           2606    16519    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            ?
           2606    16546    houses created_by    FK CONSTRAINT     }   ALTER TABLE ONLY public.houses
    ADD CONSTRAINT created_by FOREIGN KEY (created_by) REFERENCES public.users(id) NOT VALID;
 ;   ALTER TABLE ONLY public.houses DROP CONSTRAINT created_by;
       public          postgres    false    205    2736    203            ?
           2606    16563    comments created_by    FK CONSTRAINT     u   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT created_by FOREIGN KEY (created_by) REFERENCES public.users(id);
 =   ALTER TABLE ONLY public.comments DROP CONSTRAINT created_by;
       public          postgres    false    207    2736    203            ?
           2606    16568    comments house_id    FK CONSTRAINT     o   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT house_id FOREIGN KEY (house) REFERENCES public.houses(id);
 ;   ALTER TABLE ONLY public.comments DROP CONSTRAINT house_id;
       public          postgres    false    207    205    2738            ?
           2606    16586    booking house_id    FK CONSTRAINT     n   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT house_id FOREIGN KEY (house) REFERENCES public.houses(id);
 :   ALTER TABLE ONLY public.booking DROP CONSTRAINT house_id;
       public          postgres    false    205    2738    209            ?
           2606    16581    booking reserved_by    FK CONSTRAINT     v   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT reserved_by FOREIGN KEY (reserved_by) REFERENCES public.users(id);
 =   ALTER TABLE ONLY public.booking DROP CONSTRAINT reserved_by;
       public          postgres    false    209    2736    203            B      x^????? ? ?      @      x^????? ? ?      >      x^????? ? ?      D      x^3????M????????? ?I      <   ?   x^5?O?0@?ۧ??-6????݂??Ȣ?Ct???԰L??<???  @_??S?IUj?F?:(!?F]?u??љ?/,???-???T???l?[?9???PxRD>??߫????b?@?|?
??:?9?s?Ҍ???ل?{<s\?q????o3???r?:??m1l??&?G????^8???N:e     