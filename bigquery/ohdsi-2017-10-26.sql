--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: cloudsqlsuperuser
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: ohdsi; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ohdsi;


ALTER SCHEMA ohdsi OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = ohdsi, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: batch_job_execution; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE batch_job_execution (
    job_execution_id bigint NOT NULL,
    version bigint,
    job_instance_id bigint NOT NULL,
    create_time timestamp without time zone NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    status character varying(10),
    exit_code character varying(2500),
    exit_message character varying(2500),
    last_updated timestamp without time zone,
    job_configuration_location character varying(2500)
);


ALTER TABLE batch_job_execution OWNER TO postgres;

--
-- Name: batch_job_execution_context; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE batch_job_execution_context (
    job_execution_id bigint NOT NULL,
    short_context character varying(2500) NOT NULL,
    serialized_context text
);


ALTER TABLE batch_job_execution_context OWNER TO postgres;

--
-- Name: batch_job_execution_params; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE batch_job_execution_params (
    job_execution_id bigint NOT NULL,
    type_cd character varying(6) NOT NULL,
    key_name character varying(100) NOT NULL,
    string_val character varying(250),
    date_val timestamp without time zone,
    long_val bigint,
    double_val double precision,
    identifying character(1) NOT NULL
);


ALTER TABLE batch_job_execution_params OWNER TO postgres;

--
-- Name: batch_job_execution_seq; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE batch_job_execution_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE batch_job_execution_seq OWNER TO postgres;

--
-- Name: batch_job_instance; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE batch_job_instance (
    job_instance_id bigint NOT NULL,
    version bigint,
    job_name character varying(100) NOT NULL,
    job_key character varying(32) NOT NULL
);


ALTER TABLE batch_job_instance OWNER TO postgres;

--
-- Name: batch_job_seq; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE batch_job_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE batch_job_seq OWNER TO postgres;

--
-- Name: batch_step_execution; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE batch_step_execution (
    step_execution_id bigint NOT NULL,
    version bigint NOT NULL,
    step_name character varying(100) NOT NULL,
    job_execution_id bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    status character varying(10),
    commit_count bigint,
    read_count bigint,
    filter_count bigint,
    write_count bigint,
    read_skip_count bigint,
    write_skip_count bigint,
    process_skip_count bigint,
    rollback_count bigint,
    exit_code character varying(2500),
    exit_message character varying(2500),
    last_updated timestamp without time zone
);


ALTER TABLE batch_step_execution OWNER TO postgres;

--
-- Name: batch_step_execution_context; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE batch_step_execution_context (
    step_execution_id bigint NOT NULL,
    short_context character varying(2500) NOT NULL,
    serialized_context text
);


ALTER TABLE batch_step_execution_context OWNER TO postgres;

--
-- Name: batch_step_execution_seq; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE batch_step_execution_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE batch_step_execution_seq OWNER TO postgres;

--
-- Name: cca; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cca (
    cca_id integer NOT NULL,
    name character varying(255),
    treatment_id integer NOT NULL,
    comparator_id integer NOT NULL,
    outcome_id integer NOT NULL,
    model_type character varying(50) NOT NULL,
    time_at_risk_start integer NOT NULL,
    time_at_risk_end integer NOT NULL,
    add_exposure_days_to_end integer NOT NULL,
    minimum_washout_period integer NOT NULL,
    minimum_days_at_risk integer NOT NULL,
    rm_subjects_in_both_cohorts integer NOT NULL,
    rm_prior_outcomes integer NOT NULL,
    ps_adjustment integer NOT NULL,
    ps_exclusion_id integer NOT NULL,
    ps_inclusion_id integer NOT NULL,
    ps_demographics integer NOT NULL,
    ps_demographics_gender integer NOT NULL,
    ps_demographics_race integer NOT NULL,
    ps_demographics_ethnicity integer NOT NULL,
    ps_demographics_age integer NOT NULL,
    ps_demographics_year integer NOT NULL,
    ps_demographics_month integer NOT NULL,
    ps_trim integer NOT NULL,
    ps_trim_fraction double precision NOT NULL,
    ps_match integer NOT NULL,
    ps_match_max_ratio integer NOT NULL,
    ps_strat integer NOT NULL,
    ps_strat_num_strata integer NOT NULL,
    ps_condition_occ integer NOT NULL,
    ps_condition_occ_365d integer NOT NULL,
    ps_condition_occ_30d integer NOT NULL,
    ps_condition_occ_inpt180d integer NOT NULL,
    ps_condition_era integer NOT NULL,
    ps_condition_era_ever integer NOT NULL,
    ps_condition_era_overlap integer NOT NULL,
    ps_condition_group integer NOT NULL,
    ps_condition_group_meddra integer NOT NULL,
    ps_condition_group_snomed integer NOT NULL,
    ps_drug_exposure integer NOT NULL,
    ps_drug_exposure_365d integer NOT NULL,
    ps_drug_exposure_30d integer NOT NULL,
    ps_drug_era integer NOT NULL,
    ps_drug_era_365d integer NOT NULL,
    ps_drug_era_30d integer NOT NULL,
    ps_drug_era_overlap integer NOT NULL,
    ps_drug_era_ever integer NOT NULL,
    ps_drug_group integer NOT NULL,
    ps_procedure_occ integer NOT NULL,
    ps_procedure_occ_365d integer NOT NULL,
    ps_procedure_occ_30d integer NOT NULL,
    ps_procedure_group integer NOT NULL,
    ps_observation integer NOT NULL,
    ps_observation_365d integer NOT NULL,
    ps_observation_30d integer NOT NULL,
    ps_observation_count_365d integer NOT NULL,
    ps_measurement integer NOT NULL,
    ps_measurement_365d integer NOT NULL,
    ps_measurement_30d integer NOT NULL,
    ps_measurement_count_365d integer NOT NULL,
    ps_measurement_below integer NOT NULL,
    ps_measurement_above integer NOT NULL,
    ps_concept_counts integer NOT NULL,
    ps_risk_scores integer NOT NULL,
    ps_risk_scores_charlson integer NOT NULL,
    ps_risk_scores_dcsi integer NOT NULL,
    ps_risk_scores_chads2 integer NOT NULL,
    ps_risk_scores_chads2vasc integer NOT NULL,
    ps_interaction_year integer NOT NULL,
    ps_interaction_month integer NOT NULL,
    om_covariates integer NOT NULL,
    om_exclusion_id integer NOT NULL,
    om_inclusion_id integer NOT NULL,
    om_demographics integer NOT NULL,
    om_demographics_gender integer NOT NULL,
    om_demographics_race integer NOT NULL,
    om_demographics_ethnicity integer NOT NULL,
    om_demographics_age integer NOT NULL,
    om_demographics_year integer NOT NULL,
    om_demographics_month integer NOT NULL,
    om_trim integer NOT NULL,
    om_trim_fraction double precision NOT NULL,
    om_match integer NOT NULL,
    om_match_max_ratio integer NOT NULL,
    om_strat integer NOT NULL,
    om_strat_num_strata integer NOT NULL,
    om_condition_occ integer NOT NULL,
    om_condition_occ_365d integer NOT NULL,
    om_condition_occ_30d integer NOT NULL,
    om_condition_occ_inpt180d integer NOT NULL,
    om_condition_era integer NOT NULL,
    om_condition_era_ever integer NOT NULL,
    om_condition_era_overlap integer NOT NULL,
    om_condition_group integer NOT NULL,
    om_condition_group_meddra integer NOT NULL,
    om_condition_group_snomed integer NOT NULL,
    om_drug_exposure integer NOT NULL,
    om_drug_exposure_365d integer NOT NULL,
    om_drug_exposure_30d integer NOT NULL,
    om_drug_era integer NOT NULL,
    om_drug_era_365d integer NOT NULL,
    om_drug_era_30d integer NOT NULL,
    om_drug_era_overlap integer NOT NULL,
    om_drug_era_ever integer NOT NULL,
    om_drug_group integer NOT NULL,
    om_procedure_occ integer NOT NULL,
    om_procedure_occ_365d integer NOT NULL,
    om_procedure_occ_30d integer NOT NULL,
    om_procedure_group integer NOT NULL,
    om_observation integer NOT NULL,
    om_observation_365d integer NOT NULL,
    om_observation_30d integer NOT NULL,
    om_observation_count_365d integer NOT NULL,
    om_measurement integer NOT NULL,
    om_measurement_365d integer NOT NULL,
    om_measurement_30d integer NOT NULL,
    om_measurement_count_365d integer NOT NULL,
    om_measurement_below integer NOT NULL,
    om_measurement_above integer NOT NULL,
    om_concept_counts integer NOT NULL,
    om_risk_scores integer NOT NULL,
    om_risk_scores_charlson integer NOT NULL,
    om_risk_scores_dcsi integer NOT NULL,
    om_risk_scores_chads2 integer NOT NULL,
    om_risk_scores_chads2vasc integer NOT NULL,
    om_interaction_year integer NOT NULL,
    om_interaction_month integer NOT NULL,
    del_covariates_small_count integer NOT NULL,
    negative_control_id integer NOT NULL,
    created timestamp(3) without time zone NOT NULL,
    modified timestamp(3) without time zone NOT NULL,
    sec_user_id integer NOT NULL
);


ALTER TABLE cca OWNER TO postgres;

--
-- Name: cca_execution; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cca_execution (
    cca_execution_id integer NOT NULL,
    cca_id integer NOT NULL,
    source_id integer NOT NULL,
    treatment_id integer NOT NULL,
    comparator_id integer NOT NULL,
    outcome_id integer NOT NULL,
    model_type character varying(50) NOT NULL,
    time_at_risk_start integer NOT NULL,
    time_at_risk_end integer NOT NULL,
    add_exposure_days_to_end integer NOT NULL,
    minimum_washout_period integer NOT NULL,
    minimum_days_at_risk integer NOT NULL,
    rm_subjects_in_both_cohorts integer NOT NULL,
    rm_prior_outcomes integer NOT NULL,
    ps_adjustment integer NOT NULL,
    ps_exclusion_id integer NOT NULL,
    ps_inclusion_id integer NOT NULL,
    ps_demographics integer NOT NULL,
    ps_demographics_gender integer NOT NULL,
    ps_demographics_race integer NOT NULL,
    ps_demographics_ethnicity integer NOT NULL,
    ps_demographics_age integer NOT NULL,
    ps_demographics_year integer NOT NULL,
    ps_demographics_month integer NOT NULL,
    ps_trim integer NOT NULL,
    ps_trim_fraction double precision NOT NULL,
    ps_match integer NOT NULL,
    ps_match_max_ratio integer NOT NULL,
    ps_strat integer NOT NULL,
    ps_strat_num_strata integer NOT NULL,
    ps_condition_occ integer NOT NULL,
    ps_condition_occ_365d integer NOT NULL,
    ps_condition_occ_30d integer NOT NULL,
    ps_condition_occ_inpt180d integer NOT NULL,
    ps_condition_era integer NOT NULL,
    ps_condition_era_ever integer NOT NULL,
    ps_condition_era_overlap integer NOT NULL,
    ps_condition_group integer NOT NULL,
    ps_condition_group_meddra integer NOT NULL,
    ps_condition_group_snomed integer NOT NULL,
    ps_drug_exposure integer NOT NULL,
    ps_drug_exposure_365d integer NOT NULL,
    ps_drug_exposure_30d integer NOT NULL,
    ps_drug_era integer NOT NULL,
    ps_drug_era_365d integer NOT NULL,
    ps_drug_era_30d integer NOT NULL,
    ps_drug_era_overlap integer NOT NULL,
    ps_drug_era_ever integer NOT NULL,
    ps_drug_group integer NOT NULL,
    ps_procedure_occ integer NOT NULL,
    ps_procedure_occ_365d integer NOT NULL,
    ps_procedure_occ_30d integer NOT NULL,
    ps_procedure_group integer NOT NULL,
    ps_observation integer NOT NULL,
    ps_observation_365d integer NOT NULL,
    ps_observation_30d integer NOT NULL,
    ps_observation_count_365d integer NOT NULL,
    ps_measurement integer NOT NULL,
    ps_measurement_365d integer NOT NULL,
    ps_measurement_30d integer NOT NULL,
    ps_measurement_count_365d integer NOT NULL,
    ps_measurement_below integer NOT NULL,
    ps_measurement_above integer NOT NULL,
    ps_concept_counts integer NOT NULL,
    ps_risk_scores integer NOT NULL,
    ps_risk_scores_charlson integer NOT NULL,
    ps_risk_scores_dcsi integer NOT NULL,
    ps_risk_scores_chads2 integer NOT NULL,
    ps_risk_scores_chads2vasc integer NOT NULL,
    ps_interaction_year integer NOT NULL,
    ps_interaction_month integer NOT NULL,
    om_covariates integer NOT NULL,
    om_exclusion_id integer NOT NULL,
    om_inclusion_id integer NOT NULL,
    om_demographics integer NOT NULL,
    om_demographics_gender integer NOT NULL,
    om_demographics_race integer NOT NULL,
    om_demographics_ethnicity integer NOT NULL,
    om_demographics_age integer NOT NULL,
    om_demographics_year integer NOT NULL,
    om_demographics_month integer NOT NULL,
    om_trim integer NOT NULL,
    om_trim_fraction double precision NOT NULL,
    om_match integer NOT NULL,
    om_match_max_ratio integer NOT NULL,
    om_strat integer NOT NULL,
    om_strat_num_strata integer NOT NULL,
    om_condition_occ integer NOT NULL,
    om_condition_occ_365d integer NOT NULL,
    om_condition_occ_30d integer NOT NULL,
    om_condition_occ_inpt180d integer NOT NULL,
    om_condition_era integer NOT NULL,
    om_condition_era_ever integer NOT NULL,
    om_condition_era_overlap integer NOT NULL,
    om_condition_group integer NOT NULL,
    om_condition_group_meddra integer NOT NULL,
    om_condition_group_snomed integer NOT NULL,
    om_drug_exposure integer NOT NULL,
    om_drug_exposure_365d integer NOT NULL,
    om_drug_exposure_30d integer NOT NULL,
    om_drug_era integer NOT NULL,
    om_drug_era_365d integer NOT NULL,
    om_drug_era_30d integer NOT NULL,
    om_drug_era_overlap integer NOT NULL,
    om_drug_era_ever integer NOT NULL,
    om_drug_group integer NOT NULL,
    om_procedure_occ integer NOT NULL,
    om_procedure_occ_365d integer NOT NULL,
    om_procedure_occ_30d integer NOT NULL,
    om_procedure_group integer NOT NULL,
    om_observation integer NOT NULL,
    om_observation_365d integer NOT NULL,
    om_observation_30d integer NOT NULL,
    om_observation_count_365d integer NOT NULL,
    om_measurement integer NOT NULL,
    om_measurement_365d integer NOT NULL,
    om_measurement_30d integer NOT NULL,
    om_measurement_count_365d integer NOT NULL,
    om_measurement_below integer NOT NULL,
    om_measurement_above integer NOT NULL,
    om_concept_counts integer NOT NULL,
    om_risk_scores integer NOT NULL,
    om_risk_scores_charlson integer NOT NULL,
    om_risk_scores_dcsi integer NOT NULL,
    om_risk_scores_chads2 integer NOT NULL,
    om_risk_scores_chads2vasc integer NOT NULL,
    om_interaction_year integer NOT NULL,
    om_interaction_month integer NOT NULL,
    del_covariates_small_count integer NOT NULL,
    negative_control_id integer NOT NULL,
    executed timestamp(3) without time zone NOT NULL,
    execution_duration integer NOT NULL,
    execution_status integer NOT NULL,
    sec_user_id integer NOT NULL
);


ALTER TABLE cca_execution OWNER TO postgres;

--
-- Name: cohort; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort (
    cohort_definition_id integer NOT NULL,
    subject_id bigint NOT NULL,
    cohort_start_date date NOT NULL,
    cohort_end_date date NOT NULL
);


ALTER TABLE cohort OWNER TO postgres;

--
-- Name: cohort_concept_map; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_concept_map (
    cohort_definition_id integer,
    cohort_definition_name character varying(255),
    concept_id integer
);


ALTER TABLE cohort_concept_map OWNER TO postgres;

--
-- Name: cohort_definition; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_definition (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000),
    expression_type character varying(50),
    created_by character varying(255),
    created_date timestamp(3) without time zone,
    modified_by character varying(255),
    modified_date timestamp(3) without time zone
);


ALTER TABLE cohort_definition OWNER TO postgres;

--
-- Name: cohort_definition_details; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_definition_details (
    id integer NOT NULL,
    expression text NOT NULL
);


ALTER TABLE cohort_definition_details OWNER TO postgres;

--
-- Name: cohort_generation_info; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_generation_info (
    id integer NOT NULL,
    source_id integer NOT NULL,
    start_time timestamp(3) without time zone,
    execution_duration integer,
    status integer NOT NULL,
    is_valid boolean NOT NULL
);


ALTER TABLE cohort_generation_info OWNER TO postgres;

--
-- Name: cohort_inclusion; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_inclusion (
    cohort_definition_id integer NOT NULL,
    rule_sequence integer NOT NULL,
    name character varying(255),
    description character varying(1000)
);


ALTER TABLE cohort_inclusion OWNER TO postgres;

--
-- Name: cohort_inclusion_result; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_inclusion_result (
    cohort_definition_id integer NOT NULL,
    inclusion_rule_mask bigint NOT NULL,
    person_count bigint NOT NULL
);


ALTER TABLE cohort_inclusion_result OWNER TO postgres;

--
-- Name: cohort_inclusion_stats; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_inclusion_stats (
    cohort_definition_id integer NOT NULL,
    rule_sequence integer NOT NULL,
    person_count bigint NOT NULL,
    gain_count bigint NOT NULL,
    person_total bigint NOT NULL
);


ALTER TABLE cohort_inclusion_stats OWNER TO postgres;

--
-- Name: cohort_study; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_study (
    cohort_study_id integer NOT NULL,
    cohort_definition_id integer,
    study_type integer,
    study_name character varying(1000),
    study_url character varying(1000)
);


ALTER TABLE cohort_study OWNER TO postgres;

--
-- Name: cohort_study_cohort_study_id_seq; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE cohort_study_cohort_study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cohort_study_cohort_study_id_seq OWNER TO postgres;

--
-- Name: cohort_study_cohort_study_id_seq; Type: SEQUENCE OWNED BY; Schema: ohdsi; Owner: postgres
--

ALTER SEQUENCE cohort_study_cohort_study_id_seq OWNED BY cohort_study.cohort_study_id;


--
-- Name: cohort_summary_stats; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE cohort_summary_stats (
    cohort_definition_id integer NOT NULL,
    base_count bigint NOT NULL,
    final_count bigint NOT NULL
);


ALTER TABLE cohort_summary_stats OWNER TO postgres;

--
-- Name: concept_of_interest; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE concept_of_interest (
    id integer NOT NULL,
    concept_id integer,
    concept_of_interest_id integer
);


ALTER TABLE concept_of_interest OWNER TO postgres;

--
-- Name: concept_of_interest_id_seq; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE concept_of_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE concept_of_interest_id_seq OWNER TO postgres;

--
-- Name: concept_of_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: ohdsi; Owner: postgres
--

ALTER SEQUENCE concept_of_interest_id_seq OWNED BY concept_of_interest.id;


--
-- Name: concept_set_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE concept_set_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE concept_set_sequence OWNER TO postgres;

--
-- Name: concept_set; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE concept_set (
    concept_set_id integer DEFAULT nextval('concept_set_sequence'::regclass) NOT NULL,
    concept_set_name character varying(255) NOT NULL
);


ALTER TABLE concept_set OWNER TO postgres;

--
-- Name: concept_set_generation_info; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE concept_set_generation_info (
    concept_set_id integer NOT NULL,
    source_id integer NOT NULL,
    generation_type integer NOT NULL,
    start_time timestamp without time zone NOT NULL,
    execution_duration integer,
    status integer NOT NULL,
    is_valid boolean NOT NULL
);


ALTER TABLE concept_set_generation_info OWNER TO postgres;

--
-- Name: concept_set_item_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE concept_set_item_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE concept_set_item_sequence OWNER TO postgres;

--
-- Name: concept_set_item; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE concept_set_item (
    concept_set_item_id integer DEFAULT nextval('concept_set_item_sequence'::regclass) NOT NULL,
    concept_set_id integer NOT NULL,
    concept_id integer NOT NULL,
    is_excluded integer NOT NULL,
    include_descendants integer NOT NULL,
    include_mapped integer NOT NULL
);


ALTER TABLE concept_set_item OWNER TO postgres;

--
-- Name: concept_set_negative_controls_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE concept_set_negative_controls_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE concept_set_negative_controls_sequence OWNER TO postgres;

--
-- Name: concept_set_negative_controls; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE concept_set_negative_controls (
    id integer DEFAULT nextval('concept_set_negative_controls_sequence'::regclass) NOT NULL,
    source_id integer NOT NULL,
    concept_set_id integer NOT NULL,
    concept_set_name character varying(255) NOT NULL,
    concept_id integer NOT NULL,
    concept_name character varying(255) NOT NULL,
    domain_id character varying(255) NOT NULL,
    medline_ct double precision,
    medline_case double precision,
    medline_other double precision,
    semmeddb_ct_t double precision,
    semmeddb_case_t double precision,
    semmeddb_other_t double precision,
    semmeddb_ct_f double precision,
    semmeddb_case_f double precision,
    semmeddb_other_f double precision,
    eu_spc double precision,
    spl_adr double precision,
    aers double precision,
    aers_prr double precision,
    medline_ct_scaled double precision,
    medline_case_scaled double precision,
    medline_other_scaled double precision,
    semmeddb_ct_t_scaled double precision,
    semmeddb_case_t_scaled double precision,
    semmeddb_other_t_scaled double precision,
    semmeddb_ct_f_scaled double precision,
    semmeddb_case_f_scaled double precision,
    semmeddb_other_f_scaled double precision,
    eu_spc_scaled double precision,
    spl_adr_scaled double precision,
    aers_scaled double precision,
    aers_prr_scaled double precision,
    medline_ct_beta double precision,
    medline_case_beta double precision,
    medline_other_beta double precision,
    semmeddb_ct_t_beta double precision,
    semmeddb_case_t_beta double precision,
    semmeddb_other_t_beta double precision,
    semmeddb_ct_f_beta double precision,
    semmeddb_case_f_beta double precision,
    semmeddb_other_f_beta double precision,
    eu_spc_beta double precision,
    spl_adr_beta double precision,
    aers_beta double precision,
    aers_prr_beta double precision,
    raw_prediction double precision,
    prediction double precision
);


ALTER TABLE concept_set_negative_controls OWNER TO postgres;

--
-- Name: drug_hoi_evidence_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE drug_hoi_evidence_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE drug_hoi_evidence_sequence OWNER TO postgres;

--
-- Name: drug_hoi_evidence; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE drug_hoi_evidence (
    id integer DEFAULT nextval('drug_hoi_evidence_sequence'::regclass) NOT NULL,
    drug_hoi_relationship character varying(50),
    evidence_type character varying(4000),
    supports character varying(1),
    evidence_source_code_id integer,
    statistic_value numeric,
    evidence_linkout character varying(4000),
    statistic_type character varying(4000)
);


ALTER TABLE drug_hoi_evidence OWNER TO postgres;

--
-- Name: COLUMN drug_hoi_evidence.id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.id IS 'primary key';


--
-- Name: COLUMN drug_hoi_evidence.drug_hoi_relationship; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.drug_hoi_relationship IS 'foreign key to the drug_HOI_relationship id';


--
-- Name: COLUMN drug_hoi_evidence.evidence_type; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.evidence_type IS 'the type of evidence (literature, product label, pharmacovigilance, EHR)';


--
-- Name: COLUMN drug_hoi_evidence.supports; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.supports IS 'Whether or not the relationship of evidence is to refute the assertion';


--
-- Name: COLUMN drug_hoi_evidence.evidence_source_code_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.evidence_source_code_id IS 'a code indicating the actual source of evidence (e.g., PubMed, US SPLs, EU SPC, VigiBase, etc)';


--
-- Name: COLUMN drug_hoi_evidence.statistic_value; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.statistic_value IS 'For literature-like (e.g., PubMed abstracts, product labeling) sources this holds the count of the number of items of the evidence type present in the evidence base from that source (several rules are used to derive the counts, see documentation on the knowledge-base wiki). From signal detection sources, the result of applying the algorithm indicated in the evidence_type column is shown.';


--
-- Name: COLUMN drug_hoi_evidence.evidence_linkout; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.evidence_linkout IS 'For literature-like (e.g., PubMed abstracts, product labeling), this holds a URL that will resolve to a query against the RDF endpoint for all resources used to generate the evidence_count. For signal detection sources, this holds a link to metadata on the algorithm and how it was applied to arrive at the statistical value.';


--
-- Name: COLUMN drug_hoi_evidence.statistic_type; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_evidence.statistic_type IS 'For literature-like (e.g., PubMed abstracts, product labeling), and other count based methods this holds COUNT. For signal detection sources, this holds a string indicating the type of the result value (e.g., AERS_EBGM, AERS_EB05)';


--
-- Name: drug_hoi_relationship; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE drug_hoi_relationship (
    id character varying(50) NOT NULL,
    drug integer,
    rxnorm_drug character varying(4000),
    hoi integer,
    snomed_hoi character varying(4000)
);


ALTER TABLE drug_hoi_relationship OWNER TO postgres;

--
-- Name: COLUMN drug_hoi_relationship.drug; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_relationship.drug IS 'OMOP/IMEDS Concept ID for the drug';


--
-- Name: COLUMN drug_hoi_relationship.rxnorm_drug; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_relationship.rxnorm_drug IS 'RxNorm Preferred Term of the Drug';


--
-- Name: COLUMN drug_hoi_relationship.hoi; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_relationship.hoi IS 'OMOP/IMEDS Concept ID for the Health Outcome of Interest';


--
-- Name: COLUMN drug_hoi_relationship.snomed_hoi; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN drug_hoi_relationship.snomed_hoi IS 'SNOMED preferred term of the Health Outcome of Interest';


--
-- Name: drug_labels; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE drug_labels (
    drug_label_id bigint NOT NULL,
    search_name character varying(255),
    ingredient_concept_id bigint,
    ingredient_concept_name character varying(255),
    setid character varying(255),
    date timestamp(3) without time zone,
    cohort_id integer,
    image_url character varying(255)
);


ALTER TABLE drug_labels OWNER TO postgres;

--
-- Name: evidence_sources_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE evidence_sources_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evidence_sources_sequence OWNER TO postgres;

--
-- Name: evidence_sources; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE evidence_sources (
    id integer DEFAULT nextval('evidence_sources_sequence'::regclass) NOT NULL,
    title character varying(4000),
    description character varying(4000),
    contributer character varying(4000),
    creator character varying(4000),
    creation_date date NOT NULL,
    rights character varying(4000),
    source character varying(4000),
    coverage_start_date date,
    coverage_end_date date
);


ALTER TABLE evidence_sources OWNER TO postgres;

--
-- Name: COLUMN evidence_sources.title; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.title IS 'a short name for the evidence source. Same as http://purl.org/dc/elements/1.1/title';


--
-- Name: COLUMN evidence_sources.description; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.description IS 'Description of the evidence source. Same as http://purl.org/dc/elements/1.1/description';


--
-- Name: COLUMN evidence_sources.contributer; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.contributer IS 'Same as http://purl.org/dc/elements/1.1/contributor';


--
-- Name: COLUMN evidence_sources.creator; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.creator IS 'Same as http://purl.org/dc/elements/1.1/creator';


--
-- Name: COLUMN evidence_sources.creation_date; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.creation_date IS 'Date that the source was created. For example, if the source was created in 2010 but added to the knowledge base in 2014, the creation date would be 2010';


--
-- Name: COLUMN evidence_sources.rights; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.rights IS 'Same as http://purl.org/dc/elements/1.1/rights';


--
-- Name: COLUMN evidence_sources.source; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.source IS 'The source from which this data was derived. Same as http://purl.org/dc/elements/1.1/source';


--
-- Name: COLUMN evidence_sources.coverage_start_date; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.coverage_start_date IS 'The start date of coverage for the resource. Data can be trusted on or after this date and up to and including the coverage_end_date';


--
-- Name: COLUMN evidence_sources.coverage_end_date; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN evidence_sources.coverage_end_date IS 'The date of coverage for the resource. Data can be trusted on or after the coverage_start_date date and up to and including this date';


--
-- Name: exampleapp_widget; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE exampleapp_widget (
    id bigint NOT NULL,
    name character varying(50)
);


ALTER TABLE exampleapp_widget OWNER TO postgres;

--
-- Name: feas_study_generation_info; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE feas_study_generation_info (
    study_id integer NOT NULL,
    source_id integer NOT NULL,
    start_time timestamp(3) without time zone,
    execution_duration integer,
    status integer NOT NULL,
    is_valid boolean NOT NULL
);


ALTER TABLE feas_study_generation_info OWNER TO postgres;

--
-- Name: feas_study_inclusion_stats; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE feas_study_inclusion_stats (
    study_id integer NOT NULL,
    rule_sequence integer NOT NULL,
    name character varying(255) NOT NULL,
    person_count bigint NOT NULL,
    gain_count bigint NOT NULL,
    person_total bigint NOT NULL
);


ALTER TABLE feas_study_inclusion_stats OWNER TO postgres;

--
-- Name: feas_study_index_stats; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE feas_study_index_stats (
    study_id integer NOT NULL,
    person_count bigint NOT NULL,
    match_count bigint NOT NULL
);


ALTER TABLE feas_study_index_stats OWNER TO postgres;

--
-- Name: feas_study_result; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE feas_study_result (
    study_id integer NOT NULL,
    inclusion_rule_mask bigint NOT NULL,
    person_count bigint NOT NULL
);


ALTER TABLE feas_study_result OWNER TO postgres;

--
-- Name: feasibility_inclusion; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE feasibility_inclusion (
    study_id integer NOT NULL,
    sequence integer NOT NULL,
    name character varying(255),
    description character varying(1000),
    expression text
);


ALTER TABLE feasibility_inclusion OWNER TO postgres;

--
-- Name: feasibility_study; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE feasibility_study (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000),
    index_def_id integer,
    result_def_id integer,
    created_by character varying(255),
    created_date timestamp(3) without time zone,
    modified_by character varying(255),
    modified_date timestamp(3) without time zone
);


ALTER TABLE feasibility_study OWNER TO postgres;

--
-- Name: heracles_analysis; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE heracles_analysis (
    analysis_id integer,
    analysis_name character varying(255),
    stratum_1_name character varying(255),
    stratum_2_name character varying(255),
    stratum_3_name character varying(255),
    stratum_4_name character varying(255),
    stratum_5_name character varying(255),
    analysis_type character varying(255)
);


ALTER TABLE heracles_analysis OWNER TO postgres;

--
-- Name: heracles_heel_results; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE heracles_heel_results (
    cohort_definition_id integer,
    analysis_id integer,
    heracles_heel_warning character varying(255)
);


ALTER TABLE heracles_heel_results OWNER TO postgres;

--
-- Name: heracles_results; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE heracles_results (
    cohort_definition_id integer,
    analysis_id integer,
    stratum_1 character varying(255),
    stratum_2 character varying(255),
    stratum_3 character varying(255),
    stratum_4 character varying(255),
    stratum_5 character varying(255),
    count_value bigint,
    last_update_time timestamp without time zone DEFAULT now()
);


ALTER TABLE heracles_results OWNER TO postgres;

--
-- Name: heracles_results_dist; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE heracles_results_dist (
    cohort_definition_id integer,
    analysis_id integer,
    stratum_1 character varying(255),
    stratum_2 character varying(255),
    stratum_3 character varying(255),
    stratum_4 character varying(255),
    stratum_5 character varying(255),
    count_value bigint,
    min_value double precision,
    max_value double precision,
    avg_value double precision,
    stdev_value double precision,
    median_value double precision,
    p10_value double precision,
    p25_value double precision,
    p75_value double precision,
    p90_value double precision,
    last_update_time timestamp without time zone DEFAULT now()
);


ALTER TABLE heracles_results_dist OWNER TO postgres;

--
-- Name: heracles_visualization_data; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE heracles_visualization_data (
    id integer NOT NULL,
    cohort_definition_id integer NOT NULL,
    source_id integer NOT NULL,
    visualization_key character varying(300) NOT NULL,
    drilldown_id integer,
    data text NOT NULL,
    end_time timestamp(3) without time zone NOT NULL
);


ALTER TABLE heracles_visualization_data OWNER TO postgres;

--
-- Name: heracles_viz_data_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE heracles_viz_data_sequence
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE heracles_viz_data_sequence OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: ir_analysis; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE ir_analysis (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(1000),
    created_by character varying(255),
    created_date timestamp(3) without time zone,
    modified_by character varying(255),
    modified_date timestamp(3) without time zone
);


ALTER TABLE ir_analysis OWNER TO postgres;

--
-- Name: ir_analysis_details; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE ir_analysis_details (
    id integer NOT NULL,
    expression text NOT NULL
);


ALTER TABLE ir_analysis_details OWNER TO postgres;

--
-- Name: ir_analysis_dist; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE ir_analysis_dist (
    analysis_id integer NOT NULL,
    target_id integer NOT NULL,
    outcome_id integer NOT NULL,
    strata_sequence integer,
    dist_type integer NOT NULL,
    total bigint NOT NULL,
    avg_value double precision NOT NULL,
    std_dev double precision NOT NULL,
    min_value integer NOT NULL,
    p10_value integer NOT NULL,
    p25_value integer NOT NULL,
    median_value integer NOT NULL,
    p75_value integer NOT NULL,
    p90_value integer NOT NULL,
    max_value integer
);


ALTER TABLE ir_analysis_dist OWNER TO postgres;

--
-- Name: ir_analysis_result; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE ir_analysis_result (
    analysis_id integer NOT NULL,
    target_id integer NOT NULL,
    outcome_id integer NOT NULL,
    strata_mask bigint NOT NULL,
    person_count bigint NOT NULL,
    time_at_risk bigint NOT NULL,
    cases bigint NOT NULL
);


ALTER TABLE ir_analysis_result OWNER TO postgres;

--
-- Name: ir_analysis_strata_stats; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE ir_analysis_strata_stats (
    analysis_id integer NOT NULL,
    target_id integer NOT NULL,
    outcome_id integer NOT NULL,
    strata_sequence integer NOT NULL,
    person_count bigint NOT NULL,
    time_at_risk bigint NOT NULL,
    cases bigint NOT NULL
);


ALTER TABLE ir_analysis_strata_stats OWNER TO postgres;

--
-- Name: ir_execution; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE ir_execution (
    analysis_id integer NOT NULL,
    source_id integer NOT NULL,
    start_time timestamp(3) without time zone,
    execution_duration integer,
    status integer NOT NULL,
    is_valid boolean NOT NULL,
    message character varying(2000)
);


ALTER TABLE ir_execution OWNER TO postgres;

--
-- Name: ir_strata; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE ir_strata (
    analysis_id integer NOT NULL,
    strata_sequence integer NOT NULL,
    name character varying(255),
    description character varying(1000)
);


ALTER TABLE ir_strata OWNER TO postgres;

--
-- Name: laertes_summary_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE laertes_summary_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE laertes_summary_sequence OWNER TO postgres;

--
-- Name: laertes_summary; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE laertes_summary (
    id integer DEFAULT nextval('laertes_summary_sequence'::regclass) NOT NULL,
    report_order integer,
    report_name character varying(4000),
    ingredient_id integer,
    ingredient character varying(4000),
    clinical_drug_id integer,
    clinical_drug character varying(4000),
    hoi_id integer,
    hoi character varying(4000),
    medline_ct_count integer,
    medline_case_count integer,
    medline_other_count integer,
    splicer_count integer,
    eu_spc_count integer,
    semmeddb_ct_count integer,
    semmeddb_case_count integer,
    semmeddb_neg_ct_count integer,
    semmeddb_neg_case_count integer,
    aers_report_count integer,
    prr numeric,
    ctd_chemical_disease_count integer,
    semmeddb_other_count integer,
    semmeddb_neg_other_count integer
);


ALTER TABLE laertes_summary OWNER TO postgres;

--
-- Name: COLUMN laertes_summary.id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.id IS 'primary key';


--
-- Name: COLUMN laertes_summary.report_order; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.report_order IS 'there are several reports in this summary, this is an identifier for each report';


--
-- Name: COLUMN laertes_summary.report_name; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.report_name IS 'there are several reports in this summary, this is a name of the report';


--
-- Name: COLUMN laertes_summary.ingredient_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.ingredient_id IS 'a drug ingredient CONCEPT_ID';


--
-- Name: COLUMN laertes_summary.ingredient; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.ingredient IS 'a drug ingredient name';


--
-- Name: COLUMN laertes_summary.clinical_drug_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.clinical_drug_id IS 'if a clinical drug exists, the clinical drug CONCEPT_ID';


--
-- Name: COLUMN laertes_summary.clinical_drug; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.clinical_drug IS 'if a clinical drug exists, the clinical drug name';


--
-- Name: COLUMN laertes_summary.hoi_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.hoi_id IS 'the HOI CONCEPT_ID, this is at the SNOMED level';


--
-- Name: COLUMN laertes_summary.hoi; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.hoi IS 'the HOI name, this is at the SNOMED level';


--
-- Name: COLUMN laertes_summary.splicer_count; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.splicer_count IS 'counts of SPLs that mention specific drugs and hois';


--
-- Name: COLUMN laertes_summary.eu_spc_count; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN laertes_summary.eu_spc_count IS 'counts of SPCs that mention specific drugs and hois';


--
-- Name: penelope_laertes_uni_pivot; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE penelope_laertes_uni_pivot (
    condition_concept_id integer,
    condition_concept_name character varying(255),
    ingredient_concept_id integer,
    ingredient_concept_name character varying(255),
    medline_ct integer,
    medline_case integer,
    medline_other integer,
    semmeddb_ct_t integer,
    semmeddb_case_t integer,
    semmeddb_other_t integer,
    semmeddb_ct_f integer,
    semmeddb_case_f integer,
    semmeddb_other_f integer,
    eu_spc integer,
    spl_adr integer,
    aers integer,
    aers_prr numeric,
    aers_prr_original numeric
);


ALTER TABLE penelope_laertes_uni_pivot OWNER TO postgres;

--
-- Name: penelope_laertes_universe; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE penelope_laertes_universe (
    id bigint,
    condition_concept_id integer,
    condition_concept_name character varying(255),
    ingredient_concept_id integer,
    ingredient_concept_name character varying(255),
    evidence_type character varying(255),
    supports character(1),
    statistic_value numeric,
    evidence_linkouts text
);


ALTER TABLE penelope_laertes_universe OWNER TO postgres;

--
-- Name: schema_version; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE schema_version (
    version_rank integer NOT NULL,
    installed_rank integer NOT NULL,
    version character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE schema_version OWNER TO postgres;

--
-- Name: sec_permission_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE sec_permission_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec_permission_sequence OWNER TO postgres;

--
-- Name: sec_permission; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE sec_permission (
    id integer DEFAULT nextval('sec_permission_sequence'::regclass) NOT NULL,
    value character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE sec_permission OWNER TO postgres;

--
-- Name: COLUMN sec_permission.id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_permission.id IS 'Primary key';


--
-- Name: COLUMN sec_permission.value; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_permission.value IS 'Permission';


--
-- Name: COLUMN sec_permission.description; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_permission.description IS 'Desctiption of permission';


--
-- Name: sec_role_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE sec_role_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec_role_sequence OWNER TO postgres;

--
-- Name: sec_role; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE sec_role (
    id integer DEFAULT nextval('sec_role_sequence'::regclass) NOT NULL,
    name character varying(255)
);


ALTER TABLE sec_role OWNER TO postgres;

--
-- Name: COLUMN sec_role.id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_role.id IS 'primary key';


--
-- Name: COLUMN sec_role.name; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_role.name IS 'Role name';


--
-- Name: sec_role_permission_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE sec_role_permission_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec_role_permission_sequence OWNER TO postgres;

--
-- Name: sec_role_permission; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE sec_role_permission (
    id integer DEFAULT nextval('sec_role_permission_sequence'::regclass) NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    status character varying(255)
);


ALTER TABLE sec_role_permission OWNER TO postgres;

--
-- Name: COLUMN sec_role_permission.id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_role_permission.id IS 'Primary key';


--
-- Name: COLUMN sec_role_permission.role_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_role_permission.role_id IS 'Foreign key to SEC_ROLE';


--
-- Name: COLUMN sec_role_permission.permission_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_role_permission.permission_id IS 'Foreign key to SEC_PERMISSION';


--
-- Name: COLUMN sec_role_permission.status; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_role_permission.status IS 'Status of relation between role and permission';


--
-- Name: sec_user_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE sec_user_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec_user_sequence OWNER TO postgres;

--
-- Name: sec_user; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE sec_user (
    id integer DEFAULT nextval('sec_user_sequence'::regclass) NOT NULL,
    login character varying(50),
    password character varying(255),
    salt character varying(255),
    name character varying(100)
);


ALTER TABLE sec_user OWNER TO postgres;

--
-- Name: COLUMN sec_user.id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user.id IS 'primary key';


--
-- Name: COLUMN sec_user.login; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user.login IS 'Login';


--
-- Name: COLUMN sec_user.password; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user.password IS 'Password';


--
-- Name: COLUMN sec_user.salt; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user.salt IS 'Salt for password encoding';


--
-- Name: COLUMN sec_user.name; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user.name IS 'Displayed name for user';


--
-- Name: sec_user_role_sequence; Type: SEQUENCE; Schema: ohdsi; Owner: postgres
--

CREATE SEQUENCE sec_user_role_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec_user_role_sequence OWNER TO postgres;

--
-- Name: sec_user_role; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE sec_user_role (
    id integer DEFAULT nextval('sec_user_role_sequence'::regclass) NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    status character varying(255)
);


ALTER TABLE sec_user_role OWNER TO postgres;

--
-- Name: COLUMN sec_user_role.id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user_role.id IS 'Primary key';


--
-- Name: COLUMN sec_user_role.user_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user_role.user_id IS 'Foreign key to SEC_USER';


--
-- Name: COLUMN sec_user_role.role_id; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user_role.role_id IS 'Foreign key to SEC_ROLE';


--
-- Name: COLUMN sec_user_role.status; Type: COMMENT; Schema: ohdsi; Owner: postgres
--

COMMENT ON COLUMN sec_user_role.status IS 'Status of relation between user and role';


--
-- Name: source; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE source (
    source_id integer NOT NULL,
    source_name character varying(255) NOT NULL,
    source_key character varying(50) NOT NULL,
    source_connection character varying(8000) NOT NULL,
    source_dialect character varying(255) NOT NULL
);


ALTER TABLE source OWNER TO postgres;

--
-- Name: source_daimon; Type: TABLE; Schema: ohdsi; Owner: postgres
--

CREATE TABLE source_daimon (
    source_daimon_id integer NOT NULL,
    source_id integer NOT NULL,
    daimon_type integer NOT NULL,
    table_qualifier character varying(255) NOT NULL,
    priority integer NOT NULL
);


ALTER TABLE source_daimon OWNER TO postgres;

--
-- Name: cohort_study cohort_study_id; Type: DEFAULT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY cohort_study ALTER COLUMN cohort_study_id SET DEFAULT nextval('cohort_study_cohort_study_id_seq'::regclass);


--
-- Name: concept_of_interest id; Type: DEFAULT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY concept_of_interest ALTER COLUMN id SET DEFAULT nextval('concept_of_interest_id_seq'::regclass);


--
-- Data for Name: batch_job_execution; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY batch_job_execution (job_execution_id, version, job_instance_id, create_time, start_time, end_time, status, exit_code, exit_message, last_updated, job_configuration_location) FROM stdin;
\.


--
-- Data for Name: batch_job_execution_context; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY batch_job_execution_context (job_execution_id, short_context, serialized_context) FROM stdin;
\.


--
-- Data for Name: batch_job_execution_params; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY batch_job_execution_params (job_execution_id, type_cd, key_name, string_val, date_val, long_val, double_val, identifying) FROM stdin;
\.


--
-- Name: batch_job_execution_seq; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('batch_job_execution_seq', 1, false);


--
-- Data for Name: batch_job_instance; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY batch_job_instance (job_instance_id, version, job_name, job_key) FROM stdin;
\.


--
-- Name: batch_job_seq; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('batch_job_seq', 1, false);


--
-- Data for Name: batch_step_execution; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY batch_step_execution (step_execution_id, version, step_name, job_execution_id, start_time, end_time, status, commit_count, read_count, filter_count, write_count, read_skip_count, write_skip_count, process_skip_count, rollback_count, exit_code, exit_message, last_updated) FROM stdin;
\.


--
-- Data for Name: batch_step_execution_context; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY batch_step_execution_context (step_execution_id, short_context, serialized_context) FROM stdin;
\.


--
-- Name: batch_step_execution_seq; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('batch_step_execution_seq', 1, false);


--
-- Data for Name: cca; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cca (cca_id, name, treatment_id, comparator_id, outcome_id, model_type, time_at_risk_start, time_at_risk_end, add_exposure_days_to_end, minimum_washout_period, minimum_days_at_risk, rm_subjects_in_both_cohorts, rm_prior_outcomes, ps_adjustment, ps_exclusion_id, ps_inclusion_id, ps_demographics, ps_demographics_gender, ps_demographics_race, ps_demographics_ethnicity, ps_demographics_age, ps_demographics_year, ps_demographics_month, ps_trim, ps_trim_fraction, ps_match, ps_match_max_ratio, ps_strat, ps_strat_num_strata, ps_condition_occ, ps_condition_occ_365d, ps_condition_occ_30d, ps_condition_occ_inpt180d, ps_condition_era, ps_condition_era_ever, ps_condition_era_overlap, ps_condition_group, ps_condition_group_meddra, ps_condition_group_snomed, ps_drug_exposure, ps_drug_exposure_365d, ps_drug_exposure_30d, ps_drug_era, ps_drug_era_365d, ps_drug_era_30d, ps_drug_era_overlap, ps_drug_era_ever, ps_drug_group, ps_procedure_occ, ps_procedure_occ_365d, ps_procedure_occ_30d, ps_procedure_group, ps_observation, ps_observation_365d, ps_observation_30d, ps_observation_count_365d, ps_measurement, ps_measurement_365d, ps_measurement_30d, ps_measurement_count_365d, ps_measurement_below, ps_measurement_above, ps_concept_counts, ps_risk_scores, ps_risk_scores_charlson, ps_risk_scores_dcsi, ps_risk_scores_chads2, ps_risk_scores_chads2vasc, ps_interaction_year, ps_interaction_month, om_covariates, om_exclusion_id, om_inclusion_id, om_demographics, om_demographics_gender, om_demographics_race, om_demographics_ethnicity, om_demographics_age, om_demographics_year, om_demographics_month, om_trim, om_trim_fraction, om_match, om_match_max_ratio, om_strat, om_strat_num_strata, om_condition_occ, om_condition_occ_365d, om_condition_occ_30d, om_condition_occ_inpt180d, om_condition_era, om_condition_era_ever, om_condition_era_overlap, om_condition_group, om_condition_group_meddra, om_condition_group_snomed, om_drug_exposure, om_drug_exposure_365d, om_drug_exposure_30d, om_drug_era, om_drug_era_365d, om_drug_era_30d, om_drug_era_overlap, om_drug_era_ever, om_drug_group, om_procedure_occ, om_procedure_occ_365d, om_procedure_occ_30d, om_procedure_group, om_observation, om_observation_365d, om_observation_30d, om_observation_count_365d, om_measurement, om_measurement_365d, om_measurement_30d, om_measurement_count_365d, om_measurement_below, om_measurement_above, om_concept_counts, om_risk_scores, om_risk_scores_charlson, om_risk_scores_dcsi, om_risk_scores_chads2, om_risk_scores_chads2vasc, om_interaction_year, om_interaction_month, del_covariates_small_count, negative_control_id, created, modified, sec_user_id) FROM stdin;
\.


--
-- Data for Name: cca_execution; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cca_execution (cca_execution_id, cca_id, source_id, treatment_id, comparator_id, outcome_id, model_type, time_at_risk_start, time_at_risk_end, add_exposure_days_to_end, minimum_washout_period, minimum_days_at_risk, rm_subjects_in_both_cohorts, rm_prior_outcomes, ps_adjustment, ps_exclusion_id, ps_inclusion_id, ps_demographics, ps_demographics_gender, ps_demographics_race, ps_demographics_ethnicity, ps_demographics_age, ps_demographics_year, ps_demographics_month, ps_trim, ps_trim_fraction, ps_match, ps_match_max_ratio, ps_strat, ps_strat_num_strata, ps_condition_occ, ps_condition_occ_365d, ps_condition_occ_30d, ps_condition_occ_inpt180d, ps_condition_era, ps_condition_era_ever, ps_condition_era_overlap, ps_condition_group, ps_condition_group_meddra, ps_condition_group_snomed, ps_drug_exposure, ps_drug_exposure_365d, ps_drug_exposure_30d, ps_drug_era, ps_drug_era_365d, ps_drug_era_30d, ps_drug_era_overlap, ps_drug_era_ever, ps_drug_group, ps_procedure_occ, ps_procedure_occ_365d, ps_procedure_occ_30d, ps_procedure_group, ps_observation, ps_observation_365d, ps_observation_30d, ps_observation_count_365d, ps_measurement, ps_measurement_365d, ps_measurement_30d, ps_measurement_count_365d, ps_measurement_below, ps_measurement_above, ps_concept_counts, ps_risk_scores, ps_risk_scores_charlson, ps_risk_scores_dcsi, ps_risk_scores_chads2, ps_risk_scores_chads2vasc, ps_interaction_year, ps_interaction_month, om_covariates, om_exclusion_id, om_inclusion_id, om_demographics, om_demographics_gender, om_demographics_race, om_demographics_ethnicity, om_demographics_age, om_demographics_year, om_demographics_month, om_trim, om_trim_fraction, om_match, om_match_max_ratio, om_strat, om_strat_num_strata, om_condition_occ, om_condition_occ_365d, om_condition_occ_30d, om_condition_occ_inpt180d, om_condition_era, om_condition_era_ever, om_condition_era_overlap, om_condition_group, om_condition_group_meddra, om_condition_group_snomed, om_drug_exposure, om_drug_exposure_365d, om_drug_exposure_30d, om_drug_era, om_drug_era_365d, om_drug_era_30d, om_drug_era_overlap, om_drug_era_ever, om_drug_group, om_procedure_occ, om_procedure_occ_365d, om_procedure_occ_30d, om_procedure_group, om_observation, om_observation_365d, om_observation_30d, om_observation_count_365d, om_measurement, om_measurement_365d, om_measurement_30d, om_measurement_count_365d, om_measurement_below, om_measurement_above, om_concept_counts, om_risk_scores, om_risk_scores_charlson, om_risk_scores_dcsi, om_risk_scores_chads2, om_risk_scores_chads2vasc, om_interaction_year, om_interaction_month, del_covariates_small_count, negative_control_id, executed, execution_duration, execution_status, sec_user_id) FROM stdin;
\.


--
-- Data for Name: cohort; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date) FROM stdin;
\.


--
-- Data for Name: cohort_concept_map; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_concept_map (cohort_definition_id, cohort_definition_name, concept_id) FROM stdin;
\.


--
-- Data for Name: cohort_definition; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_definition (id, name, description, expression_type, created_by, created_date, modified_by, modified_date) FROM stdin;
\.


--
-- Data for Name: cohort_definition_details; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_definition_details (id, expression) FROM stdin;
\.


--
-- Data for Name: cohort_generation_info; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_generation_info (id, source_id, start_time, execution_duration, status, is_valid) FROM stdin;
\.


--
-- Data for Name: cohort_inclusion; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_inclusion (cohort_definition_id, rule_sequence, name, description) FROM stdin;
\.


--
-- Data for Name: cohort_inclusion_result; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_inclusion_result (cohort_definition_id, inclusion_rule_mask, person_count) FROM stdin;
\.


--
-- Data for Name: cohort_inclusion_stats; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_inclusion_stats (cohort_definition_id, rule_sequence, person_count, gain_count, person_total) FROM stdin;
\.


--
-- Data for Name: cohort_study; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_study (cohort_study_id, cohort_definition_id, study_type, study_name, study_url) FROM stdin;
1	296	1	Treatment Pathways in Chronic Disease	http://www.ohdsi.org/web/wiki/doku.php?id=research:treatment_pathways_in_chronic_disease
2	296	1	Early Treatment Pathways in Chronic Disease	http://www.ohdsi.org/web/wiki/doku.php?id=research:treatment_pathways_in_chronic_disease_12_mos
3	296	1	Drug Utilization in Childre	http://www.ohdsi.org/web/wiki/doku.php?id=research:drugs_in_peds
4	293	1	Drug Utilization in Childre	http://www.ohdsi.org/web/wiki/doku.php?id=research:drugs_in_peds
5	293	2	Population-level estimation of comparative risks of Celecoxib versus non-selective NSAIDs	http://www.ohdsi.org/web/wiki/doku.php?id=research:celecoxib_vs_nsnsaids
6	293	3	Predicting outcomes for new users of celecoxib	http://www.ohdsi.org/web/wiki/doku.php?id=research:celecoxib_prediction_models
\.


--
-- Name: cohort_study_cohort_study_id_seq; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('cohort_study_cohort_study_id_seq', 1, false);


--
-- Data for Name: cohort_summary_stats; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY cohort_summary_stats (cohort_definition_id, base_count, final_count) FROM stdin;
\.


--
-- Data for Name: concept_of_interest; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY concept_of_interest (id, concept_id, concept_of_interest_id) FROM stdin;
1	4329847	4185932
2	4329847	77670
3	192671	4247120
4	192671	201340
5	192671	4266809
6	192359	4242411
7	197320	4242411
8	432791	43021226
9	319835	316139
10	319835	4024552
11	316139	4024552
12	312327	4329847
13	312327	4185932
14	197508	200680
15	4290333	4174977
16	4170143	4085100
17	378253	318736
18	4283893	4138403
19	312327	321318
20	4329847	321318
21	312327	77670
22	73153	200680
23	4181583	257011
24	194984	137977
25	137977	194984
26	4245975	194984
27	312327	321318
28	312327	77670
29	319835	433595
30	319835	321319
31	4181583	4085100
32	4283893	4138403
33	316139	433595
34	316139	321319
35	4181583	254761
36	437312	192671
37	381316	381591
38	4030518	4242411
39	198124	4242411
40	4220631	4242411
41	4152839	4242411
42	4148381	441202
\.


--
-- Name: concept_of_interest_id_seq; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('concept_of_interest_id_seq', 1, false);


--
-- Data for Name: concept_set; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY concept_set (concept_set_id, concept_set_name) FROM stdin;
\.


--
-- Data for Name: concept_set_generation_info; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY concept_set_generation_info (concept_set_id, source_id, generation_type, start_time, execution_duration, status, is_valid) FROM stdin;
\.


--
-- Data for Name: concept_set_item; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY concept_set_item (concept_set_item_id, concept_set_id, concept_id, is_excluded, include_descendants, include_mapped) FROM stdin;
\.


--
-- Name: concept_set_item_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('concept_set_item_sequence', 1, false);


--
-- Data for Name: concept_set_negative_controls; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY concept_set_negative_controls (id, source_id, concept_set_id, concept_set_name, concept_id, concept_name, domain_id, medline_ct, medline_case, medline_other, semmeddb_ct_t, semmeddb_case_t, semmeddb_other_t, semmeddb_ct_f, semmeddb_case_f, semmeddb_other_f, eu_spc, spl_adr, aers, aers_prr, medline_ct_scaled, medline_case_scaled, medline_other_scaled, semmeddb_ct_t_scaled, semmeddb_case_t_scaled, semmeddb_other_t_scaled, semmeddb_ct_f_scaled, semmeddb_case_f_scaled, semmeddb_other_f_scaled, eu_spc_scaled, spl_adr_scaled, aers_scaled, aers_prr_scaled, medline_ct_beta, medline_case_beta, medline_other_beta, semmeddb_ct_t_beta, semmeddb_case_t_beta, semmeddb_other_t_beta, semmeddb_ct_f_beta, semmeddb_case_f_beta, semmeddb_other_f_beta, eu_spc_beta, spl_adr_beta, aers_beta, aers_prr_beta, raw_prediction, prediction) FROM stdin;
\.


--
-- Name: concept_set_negative_controls_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('concept_set_negative_controls_sequence', 1, false);


--
-- Name: concept_set_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('concept_set_sequence', 1, false);


--
-- Data for Name: drug_hoi_evidence; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY drug_hoi_evidence (id, drug_hoi_relationship, evidence_type, supports, evidence_source_code_id, statistic_value, evidence_linkout, statistic_type) FROM stdin;
\.


--
-- Name: drug_hoi_evidence_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('drug_hoi_evidence_sequence', 1, false);


--
-- Data for Name: drug_hoi_relationship; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY drug_hoi_relationship (id, drug, rxnorm_drug, hoi, snomed_hoi) FROM stdin;
\.


--
-- Data for Name: drug_labels; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY drug_labels (drug_label_id, search_name, ingredient_concept_id, ingredient_concept_name, setid, date, cohort_id, image_url) FROM stdin;
1	A+D DIAPER RASH (Topical)	916662	dimethicone	297e62e4-5282-4733-b3f7-f63a16e8ddee	2011-07-26 00:00:00	\N	\N
2	Abacavir (Oral Pill)	1736971	abacavir	73ce0bc5-43e2-c57f-0a6a-bdaf9fbaa3c2	2015-10-05 00:00:00	\N	\N
3	Abacavir/Dolutegravir/lamiVUDine (Oral Pill)	1736971	abacavir	2997739a-aa91-42aa-a206-a70e2db7b84f	2015-10-09 00:00:00	\N	\N
4	Abacavir/lamiVUDine (Oral Pill)	1736971	abacavir	080e3423-5962-4465-8e78-cd8793699336	2010-09-01 00:00:00	\N	\N
5	Abacavir/lamiVUDine/Zidovudine (Oral Pill)	1736971	abacavir	3354e50f-4dc5-413f-b5ae-87353ab8913d	2014-04-28 00:00:00	\N	\N
6	ABELCET (Injectable)	19056402	amphotericin B liposomal	5587db37-f21a-4a39-a319-e1077032ced9	2014-12-08 00:00:00	\N	\N
7	ABILIFY (Oral Pill)	757688	aripiprazole	630f15ee-b839-46d5-9e89-06af3d47e8f5	2015-04-30 00:00:00	\N	\N
8	AbobotulinumtoxinA (Injectable)	40165377	abobotulinumtoxinA	71313a04-1349-4c26-b840-a39e4a3ddaed	2015-03-10 00:00:00	\N	\N
9	ABREVA (Topical)	980955	docosanol	c39b38a7-dcdd-4c32-8f35-b565c4d3cec6	2015-07-07 00:00:00	\N	\N
10	Absidia ramosa extract (Injectable)	40227558	Absidia ramosa extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
11	ABSORBINE (Transdermal)	901656	Menthol	4c80d544-ecb7-4994-bbc0-698970f85549	2014-05-19 00:00:00	\N	\N
12	ABSORBINE JR. (Topical)	901656	Menthol	e9e83221-84c5-49a7-9733-a9ccd97a43dd	2014-01-16 00:00:00	\N	\N
13	ABSORICA (Oral Pill)	984232	Isotretinoin	8d54aab5-3349-4a41-8533-0a566fd7bbaa	2014-08-29 00:00:00	\N	\N
14	ABSTRAL (Sublingual)	1154029	Fentanyl	4906457e-30ad-4da7-b3ac-bb9e6651a670	2015-01-14 00:00:00	\N	\N
15	Acacia longifolia pollen extract (Injectable)	40170299	Acacia longifolia pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
16	Acamprosate (Oral Pill)	19043959	acamprosate	fe6f754f-62b4-4c86-805d-221332409516	2015-10-01 00:00:00	\N	\N
17	ACANYA (Topical)	918172	Benzoyl Peroxide	3dcd2c96-72b1-4a9f-b65c-08198d63b7df	2015-04-24 00:00:00	\N	\N
18	Acarbose (Oral Pill)	1529331	Acarbose	656769ee-e292-4950-83df-a38e6b1a9d6e	2015-04-30 00:00:00	\N	\N
19	ACCOLATE (Oral Pill)	1111706	zafirlukast	4bf90772-58d5-456d-ad1c-fc448cc5a231	2010-08-06 00:00:00	\N	\N
20	ACCUPRIL (Oral Pill)	1331235	quinapril	a2de05b9-d1aa-4fbb-a9a3-6918cc306f78	2013-04-10 00:00:00	\N	\N
21	Acebutolol (Oral Pill)	1319998	Acebutolol	7eee95bf-0452-4d6e-9712-33403768695a	2015-03-27 00:00:00	\N	\N
22	ACEON (Oral Pill)	1373225	Perindopril	340846a3-896e-40bf-a4d0-419922df71a1	2015-05-11 00:00:00	\N	\N
23	ACEPHEN (Rectal)	1125315	Acetaminophen	1922c613-a8e2-4cf2-ab8b-bbc65c394309	2015-03-17 00:00:00	\N	\N
24	ACETADOTE (Injectable)	1139042	Acetylcysteine	472f158a-5ab9-4308-8e49-1116e6ea3d39	2013-06-18 00:00:00	\N	\N
25	ACETADRYL (Oral Pill)	1125315	Acetaminophen	7731331b-4486-438b-90a7-f0b8d5a3a593	2013-12-03 00:00:00	\N	\N
26	Acetaminophen (Chewable)	1125315	Acetaminophen	5c0dbae2-328b-42b6-a8b6-55009f3c78e5	2015-10-09 00:00:00	\N	\N
27	Acetaminophen (Oral Disintegrating)	1125315	Acetaminophen	1bd01140-0ba7-4e22-be3b-664186aaddb9	2015-09-08 00:00:00	\N	\N
28	Acetaminophen (Oral Liquid)	1125315	Acetaminophen	3d866a79-481f-4a63-84ba-f049ce83da8d	2015-10-13 00:00:00	\N	\N
29	Acetaminophen (Oral Pill)	1125315	Acetaminophen	05234545-b1c1-4bd2-bd83-34860b6f5691	2015-10-13 00:00:00	\N	\N
30	Acetaminophen (Rectal)	1125315	Acetaminophen	daaad04e-4fe8-40ce-9022-1115e9f3a42a	2015-03-17 00:00:00	\N	\N
31	Acetaminophen/Aspirin (Oral Pill)	1125315	Acetaminophen	4b77be54-e962-4e6b-a244-e3d53a8fecd9	2010-10-09 00:00:00	\N	\N
32	Acetaminophen/Aspirin (Oral Powder)	1125315	Acetaminophen	055d0288-61d4-48bc-b91f-6ecc1969beb8	2013-11-27 00:00:00	\N	\N
33	Acetaminophen/Aspirin/Caffeine (Oral Pill)	1125315	Acetaminophen	f49d3755-bb1b-4b79-baa5-52ad16b2ea64	2015-09-30 00:00:00	\N	\N
34	Acetaminophen/Aspirin/Caffeine (Oral Powder)	1125315	Acetaminophen	16d774cc-4247-4bf8-9b5a-c338ffebda3d	2013-11-27 00:00:00	\N	\N
35	Acetaminophen/Aspirin/Caffeine/Salicylamide (Oral Pill)	1125315	Acetaminophen	9fe82229-cc3e-4d79-a448-014fe3d0055b	2015-05-20 00:00:00	\N	\N
36	Acetaminophen/Aspirin/DiphenhydrAMINE (Oral Pill)	1125315	Acetaminophen	b3812d27-40af-40d7-864a-dfa4ae34cb9e	2014-11-03 00:00:00	\N	\N
37	Acetaminophen/Butalbital (Oral Pill)	1125315	Acetaminophen	2cddfd28-6ce7-4708-8f11-6d4dc33fae5b	2015-08-11 00:00:00	\N	\N
38	Acetaminophen/Butalbital/Caffeine (Oral Liquid)	1125315	Acetaminophen	bc990056-c75f-4b0b-87f8-4fb9bdcd533c	2015-05-01 00:00:00	\N	\N
39	Acetaminophen/Butalbital/Caffeine (Oral Pill)	1125315	Acetaminophen	ea5b9ffe-3cda-405e-8f75-3fd4a64c9a35	2015-08-14 00:00:00	\N	\N
40	Acetaminophen/Butalbital/Caffeine/Codeine (Oral Pill)	1125315	Acetaminophen	7fd761e6-64fe-44cc-8b74-10ce31ccfd66	2014-12-19 00:00:00	\N	\N
41	Acetaminophen/Caffeine (Oral Pill)	1125315	Acetaminophen	cc17ee50-1401-4b31-8c01-e153b4291c7a	2015-09-22 00:00:00	\N	\N
42	Acetaminophen/Caffeine/Dihydrocodeine (Oral Pill)	1125315	Acetaminophen	3ad82b67-f041-46df-8518-10debc35a5ed	2007-07-12 00:00:00	\N	\N
43	Acetaminophen/Caffeine/Isometheptene (Oral Pill)	1125315	Acetaminophen	1d157217-d307-423c-8f50-965b23881330	2014-04-29 00:00:00	\N	\N
44	Acetaminophen/Caffeine/Pyrilamine (Oral Pill)	1125315	Acetaminophen	c9395f86-dfb8-43bb-9f6a-9b948810b265	2015-09-16 00:00:00	\N	\N
45	Acetaminophen/Chlophedianol/Pyrilamine (Oral Liquid)	1125315	Acetaminophen	7c7dbac3-dd9e-d03a-1303-3d2a207c751b	2014-11-24 00:00:00	\N	\N
46	Acetaminophen/Chlorpheniramine (Oral Pill)	1125315	Acetaminophen	763a5334-a741-4678-9947-603776622450	2015-06-04 00:00:00	\N	\N
47	Acetaminophen/Chlorpheniramine/Dextromethorphan (Oral Liquid)	1125315	Acetaminophen	b0ee7a0e-e2eb-4382-8fde-d002a6ac883a	2015-09-28 00:00:00	\N	\N
48	Acetaminophen/Chlorpheniramine/Dextromethorphan (Oral Pill)	1125315	Acetaminophen	127e7e43-32dd-4311-817c-57b3988ba1da	2015-08-31 00:00:00	\N	\N
49	Acetaminophen/Chlorpheniramine/Dextromethorphan/Phenylephrine (Effervescent)	1125315	Acetaminophen	c7e71ace-c911-46cd-8c92-01385c2f7122	2014-08-25 00:00:00	\N	\N
50	Acetaminophen/Chlorpheniramine/Dextromethorphan/Phenylephrine (Oral Pill)	1125315	Acetaminophen	a45c4953-b9be-4e04-b82a-f3419d27c129	2015-06-03 00:00:00	\N	\N
51	Acetaminophen/Chlorpheniramine/Dextromethorphan/Pseudoephedrine (Oral Pill)	1125315	Acetaminophen	58a7668f-4702-42a1-a1ca-443c979ea0db	2013-08-01 00:00:00	\N	\N
52	Acetaminophen/Chlorpheniramine/Phenylephrine (Oral Liquid)	1125315	Acetaminophen	ab384d3d-fb33-4aec-9393-822b199e58b6	2015-06-25 00:00:00	\N	\N
53	Acetaminophen/Chlorpheniramine/Phenylephrine (Oral Pill)	1125315	Acetaminophen	f466c660-69eb-4581-81ff-1499fa421d8b	2015-10-13 00:00:00	\N	\N
54	Acetaminophen/Chlorpheniramine/Pseudoephedrine (Oral Pill)	1125315	Acetaminophen	0a4ace8c-562e-43af-9efb-d323ee4c22ab	2015-06-10 00:00:00	\N	\N
55	Acetaminophen/Codeine (Oral Liquid)	1125315	Acetaminophen	95ac6875-6b14-4cde-8efb-80704e39b8d8	2015-09-08 00:00:00	\N	\N
56	Acetaminophen/Codeine (Oral Pill)	1125315	Acetaminophen	61f11bc0-02e7-47ea-a05b-39c590844bf9	2015-08-14 00:00:00	\N	\N
57	Acetaminophen/Dexbrompheniramine (Oral Pill)	1125315	Acetaminophen	1bd74da3-9c5b-46e9-b599-999cd6eac1d8	2014-08-28 00:00:00	\N	\N
58	Acetaminophen/Dextromethorphan (Oral Liquid)	1125315	Acetaminophen	9469104e-f06c-481c-a4b7-2fd16cd0db01	2015-09-22 00:00:00	\N	\N
59	Acetaminophen/Dextromethorphan/Doxylamine (Oral Liquid)	1125315	Acetaminophen	f985b585-fb62-4a0e-8531-47090c9f8138	2015-09-30 00:00:00	\N	\N
60	Acetaminophen/Dextromethorphan/Doxylamine (Oral Pill)	1125315	Acetaminophen	f2b43b3f-c272-49c7-a601-954e2e4865d6	2015-10-01 00:00:00	\N	\N
61	Acetaminophen/Dextromethorphan/Doxylamine/Phenylephrine (Oral Pill)	1125315	Acetaminophen	8b9211a6-5e8a-48e9-b3fb-ad69dbc758d6	2015-09-28 00:00:00	\N	\N
62	Acetaminophen/Dextromethorphan/guaiFENesin/Phenylephrine (Oral Liquid)	1125315	Acetaminophen	d4bcfabb-a054-4f53-8dc9-d361a03558b8	2015-09-29 00:00:00	\N	\N
63	Acetaminophen/Dextromethorphan/guaiFENesin/Phenylephrine (Oral Pill)	1125315	Acetaminophen	f4d1cd98-3b1f-452d-9f11-2a8d4c5b83d5	2015-10-13 00:00:00	\N	\N
64	Acetaminophen/Dextromethorphan/guaiFENesin/Pseudoephedrine (Oral Liquid)	1125315	Acetaminophen	e71c1e5b-9783-4481-b163-0a9877a5031b	2010-10-09 00:00:00	\N	\N
65	Acetaminophen/Dextromethorphan/guaiFENesin/Pseudoephedrine (Oral Pill)	1125315	Acetaminophen	f38a784b-cfc3-4238-9cd3-56c1dba94e6f	2015-02-23 00:00:00	\N	\N
66	Acetaminophen/Dextromethorphan/Phenylephrine (Oral Liquid)	1125315	Acetaminophen	ce1b51d0-25b3-43d9-924d-293b3b5eaeb2	2015-10-01 00:00:00	\N	\N
67	Acetaminophen/Dextromethorphan/Phenylephrine (Oral Pill)	1125315	Acetaminophen	90bdcea8-c896-49ba-894c-31b1281a512d	2015-10-01 00:00:00	\N	\N
68	Acetaminophen/Dichloralphenazone/Isometheptene (Oral Pill)	1125315	Acetaminophen	08442901-bb74-4516-9574-86b3dfeeabb1	2015-06-01 00:00:00	\N	\N
69	Acetaminophen/DiphenhydrAMINE (Oral Liquid)	1125315	Acetaminophen	5b0a3df3-2e9f-4b84-8f37-ed6051e96569	2015-06-10 00:00:00	\N	\N
70	Acetaminophen/DiphenhydrAMINE (Oral Pill)	1125315	Acetaminophen	2e51c2ef-80d3-4ad0-9ab6-5f70e8d48d67	2015-10-06 00:00:00	\N	\N
71	Acetaminophen/DiphenhydrAMINE (Oral Powder)	1125315	Acetaminophen	db5d6c2b-688e-4e88-a42d-0fa2b0d8140b	2013-12-02 00:00:00	\N	\N
72	Acetaminophen/DiphenhydrAMINE/Phenylephrine (Oral Liquid)	1125315	Acetaminophen	e96d19bc-5786-4bc1-b25e-2c9f4f385d6d	2015-10-02 00:00:00	\N	\N
73	Acetaminophen/DiphenhydrAMINE/Phenylephrine (Oral Pill)	1125315	Acetaminophen	ae33d924-9262-41f6-964f-d8b567b3d903	2015-09-23 00:00:00	\N	\N
74	Acetaminophen/Doxylamine/Phenylephrine (Oral Pill)	1125315	Acetaminophen	119ee51b-6a7f-451b-bf69-ecb92c6a352b	2015-04-03 00:00:00	\N	\N
75	Acetaminophen/guaiFENesin/Phenylephrine (Oral Liquid)	1125315	Acetaminophen	04c6bb6a-d2f8-4322-afba-e240e8090176	2015-09-28 00:00:00	\N	\N
76	Acetaminophen/guaiFENesin/Phenylephrine (Oral Pill)	1125315	Acetaminophen	1b4e87f8-3f9e-4865-9128-527d2d621593	2015-10-13 00:00:00	\N	\N
77	Acetaminophen/guaiFENesin/Pseudoephedrine (Oral Pill)	1125315	Acetaminophen	d9ce633a-6850-4c24-923f-ded745356e43	2011-08-22 00:00:00	\N	\N
78	Acetaminophen/HYDROcodone (Oral Liquid)	1125315	Acetaminophen	00ff75bc-aebe-4c55-adea-1c49cf1addb3	2014-12-30 00:00:00	\N	\N
79	Acetaminophen/HYDROcodone (Oral Pill)	1125315	Acetaminophen	ab6b4c39-b2d4-4c63-8821-b0560f781287	2015-10-05 00:00:00	\N	\N
80	Acetaminophen/Magnesium Salicylate (Oral Pill)	1125315	Acetaminophen	b0a91a7f-bef4-47c8-9813-66279997b173	2015-04-24 00:00:00	\N	\N
81	Acetaminophen/Magnesium Salicylate/Pamabrom (Oral Pill)	1125315	Acetaminophen	5f2e9d2a-4c7b-4339-8be7-3711a73fdbe9	2012-06-26 00:00:00	\N	\N
82	Acetaminophen/oxyCODONE (Oral Liquid)	1125315	Acetaminophen	8f0eccce-728f-4039-959b-4887ae32325f	2015-01-06 00:00:00	\N	\N
83	Acetaminophen/oxyCODONE (Oral Pill)	1125315	Acetaminophen	94679f29-d63a-41a5-bdda-3aa3fc2db531	2015-09-28 00:00:00	\N	\N
84	Acetaminophen/Pamabrom (Oral Pill)	1125315	Acetaminophen	43949fe7-3764-4d74-959f-8d3ca06fa06e	2015-05-20 00:00:00	\N	\N
85	Acetaminophen/Pamabrom/Pyrilamine (Oral Pill)	1125315	Acetaminophen	a7424b9f-f2c0-4289-962d-99c2354c5a60	2015-07-21 00:00:00	\N	\N
86	Acetaminophen/Pentazocine (Oral Pill)	1125315	Acetaminophen	62a055f3-a58b-446d-9476-af6d36956eaf	2011-07-15 00:00:00	\N	\N
87	Acetaminophen/Pheniramine/Phenylephrine (Oral Liquid)	1125315	Acetaminophen	4c9a91d9-c8fa-4845-ab06-e3f760acc798	2015-06-24 00:00:00	\N	\N
88	Acetaminophen/Phenylephrine (Oral Liquid)	1125315	Acetaminophen	7310f8f2-aaba-45c0-8add-d59b8fb7edda	2011-05-20 00:00:00	\N	\N
89	Acetaminophen/Phenylephrine (Oral Pill)	1125315	Acetaminophen	cee0a134-3dc3-4d2f-a8e5-2916c3e3d7e0	2015-10-13 00:00:00	\N	\N
90	Acetaminophen/Phenyltoloxamine (Oral Liquid)	1125315	Acetaminophen	738e7767-42de-4076-acf2-9152484c2007	2012-06-20 00:00:00	\N	\N
91	Acetaminophen/Phenyltoloxamine (Oral Pill)	1125315	Acetaminophen	8f1bb6e5-3de5-48b4-bf44-d4e881be5ab0	2012-05-21 00:00:00	\N	\N
92	Acetaminophen/Propoxyphene (Oral Pill)	1125315	Acetaminophen	f2bc3c76-fd41-4a79-aa5d-3eb45133c1ee	2011-07-19 00:00:00	\N	\N
93	Acetaminophen/Propoxyphene XR (Oral Pill)	1125315	Acetaminophen	4cf33260-5a78-4207-b113-a9d6771811a3	2008-11-21 00:00:00	\N	\N
94	Acetaminophen/Pseudoephedrine (Oral Pill)	1125315	Acetaminophen	31e9e3b6-1680-41c1-bbe7-d6dd966b5886	2012-08-16 00:00:00	\N	\N
95	Acetaminophen/Pyrilamine (Oral Pill)	1125315	Acetaminophen	b811e4f6-7cd0-403c-a44c-7c6c6787c15d	2014-05-30 00:00:00	\N	\N
96	Acetaminophen/traMADol (Oral Pill)	1125315	Acetaminophen	ed529b7d-bda9-8333-9801-39a16ea61745	2015-08-12 00:00:00	\N	\N
97	acetaZOLAMIDE (Injectable)	929435	Acetazolamide	60f656ff-97b1-4a89-99af-8100483c2bac	2014-12-26 00:00:00	\N	\N
98	acetaZOLAMIDE (Oral Pill)	929435	Acetazolamide	ceb5cac3-bbfb-42fa-8b29-c0ef5ed0913c	2015-10-13 00:00:00	\N	\N
99	Acetic Acid (Irrigation)	929549	Acetic Acid	41bc12af-fac5-4ac1-b907-dcb3e35a054c	2015-09-17 00:00:00	\N	\N
100	Acetic Acid (Otic)	929549	Acetic Acid	a8c12387-4b2b-49c2-b9c5-112ffb133950	2015-07-30 00:00:00	\N	\N
101	Acetic Acid/Hydrocortisone (Otic)	929549	Acetic Acid	ffd1edc1-2f40-4b0a-a53a-9fb53b8d3184	2015-06-16 00:00:00	\N	\N
102	Acetic Acid/Oxyquinoline (Vaginal)	929549	Acetic Acid	77237c50-aeb5-44a0-a1e6-ce1551b49f75	2013-05-22 00:00:00	\N	\N
103	Acetylcholine (Injectable)	19037624	Acetylcholine	e701ef07-9499-4b56-931f-f4eb3eedbe24	2014-10-09 00:00:00	\N	\N
104	Acetylcysteine (Inhalant)	1139042	Acetylcysteine	75b48fab-cef6-465c-a1e0-d085b3988bc4	2015-03-12 00:00:00	\N	\N
105	Acetylcysteine (Injectable)	1139042	Acetylcysteine	472f158a-5ab9-4308-8e49-1116e6ea3d39	2015-04-03 00:00:00	\N	\N
106	ACID GONE (Oral Liquid)	985247	Aluminum Hydroxide	3d353a92-92f1-4304-8895-31d39dccd88c	2012-09-07 00:00:00	\N	\N
107	ACIPHEX (Oral Pill)	911735	rabeprazole	001dd372-2692-4d6f-a71c-95e7056349a9	2014-10-01 00:00:00	\N	\N
108	Acitretin (Oral Pill)	929638	Acitretin	fb979cda-6a34-496e-b4bc-b17782b67821	2015-07-21 00:00:00	\N	\N
109	ACLOVATE (Topical)	905151	Alclometasone	23536d6f-6f74-6820-4372-696d696e616c	2011-04-15 00:00:00	\N	\N
110	ACNEVIR (Soap)	964407	Salicylic Acid	c82e9b1b-f9f3-417c-b547-95c9b4c19df8	2010-10-09 00:00:00	\N	\N
111	Acrivastine/Pseudoephedrine (Oral Pill)	1140123	acrivastine	d86c6a13-9e5f-43c2-92f5-c7ed7bfcedfc	2015-05-06 00:00:00	\N	\N
112	ACT FLUORIDE RINSE (Mouthwash)	19069022	Sodium Fluoride	e3494d8a-2aad-4212-89ce-18dddcbe059e	2015-06-12 00:00:00	\N	\N
113	ACTHAR (Injectable)	1541079	Corticotropin	7b48ddec-e815-45f4-9ca0-5c0daaf56f30	2015-07-31 00:00:00	\N	\N
114	ACTHIB (Injectable)	529118	"Haemophilus influenzae type b, capsular polysaccharide inactivated tetanus toxoid conjugate vaccine"	8143d01c-4911-40db-95b2-47f3ebea2a7d	2014-02-28 00:00:00	\N	\N
115	ACTICLATE (Oral Pill)	1738521	Doxycycline	115f1010-882f-11e3-baa7-0800200c9a66	2014-07-29 00:00:00	\N	\N
116	ACTIDOSE (Oral Liquid)	1701928	Activated Charcoal	61801c3a-caf2-4bb7-a56a-dc2ee007eccb	2014-09-25 00:00:00	\N	\N
117	ACTIGALL (Oral Pill)	988095	Ursodeoxycholate	aeb6c8c8-4dec-4574-8f26-b6b701b04b25	2015-08-03 00:00:00	\N	\N
118	ACTIMMUNE (Injectable)	1380191	Interferon gamma-1b	498b2231-65e8-4b27-947b-8d1f6f91289c	2015-09-09 00:00:00	\N	\N
119	ACTIQ (Oral Lozenge)	1154029	Fentanyl	90b94524-f913-48b3-3771-7b2fcffd888a	2012-01-13 00:00:00	\N	\N
120	ACTIVASE (Injectable)	1347450	Alteplase	c669f77c-fa48-478b-a14b-80b20a0139c2	2015-03-03 00:00:00	\N	\N
121	Activated Charcoal (Oral Liquid)	1701928	Activated Charcoal	df1226cb-f2a8-4e91-b265-a08765f7683f	2014-09-25 00:00:00	\N	\N
122	ACTIVON ARTHRITIS (Topical)	19069019	Histamine	d123deae-d9ef-45ce-81ed-2d79384b1298	2015-04-23 00:00:00	\N	\N
123	ACTONEL (Oral Pill)	1516800	Risedronate	4423d70a-b120-4653-bcf3-0c5ea8b97b0e	2010-12-10 00:00:00	\N	\N
124	ACTOPLUS MET (Oral Pill)	1503297	Metformin	f5c534e8-656c-406d-b3dc-b562576ba4eb	2011-09-02 00:00:00	\N	\N
125	ACTOS (Oral Pill)	1525215	pioglitazone	d2ddc491-88a9-4063-9150-443b4fa4330c	2013-04-02 00:00:00	\N	\N
126	ACULAR (Ophthalmic)	1136980	Ketorolac	5ba45168-ad5d-4ea9-bd85-fc2fa2b13dad	2012-06-05 00:00:00	\N	\N
127	Acyclovir (Buccal)	1703687	Acyclovir	00f7425a-6236-47ff-a087-f28f8cdb1aec	2014-08-22 00:00:00	\N	\N
128	Acyclovir (Injectable)	1703687	Acyclovir	badf347b-eeee-4239-9c74-966f262925aa	2014-12-23 00:00:00	\N	\N
129	Acyclovir (Oral Liquid)	1703687	Acyclovir	62bdcf22-51f3-4c81-9bd4-a2dc48bec580	2014-08-12 00:00:00	\N	\N
130	Acyclovir (Oral Pill)	1703687	Acyclovir	ad26cb5f-123f-4438-ae8d-4c2a40966a38	2015-09-30 00:00:00	\N	\N
131	Acyclovir (Topical)	1703687	Acyclovir	ce3d5e8b-9401-40be-8ce7-4ea42113f4ab	2015-06-30 00:00:00	\N	\N
132	Acyclovir/Hydrocortisone (Topical)	1703687	Acyclovir	3b6ac164-0f1e-4f36-94a1-1fdb07d710f5	2014-12-29 00:00:00	\N	\N
133	ADAGEN (Injectable)	581480	pegademase bovine	9880b900-ea23-11dc-ad56-0002a5d5c51b	2014-12-08 00:00:00	\N	\N
134	Adapalene (Topical)	981774	adapalene	cabba2c1-cf07-46aa-a2c3-1b815517b16b	2015-02-12 00:00:00	\N	\N
135	Adapalene/Benzoyl Peroxide (Topical)	981774	adapalene	67002593-3bd3-4e91-a48f-9f7483e579a0	2012-02-15 00:00:00	\N	\N
136	ADDERALL (Oral Pill)	714785	Amphetamine	f22635fe-821d-4cde-aa12-419f8b53db81	2015-08-04 00:00:00	\N	\N
137	Adefovir (Oral Pill)	1729323	adefovir	e047f3b2-feae-4c5e-9d07-1fefb4c0ec25	2013-12-30 00:00:00	\N	\N
138	Adenovirus Type 4 Vaccine Live (Oral Pill)	40237613	Adenovirus Type 4 Vaccine Live	c7d0b43c-7250-4809-8a05-fcde5862f076	2014-06-30 00:00:00	\N	\N
139	Adenovirus Type 7 Vaccine Live (Oral Pill)	40237617	Adenovirus Type 7 Vaccine Live	c7d0b43c-7250-4809-8a05-fcde5862f076	2014-06-30 00:00:00	\N	\N
140	ADIPEX-P (Oral Pill)	735340	Phentermine	b335e637-dca3-45c8-ad12-7eb03be2caaa	2015-08-06 00:00:00	\N	\N
141	ADOXA (Oral Pill)	1738521	Doxycycline	0cecc43f-cc40-4c48-9e43-ae8d77af4e49	2013-05-31 00:00:00	\N	\N
142	ADRENALIN (Injectable)	1343916	Epinephrine	3b7a4364-668d-4eb2-a20c-04adc35aabe4	2015-09-21 00:00:00	\N	\N
143	ADVATE (Injectable)	1352213	Factor VIII	80fa03d2-cd4c-4155-9b57-1396c4fa42da	2015-06-01 00:00:00	\N	\N
144	ADVIL (Chewable)	1177480	Ibuprofen	07d4c400-b182-92f7-7574-9e0e94c39cce	2014-01-15 00:00:00	\N	\N
145	ADVIL (Oral Liquid)	1177480	Ibuprofen	3079d932-afb2-94fe-f4ba-a3d8b5198fce	2015-06-26 00:00:00	\N	\N
146	ADVIL (Oral Pill)	1177480	Ibuprofen	e4a6219d-4ad4-0119-4cf8-7fc39b4b5979	2015-09-23 00:00:00	\N	\N
147	ADVIL CHILDREN'S COLD (Oral Liquid)	1177480	Ibuprofen	f63d1eb1-b51d-de3f-faea-6c4d4b0069c3	2010-07-01 00:00:00	\N	\N
148	ADVIL COLD AND SINUS (Oral Pill)	1177480	Ibuprofen	fac22a47-f0de-4505-fd8a-768430cda0c1	2012-03-08 00:00:00	\N	\N
149	ADVIL CONGESTION RELIEF (Oral Pill)	1177480	Ibuprofen	d0002708-271d-98a6-44ca-50906ea18e10	2015-07-01 00:00:00	\N	\N
150	ADVIL PM (Oral Pill)	1129625	Diphenhydramine	b876bb40-a38b-445a-bc8a-466b3bfe166d	2015-01-29 00:00:00	\N	\N
151	Afatinib (Oral Pill)	43533090	Afatinib	fd638e5e-8032-e7ca-0179-95e96ab5d387	2015-09-01 00:00:00	\N	\N
152	AFREZZA (Inhalant)	1596977	"Regular Insulin, Human"	76fb46f1-82db-40da-ba19-b3a7b0bd78ff	2015-07-15 00:00:00	\N	\N
153	AFRIN (Nasal)	925636	Oxymetazoline	89c165ba-3ad5-49b5-a5bb-423dc8e15bad	2015-09-22 00:00:00	\N	\N
154	AGGRASTAT (Injectable)	19017067	tirofiban	fe0ced75-ccbf-4d2e-bd0d-b57e60ab913f	2015-05-22 00:00:00	\N	\N
155	AGGRENOX (Oral Pill)	1112807	Aspirin	e729d829-4bd0-4074-85ea-e0f9f5d7cdb5	2014-08-15 00:00:00	\N	\N
156	AK-CON (Ophthalmic)	914533	Naphazoline	297f0888-729c-4ce6-8779-6b239abf3c93	2014-07-02 00:00:00	\N	\N
157	ALA-HIST AC (Oral Liquid)	1201620	Codeine	ac3d3783-0889-4aab-9d2e-fab799a25f20	2012-03-09 00:00:00	\N	\N
158	ALA-HIST IR (Oral Pill)	1188052	dexbrompheniramine	0d203b5c-8b10-428b-8703-17be6b4ce6eb	2015-02-23 00:00:00	\N	\N
159	ALA-QUIN (Topical)	980867	Clioquinol	d2ae30c6-ad64-47ed-b371-778eaebeeddf	2015-10-02 00:00:00	\N	\N
160	Alatrofloxacin (Injectable)	19018154	alatrofloxacin	da9b26bb-d2d7-4113-a0f9-c6c2280f4875	2006-07-13 00:00:00	\N	\N
161	ALAWAY (Ophthalmic)	986117	Ketotifen	e4c310b5-1dba-4ddc-bc90-b27ebc765871	2015-08-27 00:00:00	\N	\N
162	Albendazole (Chewable)	1753745	Albendazole	e8941166-b77d-45aa-a6e8-04f1c0afd845	2015-10-01 00:00:00	\N	\N
163	Albendazole (Oral Pill)	1753745	Albendazole	e8941166-b77d-45aa-a6e8-04f1c0afd845	2015-10-01 00:00:00	\N	\N
164	ALBENZA (Oral Pill)	1753745	Albendazole	e8941166-b77d-45aa-a6e8-04f1c0afd845	2015-10-01 00:00:00	\N	\N
165	ALBUKED (Injectable)	1344143	"Albumin Human, USP"	0df480bb-be5e-0e7f-1331-fd4de81d33a6	2015-04-30 00:00:00	\N	\N
166	"Albumin Human, USP (Injectable)"	1344143	"Albumin Human, USP"	2eeb6b69-2013-c0a2-5e2f-0365114d41b4	2015-08-26 00:00:00	\N	\N
167	ALBUMINAR-20 (Injectable)	1344143	"Albumin Human, USP"	a901aa63-3347-4a12-8c74-e7cdd6edbddc	2013-08-07 00:00:00	\N	\N
168	ALBURX (Injectable)	1344143	"Albumin Human, USP"	ad74b7f5-b380-47ab-b19d-eef92c8eb7a4	2015-08-26 00:00:00	\N	\N
169	Albuterol (Inhalant)	1154343	Albuterol	f5c2fe10-c61f-4cbe-bc45-7ab14baa691c	2015-08-03 00:00:00	\N	\N
170	Albuterol (Oral Liquid)	1154343	Albuterol	8d215fe3-1cf6-4bb3-b005-75f1a9d62235	2015-03-13 00:00:00	\N	\N
171	Albuterol (Oral Pill)	1154343	Albuterol	87b8cd3c-2849-4b50-b63e-9ea379165c07	2015-09-01 00:00:00	\N	\N
172	Albuterol/Ipratropium (Inhalant)	1154343	Albuterol	afcf38bf-b183-4569-b43f-25deb97f6693	2015-08-27 00:00:00	\N	\N
173	Alcaftadine (Ophthalmic)	40224159	alcaftadine	17d37e8d-7825-424b-b6ca-0a85d0bf4694	2015-10-09 00:00:00	\N	\N
174	ALCAINE (Ophthalmic)	929504	proparacaine	0c0fa0bf-977d-4539-b8dc-54c187c5b094	2011-08-05 00:00:00	\N	\N
175	Alclometasone (Topical)	905151	Alclometasone	0c2fb9a0-5586-4428-b705-5fa179a73e08	2015-10-13 00:00:00	\N	\N
176	ALCORTIN (Topical)	975125	Hydrocortisone	995ae132-8e37-4fda-b353-ce79ab9d0bf4	2010-07-20 00:00:00	\N	\N
177	ALCORTIN A (Topical)	958994	Aloe Polysaccharide	3f2abee4-2841-4725-8c11-aafb35ba6bee	2015-03-10 00:00:00	\N	\N
178	ALDARA (Topical)	981691	imiquimod	0c3aed27-7b3f-442e-9f60-f2f5c672c85d	2015-02-27 00:00:00	\N	\N
179	Alemtuzumab (Injectable)	1312706	alemtuzumab	4f5f7255-7abc-4328-bd1a-ceaf139ef3e0	2014-11-18 00:00:00	\N	\N
180	Alendronate (Oral Liquid)	1557272	Alendronate	307a2b03-72c1-4765-acab-c3d3d60b2b78	2013-05-13 00:00:00	\N	\N
181	Alendronate (Oral Pill)	1557272	Alendronate	8751ca1c-1d4d-449a-8021-4106e6a08703	2015-10-13 00:00:00	\N	\N
182	Alendronate/Cholecalciferol (Oral Pill)	1557272	Alendronate	d4a71df1-7488-46a2-8ded-dd0db56de618	2011-12-28 00:00:00	\N	\N
183	ALEVAZOL (Topical)	1000632	Clotrimazole	edd8da89-0b83-4de6-a166-7451d0084169	2015-06-08 00:00:00	\N	\N
184	ALEVE (Oral Pill)	1115008	Naproxen	f753a557-6a26-4b5b-bb1e-d9f2b621b846	2014-09-12 00:00:00	\N	\N
185	ALEVE PM (Oral Pill)	1129625	Diphenhydramine	82891458-ab0d-459a-8602-dcebd22c3010	2014-10-01 00:00:00	\N	\N
186	ALFENTA (Injectable)	19059528	Alfentanil	bb56df52-5abf-47dc-ab8d-902cfe19ccb2	2008-03-19 00:00:00	\N	\N
187	Alfentanil (Injectable)	19059528	Alfentanil	bb56df52-5abf-47dc-ab8d-902cfe19ccb2	2014-08-04 00:00:00	\N	\N
188	Alglucosidase alfa (Injectable)	19088328	alglucosidase alfa	d6bfbc45-2d34-439e-8aad-59ee2d53d4df	2015-01-30 00:00:00	\N	\N
189	ALICLEN (Shampoo)	964407	Salicylic Acid	729fba61-cc44-4110-85bd-4743161dc6c0	2012-02-06 00:00:00	\N	\N
190	ALINIA (Oral Liquid)	1715315	nitazoxanide	56b1575a-dff4-4c5a-a159-2f858e7a0cb8	2013-11-26 00:00:00	\N	\N
191	ALINIA (Oral Pill)	1715315	nitazoxanide	56b1575a-dff4-4c5a-a159-2f858e7a0cb8	2013-11-26 00:00:00	\N	\N
192	Aliskiren (Oral Pill)	1317967	aliskiren	4c222831-90af-4336-8bf6-5628ddf24326	2012-01-18 00:00:00	\N	\N
193	Aliskiren/Hydrochlorothiazide (Oral Pill)	1317967	aliskiren	40d12d97-152d-4fea-bc59-b69e5c29fde2	2010-11-08 00:00:00	\N	\N
194	Alitretinoin (Topical)	941052	alitretinoin	9cf04dad-e312-4b8f-a297-1e002d43e151	2006-11-14 00:00:00	\N	\N
195	ALKA-SELTZER (Effervescent)	1112807	Aspirin	73e85be6-1236-453b-b41c-37381a054773	2014-12-10 00:00:00	\N	\N
196	ALKA-SELTZER FRUIT CHEWS (Chewable)	19035704	Calcium Carbonate	e09648f2-4b46-4461-8554-9c4866650f90	2015-09-10 00:00:00	\N	\N
197	ALKA-SELTZER HEARTBURN RELIEF (Effervescent)	950435	Citric Acid	672106ae-9e27-4173-b7b7-1f5494643673	2010-10-09 00:00:00	\N	\N
198	ALKA-SELTZER PLUS ALLERGY (Oral Pill)	1129625	Diphenhydramine	3e8446cc-5cd9-44e6-8bcd-125a61cd5a41	2011-11-14 00:00:00	\N	\N
199	ALKA-SELTZER PLUS MUCUS AND CONGESTION (Oral Pill)	1119510	Dextromethorphan	7b6c90cc-91a8-4fbc-832b-c9eb38a4ffc8	2013-10-18 00:00:00	\N	\N
200	ALKERAN (Injectable)	1301267	Melphalan	9706e9a1-96ab-46b8-8846-32ee9d756b1d	2015-10-13 00:00:00	\N	\N
201	ALKERAN (Oral Pill)	1301267	Melphalan	ff913271-0090-4832-a0fe-5154fe8f97b9	2015-10-09 00:00:00	\N	\N
202	ALKUMS (Chewable)	19035704	Calcium Carbonate	7451cd9f-1723-46d0-837e-8dc48bfb6bba	2015-07-14 00:00:00	\N	\N
203	Allantoin (Topical)	966376	Allantoin	5e767dda-b24e-49f4-8323-d429e70e2f6f	2015-07-24 00:00:00	\N	\N
204	Allantoin/DiphenhydrAMINE (Topical)	966376	Allantoin	5375b99c-ad91-409f-850d-9ea0003b32d3	2013-04-25 00:00:00	\N	\N
205	Allantoin/Lidocaine/Petrolatum (Transdermal)	966376	Allantoin	26911234-231b-4867-8fa6-3458a352a774	2015-08-07 00:00:00	\N	\N
206	ALLEGRA (Oral Disintegrating)	1153428	fexofenadine	06115cea-5a44-409d-85ed-bb71743491c1	2015-08-20 00:00:00	\N	\N
207	ALLEGRA (Oral Liquid)	1153428	fexofenadine	7c25b695-bbed-4ad1-aa47-de47091bc808	2012-05-02 00:00:00	\N	\N
208	ALLEGRA (Oral Pill)	1153428	fexofenadine	b82d993a-16ff-4037-a182-7010de8e1cdd	2015-04-06 00:00:00	\N	\N
209	ALLEGRA COOLING RELIEF ANTI-ITCH (Topical)	966376	Allantoin	5375b99c-ad91-409f-850d-9ea0003b32d3	2013-04-25 00:00:00	\N	\N
210	ALLER-CHLOR (Oral Liquid)	1192710	Chlorpheniramine	3065bc51-c210-483b-876d-14a4d060bdec	2011-09-23 00:00:00	\N	\N
211	ALLER-CHLOR (Oral Pill)	1192710	Chlorpheniramine	04ca3806-72be-47d4-9fea-5b0dee087683	2015-04-28 00:00:00	\N	\N
212	ALLER-TEC (Oral Liquid)	1149196	Cetirizine	9a571e0c-480a-454d-bd2d-33b6a6df6c32	2012-03-28 00:00:00	\N	\N
213	ALLERHIST-1 (Oral Pill)	1197677	Clemastine	02201bdb-58b9-4662-a2c0-5ff3efa4a1fc	2010-06-10 00:00:00	\N	\N
214	ALLFEN DM REFORMULATED JUL 2008 (Oral Pill)	1119510	Dextromethorphan	17e44510-a6d3-479c-9ebc-20302dcb04cd	2011-10-14 00:00:00	\N	\N
215	ALLI (Oral Pill)	741530	orlistat	a2d3bd73-f3af-4ea5-a57c-66b0004cfe4f	2015-08-21 00:00:00	\N	\N
216	Allopurinol (Injectable)	1167322	Allopurinol	10cc918f-aa44-415b-932d-2404695ac449	2014-07-30 00:00:00	\N	\N
217	Allopurinol (Oral Pill)	1167322	Allopurinol	4ed35cc1-2648-4659-baa6-b8f5879bcad9	2015-09-17 00:00:00	\N	\N
218	Allscale pollen extract (Injectable)	40171580	Allscale pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
219	ALMACONE (Chewable)	985247	Aluminum Hydroxide	5035a3c0-d7e0-4c77-8b26-7058b6f88029	2015-06-30 00:00:00	\N	\N
220	Almotriptan (Oral Pill)	1103552	almotriptan	9129bb95-7846-4ed7-bd03-0c17d8963447	2015-07-13 00:00:00	\N	\N
221	ALOCRIL (Ophthalmic)	1114620	Nedocromil	2fe8d7ad-2158-4169-94b0-719ad20242b7	2013-01-18 00:00:00	\N	\N
222	Aloe Polysaccharide/Hydrocortisone/Iodoquinol (Topical)	958994	Aloe Polysaccharide	0a1a6d71-2295-4f83-a597-c477cafc56f7	2015-03-10 00:00:00	\N	\N
223	Aloe Polysaccharide/Iodoquinol (Topical)	958994	Aloe Polysaccharide	179b8b28-c76b-4686-a04c-6b2f90056de9	2010-07-19 00:00:00	\N	\N
224	Aloe vera preparation (Topical)	1315376	Aloe vera preparation	20d1606d-fdb5-5ce8-e054-00144ff8d46c	2015-09-29 00:00:00	\N	\N
225	ALOE VESTA ANTIFUNGAL (Topical)	907879	Miconazole	c664e6c6-2a64-409c-9cb6-969d36fe6763	2013-12-24 00:00:00	\N	\N
226	ALOE VESTA DAILY MOISTURIZER (Topical)	916662	dimethicone	8d8d9ac8-00b3-4aa1-86b6-9902b4b5369c	2013-12-23 00:00:00	\N	\N
227	ALOE VESTA PROTECTIVE BARRIER (Topical)	19033354	Petrolatum	10341c96-b4ba-4892-ab68-2ac66f29da96	2011-04-11 00:00:00	\N	\N
228	Alogliptin (Oral Pill)	43013884	alogliptin	a3768c7e-aa4c-44d3-bc53-43bb7346c0b0	2015-09-11 00:00:00	\N	\N
229	Alogliptin/metFORMIN (Oral Pill)	43013884	alogliptin	83cb7914-a683-47bb-a713-f2bc6a596bd2	2015-09-22 00:00:00	\N	\N
230	Alogliptin/Pioglitazone (Oral Pill)	43013884	alogliptin	4c619ed9-fe3e-4158-9938-80c6c3493d55	2015-09-21 00:00:00	\N	\N
231	ALOMIDE (Ophthalmic)	967496	Lodoxamide	1b97597f-f2e7-4574-81a8-f35b769c957a	2011-08-01 00:00:00	\N	\N
232	ALOPRIM (Injectable)	1167322	Allopurinol	10cc918f-aa44-415b-932d-2404695ac449	2014-07-30 00:00:00	\N	\N
233	ALOQUIN (Topical)	958994	Aloe Polysaccharide	179b8b28-c76b-4686-a04c-6b2f90056de9	2010-07-19 00:00:00	\N	\N
234	Alosetron (Oral Pill)	948555	alosetron	e91c4a69-2ad5-4e21-a279-9e1302b1a3d3	2015-10-05 00:00:00	\N	\N
235	ALOXI (Oral Pill)	911354	palonosetron	bd06f321-bb42-4748-92f3-d59626b540e0	2014-11-17 00:00:00	\N	\N
236	alpha-Hydroxyprogesterone (Injectable)	19077143	Hydroxyprogesterone	a1998c1d-8337-4f00-8dcb-af3b54d39b77	2015-04-06 00:00:00	\N	\N
237	ALPHAQUIN HP (Topical)	976778	hydroquinone	f40d8124-60e1-4dd4-a7d5-887db54195cb	2012-11-07 00:00:00	\N	\N
238	ALPRAZolam (Oral Disintegrating)	781039	Alprazolam	d956367b-fd7d-46fc-9533-38a6e02b0b59	2013-03-07 00:00:00	\N	\N
239	ALPRAZolam (Oral Liquid)	781039	Alprazolam	b945ac6f-796e-41ef-85e9-61007e4a4e9a	2014-11-04 00:00:00	\N	\N
240	ALPRAZolam (Oral Pill)	781039	Alprazolam	d7a54ceb-2d80-4879-950f-cad362324086	2015-10-13 00:00:00	\N	\N
241	Alprostadil (Injectable)	1381504	Alprostadil	dea460fa-d05e-4191-8461-f185a711ad89	2015-07-27 00:00:00	\N	\N
242	ALREX (Ophthalmic)	967562	loteprednol etabonate	cf290d54-26a1-4d22-8cb8-852bdc7b5280	2015-07-31 00:00:00	\N	\N
243	ALTABAX (Topical)	991003	retapamulin	9fae06b5-bbd5-400a-a7a6-3a4e238361f8	2010-10-09 00:00:00	\N	\N
244	ALTACAINE (Ophthalmic)	1036884	Tetracaine	fd57efaa-9129-47e0-8d47-191e0adb620e	2014-06-19 00:00:00	\N	\N
245	Alteplase (Injectable)	1347450	Alteplase	c669f77c-fa48-478b-a14b-80b20a0139c2	2015-03-03 00:00:00	\N	\N
246	Altretamine (Oral Pill)	1368823	Altretamine	90a5e59a-bee8-404a-ad69-fabddeaf27f9	2007-01-11 00:00:00	\N	\N
247	Aluminum acetate (Topical)	930604	aluminum acetate	99d84555-fd44-4115-99b3-54f67266b24c	2014-03-11 00:00:00	\N	\N
248	Aluminum chloride (Mucosal)	957393	aluminum chloride	6223c9d2-5944-4ca1-bf6f-24047a51a5f5	2015-06-18 00:00:00	\N	\N
249	Aluminum chloride (Topical)	957393	aluminum chloride	d09ae142-6fd5-45e4-a9c4-44428885ccaf	2014-04-14 00:00:00	\N	\N
250	Aluminum Hydroxide (Oral Liquid)	985247	Aluminum Hydroxide	af9b799f-69c5-401c-9c43-a97b23384cc2	2013-08-16 00:00:00	\N	\N
251	Aluminum Hydroxide (Topical)	985247	Aluminum Hydroxide	dcf0aa6c-5fe7-46e3-a418-c79ecaca074c	2013-11-14 00:00:00	\N	\N
252	Aluminum Hydroxide/Magnesium carbonate (Chewable)	985247	Aluminum Hydroxide	82402593-d5a8-4cdd-b166-8247c1ea058b	2014-10-09 00:00:00	\N	\N
253	Aluminum Hydroxide/Magnesium carbonate (Oral Liquid)	985247	Aluminum Hydroxide	2d74e5bc-1f10-4fb6-9258-cd906e360013	2014-08-01 00:00:00	\N	\N
254	Aluminum Hydroxide/Magnesium Hydroxide (Oral Liquid)	985247	Aluminum Hydroxide	5bf7d414-2bea-4b8d-8dd4-a72d7d20f273	2015-03-17 00:00:00	\N	\N
255	Aluminum Hydroxide/Magnesium Hydroxide/Simethicone (Chewable)	985247	Aluminum Hydroxide	5035a3c0-d7e0-4c77-8b26-7058b6f88029	2014-10-09 00:00:00	\N	\N
256	Aluminum Hydroxide/Magnesium Hydroxide/Simethicone (Oral Liquid)	985247	Aluminum Hydroxide	d28d6220-2702-450b-8ec4-32956edb2131	2015-09-14 00:00:00	\N	\N
257	Aluminum Hydroxide/Magnesium trisilicate (Chewable)	985247	Aluminum Hydroxide	7f367927-c366-465c-a059-e2cfb337d562	2014-09-10 00:00:00	\N	\N
258	Aluminum sulfate/Calcium acetate (Topical)	19030692	aluminum sulfate	6ebed2f4-6a06-47a3-bde4-c47b32cd81cb	2015-07-10 00:00:00	\N	\N
259	ALUVEA (Topical)	906914	Urea	e878410d-6c1c-4580-a9f4-4d6df2c93de3	2011-04-18 00:00:00	\N	\N
260	Alvimopan (Oral Pill)	19059654	alvimopan	77a67dc6-35d3-48ff-9d18-292d4d442f70	2015-08-31 00:00:00	\N	\N
261	Amantadine (Oral Liquid)	19087090	Amantadine	2b6e5b07-b3ba-4717-9ccd-029c0b08cc7f	2015-01-15 00:00:00	\N	\N
262	Amantadine (Oral Pill)	19087090	Amantadine	63d9d4aa-5f92-45b0-98d0-d6ec38b727cb	2015-10-09 00:00:00	\N	\N
263	AMBIEN (Oral Pill)	744740	zolpidem	38512baf-6bf6-4ffa-807c-02b0140c217c	2013-06-03 00:00:00	\N	\N
264	AMBIEN XR (Oral Pill)	744740	zolpidem	5a3ad211-f0a5-4238-8a03-1154fac34c86	2013-06-04 00:00:00	\N	\N
265	AMBISOME (Injectable)	19056402	amphotericin B liposomal	f7be6506-4d20-401e-a0ff-02ad7c33158a	2012-11-08 00:00:00	\N	\N
266	Amcinonide (Topical)	930747	amcinonide	8aefa477-ac2c-41c8-a807-d24522aed8f0	2013-07-09 00:00:00	\N	\N
267	AMERICAINE HEMORRHOIDAL (Topical)	917006	Benzocaine	d13c022f-2f91-40b4-bd66-0cfc0e147a5f	2010-10-09 00:00:00	\N	\N
268	American elm pollen extract (Injectable)	40161030	American elm pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
269	American elm pollen extract/Siberian elm pollen extract (Injectable)	40161030	American elm pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
270	American house dust mite extract/European house dust mite extract (Injectable)	40241606	American house dust mite extract	3b3cb12c-65d3-46ab-9bac-82c569a76220	2009-09-17 00:00:00	\N	\N
271	AMICAR (Oral Liquid)	1369939	6-Aminocaproic Acid	2238c70f-b0b5-4755-896b-45b28777b217	2015-06-12 00:00:00	\N	\N
272	AMICAR (Oral Pill)	1369939	6-Aminocaproic Acid	2238c70f-b0b5-4755-896b-45b28777b217	2015-06-12 00:00:00	\N	\N
273	Amifostine (Injectable)	1350040	Amifostine	4cd49351-6dde-4c85-be33-9a20bde785db	2013-05-30 00:00:00	\N	\N
274	Amikacin (Injectable)	1790868	Amikacin	a43188fa-f228-4acd-8a5d-9a3462034f4b	2014-01-31 00:00:00	\N	\N
275	aMILoride (Oral Pill)	991382	Amiloride	875f3f5a-ed45-4646-8537-21f054302d6f	2015-09-14 00:00:00	\N	\N
276	aMILoride/Hydrochlorothiazide (Oral Pill)	991382	Amiloride	71f5c703-94d4-49b0-9c2d-374b9cbcab85	2010-11-22 00:00:00	\N	\N
277	Aminocaproic Acid (Oral Liquid)	1369939	6-Aminocaproic Acid	2238c70f-b0b5-4755-896b-45b28777b217	2015-06-12 00:00:00	\N	\N
278	Aminocaproic Acid (Oral Pill)	1369939	6-Aminocaproic Acid	2238c70f-b0b5-4755-896b-45b28777b217	2015-06-12 00:00:00	\N	\N
279	Aminolevulinate (Topical)	924120	Aminolevulinate	e45cc371-9ebc-4904-12bc-65cb4e2817ad	2012-01-09 00:00:00	\N	\N
280	Aminophylline (Injectable)	1105775	Aminophylline	754e8580-c710-4a60-8c4e-184be3cf1f41	2015-05-14 00:00:00	\N	\N
281	Aminophylline (Oral Liquid)	1105775	Aminophylline	a7c01224-b32b-40ef-935b-164893a93b22	2007-05-24 00:00:00	\N	\N
282	Aminosalicylic acid (Oral Granules)	1726228	aminosalicylic acid	6f2753dc-5f0c-4f49-9335-e519afb69ba6	2010-06-18 00:00:00	\N	\N
283	Amiodarone (Oral Pill)	1309944	Amiodarone	080d74e0-a5c0-49b6-83e4-4ee9e81c345f	2015-09-14 00:00:00	\N	\N
284	AMITIZA (Oral Pill)	987366	lubiprostone	ca79dddc-3911-472b-bda7-a23351be09af	2014-08-20 00:00:00	\N	\N
285	Amitriptyline (Oral Pill)	710062	Amitriptyline	c7f4d8a8-de3f-447f-8874-c77e6c6fa8f3	2015-09-30 00:00:00	\N	\N
286	Amitriptyline/chlordiazePOXIDE (Oral Pill)	710062	Amitriptyline	22d710ec-302a-4756-95e3-8ee7957586e4	2015-01-20 00:00:00	\N	\N
287	Amitriptyline/Perphenazine (Oral Pill)	710062	Amitriptyline	ca5598e4-4226-45ab-abd1-e961707ae457	2011-12-13 00:00:00	\N	\N
288	amLODIPine (Oral Pill)	1332418	Amlodipine	82507337-cd5e-48f4-891b-dda1512bcb9f	2015-10-09 00:00:00	\N	\N
289	amLODIPine/Atorvastatin (Oral Pill)	1332418	Amlodipine	d2d28679-a01b-4e63-90e2-d5c23b393c94	2015-07-22 00:00:00	\N	\N
290	amLODIPine/Benazepril (Oral Pill)	1332418	Amlodipine	4da56a43-99aa-46df-aafc-ea193c46e442	2015-07-17 00:00:00	\N	\N
291	amLODIPine/Hydrochlorothiazide/Valsartan (Oral Pill)	1332418	Amlodipine	680209f4-ad4c-4f97-8b6b-04f648bfb97c	2015-09-29 00:00:00	\N	\N
292	amLODIPine/Olmesartan (Oral Pill)	1332418	Amlodipine	d6f37813-40bb-4fe8-99e2-ad2339b8e04a	2012-01-10 00:00:00	\N	\N
293	amLODIPine/Telmisartan (Oral Pill)	1332418	Amlodipine	ca60a4d5-ace7-4889-94ee-e2265fd63811	2015-07-17 00:00:00	\N	\N
294	amLODIPine/Valsartan (Oral Pill)	1332418	Amlodipine	e05dd72c-7475-422e-bf8e-73148929450e	2015-09-28 00:00:00	\N	\N
295	Ammonia (Nasal)	42800417	Ammonia	e25cfc22-29ba-473f-88c4-3c88e9f6863b	2015-04-28 00:00:00	\N	\N
296	AMMONUL (Injectable)	711452	Benzoate	e00521d3-84f1-4586-b4a8-9dc17ffffcb1	2015-02-26 00:00:00	\N	\N
297	AMNESTEEM (Oral Pill)	984232	Isotretinoin	b2cb63c9-f825-4991-9a2c-6260f1bbcc2c	2015-09-11 00:00:00	\N	\N
298	Amobarbital (Injectable)	712757	Amobarbital	a2523317-e071-4e04-9d9f-9053286e0ce2	2015-08-28 00:00:00	\N	\N
299	Amoxapine (Oral Pill)	713109	Amoxapine	261006c8-3fd0-491b-b322-42beff6f9880	2011-05-17 00:00:00	\N	\N
300	Amoxicillin (Chewable)	1713332	Amoxicillin	e91786c4-f928-4419-bd57-eca11498a6e6	2015-08-03 00:00:00	\N	\N
301	Amoxicillin (Oral Liquid)	1713332	Amoxicillin	83d18b18-1447-443c-8b9c-34b44922ac6a	2015-09-18 00:00:00	\N	\N
302	Amoxicillin (Oral Pill)	1713332	Amoxicillin	c2f6b402-27cd-48d4-95ae-6a3f530b0452	2015-09-03 00:00:00	\N	\N
303	Amoxicillin XR (Oral Pill)	1713332	Amoxicillin	4057faf7-6d45-4d9e-90e9-72a546214d04	2015-06-24 00:00:00	\N	\N
304	Amoxicillin/Clavulanate (Chewable)	1713332	Amoxicillin	7383df90-6980-4e3b-bcbe-0675c1d26565	2013-06-24 00:00:00	\N	\N
305	Amoxicillin/Clavulanate (Oral Liquid)	1713332	Amoxicillin	d13d3912-49e2-4a08-a62e-239730b15cd9	2015-09-23 00:00:00	\N	\N
306	Amoxicillin/Clavulanate (Oral Pill)	1713332	Amoxicillin	e340b67b-332e-4e0c-aebf-ad4872dc5ed4	2015-10-02 00:00:00	\N	\N
307	Amphetamine/Dextroamphetamine (Oral Pill)	714785	Amphetamine	d63a086a-32e2-49e2-949e-64e4c922775a	2015-08-04 00:00:00	\N	\N
308	Amphotericin B liposomal (Injectable)	19056402	amphotericin B liposomal	f7be6506-4d20-401e-a0ff-02ad7c33158a	2014-12-08 00:00:00	\N	\N
309	Ampicillin (Injectable)	1717327	Ampicillin	8c8b7706-0a2d-4648-91c3-f75808827a0e	2015-09-15 00:00:00	\N	\N
310	Ampicillin (Oral Liquid)	1717327	Ampicillin	1422ac93-067c-489b-9b95-17cd00303f4c	2015-09-15 00:00:00	\N	\N
311	Ampicillin (Oral Pill)	1717327	Ampicillin	be35570c-239f-4320-bbcd-58971810943f	2015-09-15 00:00:00	\N	\N
312	Ampicillin/Sulbactam (Injectable)	1717327	Ampicillin	2709e9fc-2341-4382-af72-c2e3201bd77a	2015-09-04 00:00:00	\N	\N
313	Amyl Nitrite (Nasal)	1319051	Amyl Nitrite	c1b6e536-df5f-4f76-8e3c-6dc2f1e9975e	2011-03-25 00:00:00	\N	\N
314	Amylases/Endopeptidases/Lipase (Oral Pill)	919204	Amylases	45b9a46b-3294-4604-8aea-60624d663020	2015-04-01 00:00:00	\N	\N
315	AMYTAL SODIUM (Injectable)	712757	Amobarbital	a2523317-e071-4e04-9d9f-9053286e0ce2	2015-08-28 00:00:00	\N	\N
316	ANA-LEX (Rectal)	975125	Hydrocortisone	5b472e48-8f7f-4985-8832-7fdceff76e37	2014-10-21 00:00:00	\N	\N
317	ANADROL-50 (Oral Pill)	1525741	Oxymetholone	4b9c6c34-9cb2-4d70-b70e-c7ce2fda4212	2012-10-16 00:00:00	\N	\N
318	Anagrelide (Oral Pill)	1381253	anagrelide	5e6cf1e5-94e4-4124-b7bf-e74647532246	2014-08-15 00:00:00	\N	\N
319	ANALPRAM HC (Rectal)	975125	Hydrocortisone	27b3c751-d972-4cb9-9235-55e29953bf8d	2015-08-12 00:00:00	\N	\N
320	ANALPRAM HC (Topical)	975125	Hydrocortisone	1469733e-1723-4b8c-be33-ed8dfafd65e2	2015-08-07 00:00:00	\N	\N
321	ANASPAZ (Oral Disintegrating)	923672	Hyoscyamine	e5fd8476-418a-4149-a688-205ea943b30c	2012-08-31 00:00:00	\N	\N
322	Anastrozole (Oral Pill)	1348265	anastrozole	f881ec1a-d330-41d8-b633-143875c06ea4	2015-07-16 00:00:00	\N	\N
323	ANBESOL (Mucosal)	917006	Benzocaine	924a4421-cd8b-8e5c-d7e6-d022fabb694f	2014-10-01 00:00:00	\N	\N
324	ANBESOL (Oral Gel)	917006	Benzocaine	930ffc21-37d4-5b82-708a-e02d8251a86d	2014-10-01 00:00:00	\N	\N
325	ANCOBON (Oral Pill)	1755112	Flucytosine	aea0df00-a88c-4a16-abcf-750f3ff2004e	2013-11-06 00:00:00	\N	\N
326	ANDROXY (Oral Pill)	1555887	Fluoxymesterone	5328c194-5650-4d1f-9e28-8cea038cce81	2014-10-08 00:00:00	\N	\N
327	ANECREAM (Topical)	989878	Lidocaine	2d7706e2-7363-4047-96cb-85b718277e8c	2010-10-09 00:00:00	\N	\N
328	ANGIOMAX (Injectable)	19084670	bivalirudin	799d3b00-809b-4abc-989c-05faccec49f8	2011-10-20 00:00:00	\N	\N
329	Annual bluegrass pollen extract (Injectable)	40171977	annual bluegrass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
330	ANTABUSE (Oral Pill)	735850	Disulfiram	f0ca0e1f-9641-48d5-9367-e5d1069e8680	2014-08-01 00:00:00	\N	\N
331	ANTARA (Oral Pill)	1551803	Fenofibrate	acca05ab-185b-41a6-9ce2-783fc3c3cf96	2008-02-08 00:00:00	\N	\N
332	Anthralin (Shampoo)	952538	Anthralin	253fdee7-5060-4b49-ad26-257eb54cccfa	2014-10-20 00:00:00	\N	\N
333	Anthralin (Topical)	952538	Anthralin	45bad116-0351-442f-8e49-f11089a955fd	2014-10-24 00:00:00	\N	\N
334	Antipyrine/Benzocaine (Otic)	1036059	Antipyrine	57b8ea08-c5b1-4d8b-bbff-ad83234e054d	2015-08-24 00:00:00	\N	\N
335	Antipyrine/Benzocaine/Zinc Acetate (Otic)	1036059	Antipyrine	cd77f88e-8714-45ca-a385-1ca75b8c94bb	2011-05-10 00:00:00	\N	\N
336	ANTIVERT (Oral Pill)	994341	Meclizine	305a537b-db97-4c5b-824a-0b97dd4c6dc0	2013-09-19 00:00:00	\N	\N
337	ANUCORT-HC (Rectal)	975125	Hydrocortisone	f0f5a107-1236-8e1a-815d-dec8007c2bc9	2014-08-07 00:00:00	\N	\N
338	APEXICON (Topical)	960988	Diflorasone	af4c413b-c228-48f0-9ad0-6434d1f921b9	2013-02-25 00:00:00	\N	\N
339	Apixaban (Oral Pill)	43013024	apixaban	a454cd24-0c6d-46e8-b1e4-197388606175	2015-09-22 00:00:00	\N	\N
340	Apraclonidine (Ophthalmic)	919986	apraclonidine	de798d0d-a93c-40fb-95ea-10a4e6b287b7	2011-07-12 00:00:00	\N	\N
341	Aprepitant (Oral Pill)	936748	aprepitant	ec44482e-6194-4829-a3f7-ebe8d48a41a5	2012-04-20 00:00:00	\N	\N
342	Aprotinin (Injectable)	19000729	Aprotinin	8a5982c6-825f-4d05-90f5-1519a7291d15	2007-05-17 00:00:00	\N	\N
343	APTIOM (Oral Pill)	44507780	eslicarbazepine	3d0c9554-eaeb-4694-8089-00133fcadce3	2015-09-08 00:00:00	\N	\N
344	AQUAFRESH (Toothpaste)	19068715	monofluorophosphate	22d07313-d22d-4d1c-9c7b-9f1486ac72a5	2015-09-15 00:00:00	\N	\N
345	AQUAFRESH SENSITIVE (Toothpaste)	927322	potassium nitrate	76adbccb-0812-4407-a6fc-a57e6f144fbb	2015-09-15 00:00:00	\N	\N
346	AQUAPHOR (Topical)	19033354	Petrolatum	0a17bf6f-6114-4647-a509-65999255c37b	2015-08-27 00:00:00	\N	\N
347	ARBINOXA (Oral Liquid)	1141018	carbinoxamine	040d6792-21fe-44cc-a441-b9693178b3b5	2012-06-18 00:00:00	\N	\N
348	ARBINOXA (Oral Pill)	1141018	carbinoxamine	3f4f633c-5c5d-4d52-abb8-dfa2896b40d2	2015-08-31 00:00:00	\N	\N
349	ARCALYST (Injectable)	19023450	rilonacept	282f4099-e848-432a-bac1-e041c192a5ba	2015-03-06 00:00:00	\N	\N
350	ARESTIN (Oral Powder)	1708880	Minocycline	8515df41-1936-4f3b-86ba-d2bb2a8441fb	2015-09-14 00:00:00	\N	\N
351	Argatroban (Injectable)	1322207	argatroban	35db0a86-76af-4f5e-a5c6-0a664f53f6da	2015-07-31 00:00:00	\N	\N
352	Arginine (Injectable)	19006410	Arginine	6accf33f-9841-4327-8923-93c42020ef12	2014-04-07 00:00:00	\N	\N
353	ARICEPT (Oral Pill)	715997	donepezil	98e451e1-e4d7-4439-a675-c5457ba20975	2015-07-01 00:00:00	\N	\N
354	ARIMIDEX (Oral Pill)	1348265	anastrozole	4fee8d4c-bb21-4773-b622-87f9a4ff333a	2012-02-02 00:00:00	\N	\N
355	ARIPiprazole (Oral Liquid)	757688	aripiprazole	e7292c4c-e332-4ed4-9086-f130d223b6ae	2015-08-18 00:00:00	\N	\N
356	ARIPiprazole (Oral Pill)	757688	aripiprazole	d8275c2d-f42d-4f32-aa9f-03a202c8e99f	2015-08-31 00:00:00	\N	\N
357	Armodafinil (Oral Pill)	19090984	armodafinil	e7bfb636-4b0a-440c-a4d3-d26393a14ac5	2013-05-02 00:00:00	\N	\N
358	ARMOUR THYROID (Oral Pill)	1501309	thyroid (USP)	c815faa3-1d02-4680-96ef-5fad1645e99b	2013-08-27 00:00:00	\N	\N
359	AROMASIN (Oral Pill)	1398399	exemestane	f0b31daa-0792-43d5-af08-8b6a864dc90a	2010-02-25 00:00:00	\N	\N
360	Arsenic trioxide (Injectable)	1333379	arsenic trioxide	dec51fab-3784-deb7-752f-2d4d5692a20f	2015-05-29 00:00:00	\N	\N
361	ARTHRITEN INFLAMMATORY PAIN (Oral Pill)	1125315	Acetaminophen	c280ca89-4fb5-4050-90ee-d706a550a1ef	2015-08-07 00:00:00	\N	\N
362	ARTHROTEC (Oral Pill)	1124300	Diclofenac	bdf17a90-9444-4dba-aff6-df27e07f23d5	2012-06-14 00:00:00	\N	\N
363	ARTICADENT (Injectable)	19080512	Articaine	9ca8fb43-4f34-47c0-8b79-3b5bd1eaee00	2014-06-04 00:00:00	\N	\N
364	ARTISS (Topical)	19036781	Calcium Chloride	38a6412e-9557-45ad-a917-da15109657ec	2012-08-15 00:00:00	\N	\N
365	ASACOL (Oral Pill)	968426	mesalamine	a97c3815-a0d5-4763-8c3f-9caa5dd9b01b	2015-07-20 00:00:00	\N	\N
366	ASCOMP (Oral Pill)	1112807	Aspirin	243a6aea-0f48-42a9-a85e-ff247ab94336	2009-11-02 00:00:00	\N	\N
367	Ascorbic Acid (Injectable)	19011773	Ascorbic Acid	af67a2f3-65b7-4a6e-9a51-315a280f976b	2015-09-28 00:00:00	\N	\N
368	Ascorbic Acid/Cholecalciferol/Sodium Fluoride/Vitamin A (Oral Liquid)	19011773	Ascorbic Acid	c64addb4-13cf-4857-8192-eb82903999b7	2014-09-09 00:00:00	\N	\N
369	Ascorbic Acid/Docusate/Folic Acid/Iron Carbonyl/Vitamin B 12 (Oral Pill)	19011773	Ascorbic Acid	2c9fd33d-4b38-42be-ad36-b1521ded47e1	2011-05-12 00:00:00	\N	\N
370	Ascorbic Acid/Ferrous fumarate/Folic Acid/Liver stomach concentrate/Vitamin B 12 (Oral Pill)	19011773	Ascorbic Acid	d891ab47-4a05-4b5b-b372-7ddf91699c29	2010-07-20 00:00:00	\N	\N
371	Ascorbic Acid/Ferrous fumarate/Folic Acid/Vitamin B 12 (Oral Pill)	19011773	Ascorbic Acid	898d31a9-5864-4bf4-94cb-cb50736c4fbb	2013-07-03 00:00:00	\N	\N
372	Ascorbic Acid/Ferrous sulfate/Folic Acid XR (Oral Pill)	19011773	Ascorbic Acid	be17e959-b6d8-4cda-b064-2d28842d1e5b	2013-06-28 00:00:00	\N	\N
373	Ascorbic Acid/Iron Carbonyl (Oral Pill)	19011773	Ascorbic Acid	c81325e0-c2db-4412-89a9-236a6733f229	2014-10-02 00:00:00	\N	\N
374	ASCRIPTIN (Oral Pill)	1112807	Aspirin	4f676dc2-71de-431a-82ef-53c6bb9a6e01	2010-10-09 00:00:00	\N	\N
375	Asenapine (Sublingual)	40164052	Asenapine	03c696e9-0e6b-4e5c-be0a-41416f8019be	2011-02-16 00:00:00	\N	\N
376	Aspergillus fumigatus extract (Injectable)	40161048	Aspergillus fumigatus extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
377	ASPIR-LOW (Oral Pill)	1112807	Aspirin	50c157d7-ea12-4a55-82ba-4190bd1fd4c5	2015-06-08 00:00:00	\N	\N
378	Aspirin (Chewable)	1112807	Aspirin	6c7db6a8-f017-4a15-a4a8-4fba82ff658d	2015-10-13 00:00:00	\N	\N
379	Aspirin (Oral Disintegrating)	1112807	Aspirin	73859ea9-01a0-4c3d-97d4-17b9d3378899	2010-12-01 00:00:00	\N	\N
380	Aspirin (Oral Pill)	1112807	Aspirin	5e1484d3-5be1-40da-a3bf-fb19f7d27d45	2015-10-06 00:00:00	\N	\N
381	Aspirin (Rectal)	1112807	Aspirin	cce244aa-cd79-49c8-b68e-267f2bd0ef67	2014-09-23 00:00:00	\N	\N
382	Aspirin/Butalbital/Caffeine (Oral Pill)	1112807	Aspirin	5cd45280-2b8c-4ba8-bde9-db687d96847f	2015-07-06 00:00:00	\N	\N
383	Aspirin/Butalbital/Caffeine/Codeine (Oral Pill)	1112807	Aspirin	243a6aea-0f48-42a9-a85e-ff247ab94336	2014-09-05 00:00:00	\N	\N
384	Aspirin/Caffeine (Oral Pill)	1112807	Aspirin	f43685f0-d7f4-40b9-9de4-1ee272e7b085	2015-10-02 00:00:00	\N	\N
385	Aspirin/Caffeine (Oral Powder)	1112807	Aspirin	0908e63c-9700-4647-856c-6b02b03f62a1	2015-01-26 00:00:00	\N	\N
386	Aspirin/Caffeine/Dihydrocodeine (Oral Pill)	1112807	Aspirin	3e863ce5-936c-4145-b14b-76670e21bdad	2013-05-14 00:00:00	\N	\N
387	Aspirin/Caffeine/Orphenadrine (Oral Pill)	1112807	Aspirin	8e41b33e-f71f-4a5e-b88f-cdfefb2bee20	2015-08-17 00:00:00	\N	\N
388	Aspirin/Carisoprodol/Codeine (Oral Pill)	1112807	Aspirin	dcae7a8a-9d9e-4f7f-954c-39e371f30f75	2013-06-06 00:00:00	\N	\N
389	Aspirin/Chlorpheniramine/Dextromethorphan/Phenylephrine (Effervescent)	1112807	Aspirin	78537dcf-b157-4b67-a8b2-5cb144815166	2014-08-12 00:00:00	\N	\N
390	Aspirin/Chlorpheniramine/Phenylephrine (Effervescent)	1112807	Aspirin	d443a030-d3d6-40e0-8fe0-329de6bc494f	2015-03-05 00:00:00	\N	\N
391	Aspirin/Citric Acid/Sodium Bicarbonate (Effervescent)	1112807	Aspirin	528da9d9-2a52-4c16-b7b2-61b3eee1abea	2015-06-04 00:00:00	\N	\N
392	Aspirin/Dextromethorphan/Doxylamine/Phenylephrine (Effervescent)	1112807	Aspirin	0c397cf2-5b2c-0eca-e054-00144ff8d46c	2015-01-14 00:00:00	\N	\N
393	Aspirin/DiphenhydrAMINE (Oral Pill)	1112807	Aspirin	0c79f57f-7fc9-39a5-e054-00144ff88e88	2015-01-13 00:00:00	\N	\N
394	Aspirin/Dipyridamole (Oral Pill)	1112807	Aspirin	f07c8535-f9fb-4697-9b63-1ab22210efc9	2015-07-01 00:00:00	\N	\N
395	Aspirin/Meprobamate (Oral Pill)	1112807	Aspirin	941e1ec2-1f14-4153-a5ea-cf7669d5efd1	2008-01-25 00:00:00	\N	\N
396	Aspirin/oxyCODONE (Oral Pill)	1112807	Aspirin	23a60947-6058-4bf7-a3ee-ae396e55d939	2015-05-12 00:00:00	\N	\N
397	ASTHMANEFRIN (Inhalant)	1300153	Racepinephrine	80480838-832c-4fdd-9f8e-f6f877ae3549	2014-12-15 00:00:00	\N	\N
398	ASTRAMORPH (Injectable)	1110410	Morphine	ca44184d-4d3b-4fda-c288-8c32527ea6ca	2008-09-04 00:00:00	\N	\N
399	ATACAND (Oral Pill)	1351557	candesartan	d0c94743-cb17-4581-962e-7add11ae52e7	2014-08-15 00:00:00	\N	\N
400	ATACAND HCT (Oral Pill)	1351557	candesartan	8e50e65d-b79b-46b4-a147-796cb19f1407	2012-02-07 00:00:00	\N	\N
401	ATARAX (Oral Liquid)	777221	Hydroxyzine	7eaf5043-5c73-47af-904b-8e1fae02af2e	2006-09-21 00:00:00	\N	\N
402	ATARAX (Oral Pill)	777221	Hydroxyzine	7eaf5043-5c73-47af-904b-8e1fae02af2e	2006-09-21 00:00:00	\N	\N
403	Atazanavir (Oral Pill)	1727223	Atazanavir	025876b6-f031-43ea-967a-b1d95b4685a6	2012-02-28 00:00:00	\N	\N
404	Atenolol (Injectable)	1314002	Atenolol	4f266bf9-05ba-45bd-f683-d156c06d9acc	2006-12-08 00:00:00	\N	\N
405	Atenolol (Oral Pill)	1314002	Atenolol	31f260a1-28e5-4693-95bf-36c5152d81df	2015-09-16 00:00:00	\N	\N
406	Atenolol/Chlorthalidone (Oral Pill)	1314002	Atenolol	84e9de8f-27c3-4177-827a-6992495511ac	2014-05-21 00:00:00	\N	\N
407	ATGAM (Injectable)	19061406	Lymphocyte immune globulin	bd545ba1-2366-4df1-bd67-10dfd7632b54	2015-04-14 00:00:00	\N	\N
408	ATIVAN (Injectable)	791967	Lorazepam	5fc0e987-61c9-40c4-b0d5-fcea07c8733e	2012-04-17 00:00:00	\N	\N
409	ATIVAN (Oral Pill)	791967	Lorazepam	89057c93-8155-4040-acec-64e877bd2b4c	2013-05-03 00:00:00	\N	\N
410	Atomoxetine (Oral Pill)	742185	atomoxetine	6a7584b5-524d-4726-86a2-1b08e422f60e	2014-10-27 00:00:00	\N	\N
411	Atorvastatin (Oral Pill)	1545958	atorvastatin	8f71bea6-2fd0-44ae-afd9-727d365293a0	2015-09-30 00:00:00	\N	\N
412	Atorvastatin/Ezetimibe (Oral Pill)	1545958	atorvastatin	c387354c-607b-474d-b2e5-d35c789ce09b	2013-09-09 00:00:00	\N	\N
413	Atovaquone/Proguanil (Oral Pill)	1781733	Atovaquone	c50d51ab-23c2-45cb-8f68-08f3454fb59b	2015-08-24 00:00:00	\N	\N
414	Atracurium (Injectable)	19014341	Atracurium	ca9e266c-8264-46f4-9df3-8d86a9d8437f	2015-07-31 00:00:00	\N	\N
415	ATRALIN (Topical)	903643	Tretinoin	b6b45969-a64a-4ce3-b3b6-157d2568a301	2015-01-22 00:00:00	\N	\N
416	ATRIDOX (Oral Gel)	1738521	Doxycycline	2c718fc7-2921-4d02-b273-784e513f8299	2012-11-14 00:00:00	\N	\N
417	ATRIPLA (Oral Pill)	1738135	efavirenz	5c6c7ba4-6d42-4e07-a127-b3cf72c866ad	2014-11-03 00:00:00	\N	\N
418	Atropine (Injectable)	914335	Atropine	baf1529e-737d-4cbc-9111-6e5d89525051	2013-09-24 00:00:00	\N	\N
419	Atropine (Ophthalmic)	914335	Atropine	c0a56d60-0914-42b1-af59-c56afe93d18c	2015-08-03 00:00:00	\N	\N
420	Atropine/Diphenoxylate (Oral Liquid)	914335	Atropine	88ed4ccf-9e35-4142-a5eb-d2b5edd36956	2012-10-18 00:00:00	\N	\N
421	Atropine/Diphenoxylate (Oral Pill)	914335	Atropine	6f76c6d2-7a30-43cd-8c2b-d6a12f8fc867	2015-10-01 00:00:00	\N	\N
422	Atropine/Edrophonium (Injectable)	914335	Atropine	358336e5-3628-49ec-9134-6ec8c4ea733a	2013-12-20 00:00:00	\N	\N
423	Atropine/Hyoscyamine/PHENobarbital/Scopolamine (Oral Liquid)	914335	Atropine	ddff0982-3502-4db6-ae73-c77a0250dea8	2015-09-22 00:00:00	\N	\N
424	Atropine/Hyoscyamine/PHENobarbital/Scopolamine (Oral Pill)	914335	Atropine	1cc18146-d9be-4975-89ba-e99a85f71c76	2015-09-22 00:00:00	\N	\N
425	Atropine/Hyoscyamine/PHENobarbital/Scopolamine XR (Oral Pill)	914335	Atropine	2064014b-6f8e-4232-88c2-d1870042abc7	2011-10-17 00:00:00	\N	\N
426	AUGMENTIN (Oral Liquid)	1713332	Amoxicillin	55aefa88-46fc-2b73-0819-0c2f88274852	2013-03-11 00:00:00	\N	\N
427	AUGMENTIN (Oral Pill)	1713332	Amoxicillin	174cc098-fe49-4f1a-87e2-601c7573f0db	2013-03-11 00:00:00	\N	\N
428	Auranofin (Oral Pill)	1114771	Auranofin	05c34ddf-a0f7-4267-83f5-d02be3defc37	2011-12-15 00:00:00	\N	\N
429	AURO EAR (Otic)	958999	carbamide peroxide	924e613b-4952-4861-aac7-b8534ea0f305	2011-03-03 00:00:00	\N	\N
430	AURODEX (Otic)	1036059	Antipyrine	fa67ddca-a12e-4798-b170-843cd8e7afeb	2012-12-07 00:00:00	\N	\N
431	Aurothiomalate (Injectable)	1152134	Aurothiomalate	a29045b5-ba4f-407a-a0fd-3ef7e1ce64ee	2010-07-20 00:00:00	\N	\N
432	Austrian pine pollen extract (Injectable)	40171641	Austrian pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
433	AVAGE (Topical)	947416	tazarotene	cd8a3be3-8f83-42cf-8752-6fd16da65150	2012-03-19 00:00:00	\N	\N
434	AVALIDE (Oral Pill)	974166	Hydrochlorothiazide	716ab835-584e-4bdc-ac7c-f685d88b4dad	2014-12-10 00:00:00	\N	\N
435	AVANDAMET (Oral Pill)	1503297	Metformin	e77a8504-b49f-4343-beaf-6e4c2c59ab45	2015-03-27 00:00:00	\N	\N
436	AVANDIA (Oral Pill)	1547504	rosiglitazone	ec682aec-e98f-41a1-9d21-eb7580ea3a8a	2015-06-11 00:00:00	\N	\N
437	AVAPRO (Oral Pill)	1347384	irbesartan	c6f1e307-9107-431b-9a49-38049e429494	2015-04-02 00:00:00	\N	\N
438	AVAR (Soap)	1036252	Sulfacetamide	1947cbbf-da90-1520-e054-00144ff88e88	2015-06-24 00:00:00	\N	\N
439	AVAR (Topical)	1036252	Sulfacetamide	a57968d2-8012-46a8-9f77-e16ad4e86335	2014-01-24 00:00:00	\N	\N
440	AVEENO ACTIVE NATURALS (Topical)	986261	Colloidal oatmeal	b6de08f0-3cdb-4ac1-a958-c94c9f0e9a2a	2015-10-02 00:00:00	\N	\N
441	AVEENO ACTIVE NATURALS NOURISH PLUS DANDRUFF CONTROL (Shampoo)	944360	zinc pyrithione	2481d840-45c3-46ac-8368-e4835d685669	2012-10-16 00:00:00	\N	\N
442	AVEENO ACTIVE NATURALS SKIN RELIEF (Topical)	916662	dimethicone	bfbf4bf8-7dad-46d7-baeb-66a691652702	2015-08-03 00:00:00	\N	\N
443	AVEENO ANTI-ITCH REFORMULATED JUN 2007 (Topical)	902616	Calamine	a042095e-a139-4c5d-8ffb-39e37da2a93a	2013-06-28 00:00:00	\N	\N
444	AVEENO BABY (Topical)	916662	dimethicone	1267319e-9e40-403f-a259-834b4423b567	2015-10-05 00:00:00	\N	\N
445	AVEENO BABY DIAPER RASH CREAM (Topical)	911064	Zinc Oxide	1267319e-9e40-403f-a259-834b4423b567	2013-06-10 00:00:00	\N	\N
446	AVEENO HEALING OINTMENT (Topical)	19033354	Petrolatum	6d798970-c36e-4ee3-9ef8-d1d6245b5f6c	2012-07-19 00:00:00	\N	\N
447	AVELOX (Oral Pill)	1716903	moxifloxacin	ebe94683-8fd8-4d99-aa13-46ce14dbcd62	2013-12-18 00:00:00	\N	\N
448	AVITA (Topical)	903643	Tretinoin	96c39a66-20b0-4c39-a665-c54a2531f096	2015-03-19 00:00:00	\N	\N
449	AVODART (Oral Pill)	989482	Dutasteride	813507ec-1fc1-420f-ac5c-5c794b1059cd	2011-12-20 00:00:00	\N	\N
450	AVONEX (Injectable)	722424	Interferon beta-1a	0de49d64-3e18-494c-bf14-bc152247c798	2012-10-09 00:00:00	\N	\N
451	AXERT (Oral Pill)	1103552	almotriptan	886c13fa-4547-4411-88aa-8e23a7a698f6	2012-10-25 00:00:00	\N	\N
452	AXID AR (Oral Pill)	950696	Nizatidine	5c371d53-b93d-565e-bae6-1354c99d9035	2009-06-22 00:00:00	\N	\N
453	Axitinib (Oral Pill)	42709322	axitinib	84137882-e000-47da-bd5b-fa76ab3c76f9	2014-08-27 00:00:00	\N	\N
454	azaCITIDine (Injectable)	1314865	Azacitidine	e437efe0-9c6a-4f87-b3b4-de90443b095f	2015-06-22 00:00:00	\N	\N
455	AZASITE (Ophthalmic)	1734104	Azithromycin	14ae4c07-b042-452a-b069-2b41bc646e04	2015-03-12 00:00:00	\N	\N
456	azaTHIOprine (Oral Pill)	19014878	Azathioprine	e385894f-212b-4582-a63a-a0767fd97645	2015-07-31 00:00:00	\N	\N
457	Azelastine (Ophthalmic)	934075	azelastine	f2f72f86-c1c8-11df-851a-0800200c9a66	2014-04-28 00:00:00	\N	\N
458	Azelate (Topical)	986790	Azelate	b086c825-401e-48e7-a6dd-2ad7423e86a0	2015-10-09 00:00:00	\N	\N
459	Azelate/Cupric oxide/Folic Acid/Niacinamide/Pyridoxine/Zinc Oxide (Oral Pill)	986790	Azelate	1482d448-0f34-4aa6-b461-cb145404f6bc	2015-09-21 00:00:00	\N	\N
460	AZELEX (Topical)	986790	Azelate	0d5269d5-6555-4d2c-bc3b-df862b014275	2015-10-09 00:00:00	\N	\N
461	Azficel-T (Injectable)	40241205	azficel-T	4a41354f-c689-4216-82cc-bfc572f16374	2012-01-31 00:00:00	\N	\N
462	AZILECT (Oral Pill)	715710	rasagiline	a40d0e73-3f9f-4b01-979d-402c9cdaeb60	2014-10-09 00:00:00	\N	\N
463	Azilsartan (Oral Pill)	40235485	azilsartan	52b27c75-9f5a-4816-bafd-dace9d7d2063	2015-08-24 00:00:00	\N	\N
464	Azilsartan/Chlorthalidone (Oral Pill)	40235485	azilsartan	e60f795b-fce3-4361-aa03-f143451689d1	2015-08-24 00:00:00	\N	\N
465	Azithromycin (Ophthalmic)	1734104	Azithromycin	14ae4c07-b042-452a-b069-2b41bc646e04	2015-03-12 00:00:00	\N	\N
466	Azithromycin (Oral Liquid)	1734104	Azithromycin	035ce971-cf46-40c0-9b2f-ae52ab4e3468	2015-08-07 00:00:00	\N	\N
467	Azithromycin (Oral Pill)	1734104	Azithromycin	7e7c2f49-449c-4ba2-98ae-0ff0c040614c	2015-10-01 00:00:00	\N	\N
468	AZO URINARY PAIN RELIEF (Oral Pill)	933724	Phenazopyridine	b2c6bb64-bb81-413c-8a6b-0420d2573ab6	2015-03-12 00:00:00	\N	\N
469	AZO-GESIC (Oral Pill)	933724	Phenazopyridine	b10d0f4e-4f52-4fec-9d49-289fb9c84cd8	2014-10-16 00:00:00	\N	\N
470	AZOPT (Ophthalmic)	938044	brinzolamide	e9ea2ae7-1b98-4034-9fba-8ce2225e0145	2012-03-12 00:00:00	\N	\N
471	AZOR (Oral Pill)	1332418	Amlodipine	d6f37813-40bb-4fe8-99e2-ad2339b8e04a	2012-01-10 00:00:00	\N	\N
472	BABY ANTI MONKEY BUTT DIAPER RASH CREAM (Topical)	902616	Calamine	d95eeedb-393e-0859-19ef-72bb421e3046	2012-04-20 00:00:00	\N	\N
473	BABY ANTI MONKEY BUTT DIAPER RASH POWDER (Topical)	902616	Calamine	d9d6ea6f-0793-3c9d-f92c-a9e2f0bee20b	2012-07-11 00:00:00	\N	\N
474	BABYBIG (Injectable)	19072699	Botulism Immune Globulin IV Human	9ec59262-35c1-4d8e-8451-a7cfbacb0675	2014-11-21 00:00:00	\N	\N
475	Bacitracin (Injectable)	915175	Bacitracin	a3d2f60c-d3e8-4ce8-92eb-d3044783e5dd	2013-11-22 00:00:00	\N	\N
476	Bacitracin (Ophthalmic)	915175	Bacitracin	b2983ec7-5f63-4909-891b-92214d3a637f	2013-06-12 00:00:00	\N	\N
477	Bacitracin (Topical)	915175	Bacitracin	c4b90624-4713-401f-90c8-77df632409f9	2015-10-01 00:00:00	\N	\N
478	Bacitracin/Dimethicone/Zinc Oxide (Topical)	915175	Bacitracin	f439fb97-0722-42ee-bc90-67daf0497aa8	2011-11-16 00:00:00	\N	\N
479	Bacitracin/Hydrocortisone/Neomycin/Polymyxin B (Ophthalmic)	915175	Bacitracin	ce7ded34-66ab-4b6d-a9d7-fcf0c8d86eaa	2015-08-12 00:00:00	\N	\N
480	Bacitracin/Hydrocortisone/Neomycin/Polymyxin B (Topical)	915175	Bacitracin	097a7a8d-04d4-4736-c8b7-0796117457bf	2015-04-03 00:00:00	\N	\N
481	Bacitracin/Lidocaine/Neomycin/Polymyxin B (Topical)	915175	Bacitracin	d7d8b557-93a1-436b-a67a-5333e749c9c9	2014-07-29 00:00:00	\N	\N
482	Bacitracin/Neomycin/Polymyxin B (Ophthalmic)	915175	Bacitracin	e58d6e45-36bc-4ffc-8860-3befe2ed2396	2015-08-14 00:00:00	\N	\N
483	Bacitracin/Neomycin/Polymyxin B (Topical)	915175	Bacitracin	58ff1e78-5690-48ac-93ee-774604bbf73d	2015-10-01 00:00:00	\N	\N
484	Bacitracin/Neomycin/Polymyxin B/Pramoxine (Topical)	915175	Bacitracin	fe7c7e73-168f-4af3-ad50-6318b91f4d9c	2015-06-17 00:00:00	\N	\N
485	Bacitracin/Polymyxin B (Ophthalmic)	915175	Bacitracin	c6c69fa4-d7be-4c09-b7fa-53c40fad78a7	2013-10-28 00:00:00	\N	\N
486	Bacitracin/Polymyxin B (Topical)	915175	Bacitracin	dd7aceb6-0666-4059-b2a9-8e7fe5f3f0ac	2013-11-07 00:00:00	\N	\N
487	BACKAID IPF (Oral Pill)	1125315	Acetaminophen	b1dc7b4d-ef8d-4d00-90f1-107eb34e4fc5	2012-10-26 00:00:00	\N	\N
488	Baclofen (Oral Disintegrating)	715233	Baclofen	f133fe04-1550-4fa4-9dc4-652c27936bf2	2006-09-21 00:00:00	\N	\N
489	Baclofen (Oral Pill)	715233	Baclofen	07730b69-3b5b-492d-b10e-5826013f8997	2015-09-15 00:00:00	\N	\N
490	BACTINE (Topical)	916460	Benzalkonium	60476e61-e2b8-47bd-b391-533ec510658e	2013-07-11 00:00:00	\N	\N
491	BACTRIM (Oral Pill)	1836430	Sulfamethoxazole	f59d0c04-9c66-4d53-a0e1-cb55570deb62	2015-01-05 00:00:00	\N	\N
492	BACTROBAN (Nasal)	951511	Mupirocin	c142ab8f-fa5c-471a-a49a-058ab8ec023b	2013-03-22 00:00:00	\N	\N
493	BACTROBAN (Topical)	951511	Mupirocin	76bdab9d-9153-4db6-9b9a-ff376374a8ea	2013-12-31 00:00:00	\N	\N
494	BAL IN OIL (Injectable)	1728903	Dimercaprol	2ed1fc15-ca74-400e-bfdb-64483b2c590b	2012-05-01 00:00:00	\N	\N
495	BALMEX (Topical)	911064	Zinc Oxide	b877ec82-e5bb-cd18-a295-bbd4fc29fd17	2015-09-10 00:00:00	\N	\N
496	BALMEX OINTMENT (Topical)	19033354	Petrolatum	a9e48059-1319-4cd4-9be5-5376eaf8bbf3	2014-03-19 00:00:00	\N	\N
497	Balsalazide (Oral Pill)	934262	balsalazide	509b83b6-cde6-393b-8560-557793b6a529	2015-10-01 00:00:00	\N	\N
498	BANALG (Topical)	901656	Menthol	5b4c09e6-4228-47d5-b8f2-5959f8aede38	2011-04-28 00:00:00	\N	\N
499	BANOPHEN (Oral Liquid)	1129625	Diphenhydramine	9f40ea06-bd0b-4db8-91d6-774f65a7f345	2014-12-10 00:00:00	\N	\N
500	BANOPHEN (Oral Pill)	1129625	Diphenhydramine	cb498f07-75fe-47d5-9620-f87405d168af	2015-04-21 00:00:00	\N	\N
501	BANOPHEN CREAM (Topical)	1129625	Diphenhydramine	e79cf602-dc91-4fb9-844d-efed58e728d9	2015-03-16 00:00:00	\N	\N
502	Barley smut extract (Injectable)	40175802	barley smut extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
503	BAYCADRON (Oral Liquid)	1518254	Dexamethasone	e59d3b87-af2e-4262-b89d-e95aa79f11b7	2009-07-23 00:00:00	\N	\N
504	BAYER ASPIRIN (Chewable)	1112807	Aspirin	070d5713-e018-2913-e054-00144ff8d46c	2015-01-12 00:00:00	\N	\N
505	BAYER ASPIRIN (Oral Pill)	1112807	Aspirin	751e8cde-0dd8-483f-8e81-61f86203db1c	2015-01-12 00:00:00	\N	\N
506	BAYER ASPIRIN PM REFORMULATED NOV 2011 (Oral Pill)	1112807	Aspirin	0c79f57f-7fc9-39a5-e054-00144ff88e88	2015-01-13 00:00:00	\N	\N
507	BAZA CLEANSE AND PROTECT (Topical)	916662	dimethicone	ca5fa4ae-c18d-4457-b520-4a9318ea821f	2012-08-13 00:00:00	\N	\N
508	BAZA CLEAR (Topical)	19033354	Petrolatum	69d9f456-1a35-4146-8366-c0285648a172	2012-08-13 00:00:00	\N	\N
509	BAZA-PROTECT (Topical)	916662	dimethicone	ed63df26-3879-46df-8e09-10be569b25be	2012-08-13 00:00:00	\N	\N
510	"Bazedoxifene/Estrogens, Conjugated (USP) (Oral Pill)"	44506794	bazedoxifene	e1b75458-2e5b-46b9-92c6-fa6daba3770f	2015-10-01 00:00:00	\N	\N
511	BC ORIGINAL FORMULA (Oral Powder)	1112807	Aspirin	0908e63c-9700-4647-856c-6b02b03f62a1	2015-01-26 00:00:00	\N	\N
512	"BCG, Live, Connaught Strain (Topical)"	19023835	"BCG, Live, Connaught Strain"	8e456333-5a25-4484-84bf-53ece67c000a	2013-11-12 00:00:00	\N	\N
513	BEBULIN (Injectable)	1351935	factor IX	b375a2fb-7bd4-486c-87f6-72237713d528	2014-03-28 00:00:00	\N	\N
514	Becaplermin (Topical)	912476	Becaplermin	fd2c7d21-7b07-4ab3-8983-816ab3223771	2015-03-02 00:00:00	\N	\N
515	BEDSIDE-CARE (Topical)	916802	Benzethonium	3e8a37f0-3b44-4bba-8987-2717b54419f1	2013-12-30 00:00:00	\N	\N
516	Beech pollen extract (Injectable)	40161542	beech pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
517	Belatacept (Injectable)	40239665	belatacept	c16ac648-d5d2-9f7d-8637-e2328572754e	2014-10-17 00:00:00	\N	\N
518	BELEODAQ (Injectable)	45776670	belinostat	84b2e16e-f0d1-4757-8da8-79dfa83aab79	2014-07-21 00:00:00	\N	\N
519	Belinostat (Injectable)	45776670	belinostat	84b2e16e-f0d1-4757-8da8-79dfa83aab79	2014-07-21 00:00:00	\N	\N
520	Belladonna Alkaloids/Opium (Rectal)	1116109	Belladonna Alkaloids	8301e76b-134a-43d2-a7dc-c600ccf2695c	2012-09-18 00:00:00	\N	\N
521	BELSOMRA (Oral Pill)	45775760	Suvorexant	e5b72731-1acb-45b7-9c13-290ad12d3951	2015-08-12 00:00:00	\N	\N
522	BENADRYL (Oral Liquid)	1129625	Diphenhydramine	fc9181b9-c92d-493e-8d7c-4a4239c6c092	2011-10-13 00:00:00	\N	\N
523	BENADRYL (Oral Pill)	1129625	Diphenhydramine	53de0882-12ad-4c5c-bdb8-85d40d1da5e6	2015-08-20 00:00:00	\N	\N
524	BENADRYL (Topical)	1129625	Diphenhydramine	f230079e-41f3-40f2-93f0-4052e5d84095	2014-09-30 00:00:00	\N	\N
525	BENADRYL CHILDREN'S ANTI-ITCH (Topical)	938205	Camphor	36edeed8-894b-4f49-bb9a-9b43181b4906	2015-09-15 00:00:00	\N	\N
526	BENADRYL ITCH STOPPING (Topical)	1129625	Diphenhydramine	3ef170f8-f60c-48ea-b21f-742e84484a4c	2015-10-01 00:00:00	\N	\N
527	BENADRYL-D ALLERGY AND SINUS (Oral Liquid)	1129625	Diphenhydramine	b8b75904-3806-4258-89c1-d6ff486ed41c	2014-09-30 00:00:00	\N	\N
528	Benazepril (Oral Pill)	1335471	benazepril	47394912-aca4-4b62-8c7e-791eae1d69be	2015-09-17 00:00:00	\N	\N
529	Benazepril/Hydrochlorothiazide (Oral Pill)	1335471	benazepril	1ea9c4d0-a5ce-5961-e054-00144ff88e88	2015-09-01 00:00:00	\N	\N
530	Bendroflumethiazide/Nadolol (Oral Pill)	1316354	Bendroflumethiazide	d2d226ea-1624-47ee-82bf-e9660b75029f	2013-11-12 00:00:00	\N	\N
531	BENGAY (Topical)	901656	Menthol	bc34dc2a-fb50-4a58-8cdb-7d56426c6b37	2015-08-06 00:00:00	\N	\N
532	BENGAY (Transdermal)	901656	Menthol	f6ae09c0-5915-468c-8aec-16857c47df6b	2012-09-04 00:00:00	\N	\N
533	BENGAY ORIGINAL (Topical)	901656	Menthol	8aede1af-1547-47c7-9317-528be697677f	2014-04-03 00:00:00	\N	\N
534	BENICAR (Oral Pill)	40226742	olmesartan	b2d10788-e0e4-4ee8-8c47-d7f7ed44e3d9	2014-08-20 00:00:00	\N	\N
535	BENICAR HCT (Oral Pill)	974166	Hydrochlorothiazide	9b91af80-14ff-4ece-8647-4265b7fa6240	2014-12-29 00:00:00	\N	\N
536	BENOXYL (Soap)	918172	Benzoyl Peroxide	06b7b534-9749-4f3d-ba4f-0787eb2e52e3	2014-08-08 00:00:00	\N	\N
537	BENSAL (Topical)	964407	Salicylic Acid	4b8ccee9-0f26-416d-a6e5-1261408df899	2014-04-18 00:00:00	\N	\N
538	Bentoquatam (Topical)	915518	bentoquatam	d3b3f56d-d1d5-4435-8ac7-a2118f108a9b	2012-05-31 00:00:00	\N	\N
539	BENZ-O-STHETIC (Mucosal)	917006	Benzocaine	92f1bddd-71af-427a-bce6-727adca90999	2012-06-12 00:00:00	\N	\N
540	BENZACLIN (Topical)	918172	Benzoyl Peroxide	4c6b2aca-d940-42af-a068-418f015d277a	2014-12-08 00:00:00	\N	\N
541	Benzalkonium (Topical)	916460	Benzalkonium	20cafd74-691f-45a0-b3e8-ca15a0f735ce	2015-09-17 00:00:00	\N	\N
542	Benzalkonium/Benzocaine (Topical)	916460	Benzalkonium	2f685c77-86d2-4558-80e0-550846598e76	2015-07-06 00:00:00	\N	\N
543	Benzalkonium/Benzocaine (Vaginal)	916460	Benzalkonium	4ff50f17-7679-4a7a-994a-bda6cd23cb90	2013-01-28 00:00:00	\N	\N
544	Benzalkonium/Benzocaine/Zinc chloride (Oral Gel)	916460	Benzalkonium	77f84651-7706-4042-acdd-dc68ba97771d	2013-01-08 00:00:00	\N	\N
545	Benzalkonium/Camphor (Topical)	916460	Benzalkonium	70afbecc-f39b-48d7-9839-907a786a8c29	2013-07-17 00:00:00	\N	\N
546	Benzalkonium/Lidocaine (Topical)	916460	Benzalkonium	0af5dc2e-09ce-4bc9-911f-ec2fd8f1e426	2015-10-02 00:00:00	\N	\N
547	Benzalkonium/Pramoxine (Topical)	916460	Benzalkonium	a092b2ff-18fb-481a-a17d-984a91cbaec7	2013-07-12 00:00:00	\N	\N
548	BENZAMYCIN (Topical)	918172	Benzoyl Peroxide	67823063-91a6-4867-a855-7ce0a4a09bd6	2014-04-16 00:00:00	\N	\N
549	BENZEDREX (Nasal)	954036	propylhexedrine	03a8ef3c-a808-6208-e054-00144ff8d46c	2014-09-25 00:00:00	\N	\N
550	BENZEFOAM (Topical)	918172	Benzoyl Peroxide	11c49c9d-0164-4e91-881f-34e02987a45d	2015-06-08 00:00:00	\N	\N
551	BENZEPRO (Topical)	918172	Benzoyl Peroxide	890ed265-1217-4fa6-b7f1-a7246dbe137e	2012-08-07 00:00:00	\N	\N
552	Benzethonium (Soap)	916802	Benzethonium	d18f0132-fef2-4de5-a4ff-c6e0df9d7f11	2015-03-12 00:00:00	\N	\N
553	Benzethonium (Topical)	916802	Benzethonium	a2b08b63-decd-4f2b-98ab-8703d9a55f93	2014-11-05 00:00:00	\N	\N
554	Benzethonium/Benzocaine (Topical)	916802	Benzethonium	4b965cd3-bfe4-4aad-a52c-b747696baa1c	2014-08-20 00:00:00	\N	\N
555	Benzethonium/Benzocaine/Menthol (Topical)	916802	Benzethonium	b780da38-8568-43e1-ab4a-5b69e4f55b19	2015-09-30 00:00:00	\N	\N
556	Benzethonium/Dyclonine (Topical)	916802	Benzethonium	37a75879-accb-4a6a-b8dd-558b94450fc4	2015-06-24 00:00:00	\N	\N
557	Benzethonium/Lidocaine (Topical)	916802	Benzethonium	09b1372c-a5a3-4d89-9b8e-4523f6a0341f	2014-06-02 00:00:00	\N	\N
558	BENZO-JEL (Oral Gel)	917006	Benzocaine	e735d183-609e-53d6-6640-293356e0a8f0	2015-07-07 00:00:00	\N	\N
559	Benzoate/Hyoscyamine/Methenamine/Methylene blue/Phenyl salicylate (Oral Pill)	711452	Benzoate	694d83e1-7ec0-42af-b906-bdf9ac521cd8	2015-09-29 00:00:00	\N	\N
560	Benzoate/Phenylacetate (Injectable)	711452	Benzoate	d564f2b1-9fc7-4201-8066-d745ac3a671f	2015-02-26 00:00:00	\N	\N
561	Benzocaine (Mucosal)	917006	Benzocaine	4fa350ce-720e-4949-8376-e90f0a0f2d66	2015-08-20 00:00:00	\N	\N
562	Benzocaine (Oral Cream)	917006	Benzocaine	628eda31-8142-4cf3-b24b-f19b81068c82	2014-01-27 00:00:00	\N	\N
563	Benzocaine (Oral Disintegrating)	917006	Benzocaine	a0e52795-e4ec-4205-8862-a51a2b2a7ae1	2010-10-09 00:00:00	\N	\N
564	Benzocaine (Oral Gel)	917006	Benzocaine	982e6c46-37ab-419b-acea-521b3c356a7c	2015-07-16 00:00:00	\N	\N
565	Benzocaine (Oral Lozenge)	917006	Benzocaine	7c161a17-cf82-4de3-8348-888c040df0f9	2013-10-18 00:00:00	\N	\N
566	Benzocaine (Oral Ointment)	917006	Benzocaine	58739ad0-8c8e-48cf-bec2-4336a67207ca	2013-04-17 00:00:00	\N	\N
567	Benzocaine (Oral Paste)	917006	Benzocaine	387f52e1-157a-4b9e-8f98-9001c6880786	2013-08-30 00:00:00	\N	\N
568	Benzocaine (Topical)	917006	Benzocaine	48aeca34-2cd5-41aa-98ba-606bda1f9ce3	2015-07-07 00:00:00	\N	\N
569	Benzocaine/Butamben/Tetracaine (Topical)	917006	Benzocaine	af1773c5-5d5b-4278-b551-30ad2df6d5b5	2015-10-02 00:00:00	\N	\N
570	Benzocaine/Cetylpyridinium/Menthol (Mucosal)	917006	Benzocaine	ed70911b-9da8-4e1d-97fa-66b18d28516a	2012-04-05 00:00:00	\N	\N
571	Benzocaine/Cetylpyridinium/Menthol/Zinc chloride (Mucosal)	917006	Benzocaine	31690548-0a55-4d72-8733-591ba3a9be92	2015-09-22 00:00:00	\N	\N
572	Benzocaine/Chloroxylenol (Topical)	917006	Benzocaine	e2eca808-e97b-43e0-aa51-7025cc61c7a8	2013-03-08 00:00:00	\N	\N
573	Benzocaine/Compound benzoin tincture (USP) (Mucosal)	917006	Benzocaine	fe1e32e8-ec36-4d1f-b3e4-913dbc852138	2015-01-29 00:00:00	\N	\N
574	Benzocaine/Dextromethorphan (Oral Lozenge)	917006	Benzocaine	c0cc32db-90f0-4106-8538-89821083ece1	2014-11-14 00:00:00	\N	\N
575	Benzocaine/Dextromethorphan/Menthol (Oral Lozenge)	917006	Benzocaine	34e4234c-ed61-4795-99fe-d281cdb0af88	2010-11-16 00:00:00	\N	\N
576	Benzocaine/Docusate (Rectal)	917006	Benzocaine	061acc74-eb3e-6887-e054-00144ff8d46c	2015-04-07 00:00:00	\N	\N
577	Benzocaine/Glycerin (Mucosal)	917006	Benzocaine	45561e94-2b54-4c19-be3e-b1949e1a5bbc	2012-07-17 00:00:00	\N	\N
578	Benzocaine/Isopropyl Alcohol (Topical)	917006	Benzocaine	07f10ebb-103d-475f-b89e-bf7ff9f59568	2013-09-16 00:00:00	\N	\N
579	Benzocaine/Menthol (Oral Gel)	917006	Benzocaine	c7936cbc-b132-4025-8439-8227b928c2fd	2013-07-31 00:00:00	\N	\N
580	Benzocaine/Menthol (Oral Lozenge)	917006	Benzocaine	21fd7f46-3e46-4344-895f-9e6a67f006aa	2015-07-23 00:00:00	\N	\N
581	Benzocaine/Menthol (Topical)	917006	Benzocaine	0648c46c-a3db-4b82-971b-50a46098ac7e	2014-05-07 00:00:00	\N	\N
582	Benzocaine/Resorcinol (Vaginal)	917006	Benzocaine	0286fcff-4172-4fb5-ba5d-139fc8efcf37	2015-09-01 00:00:00	\N	\N
583	Benzocaine/Tetracaine (Oral Gel)	917006	Benzocaine	324146a5-e473-4a54-8543-38ee567e815e	2010-07-20 00:00:00	\N	\N
584	Benzocaine/Triclosan (Topical)	917006	Benzocaine	cd738a0a-8058-465c-bdbd-76dc70aec005	2015-06-08 00:00:00	\N	\N
585	Benzocaine/Zinc chloride (Mucosal)	917006	Benzocaine	3bb651d9-d1c4-4c25-bcfc-cd13e2f0d3bf	2014-03-06 00:00:00	\N	\N
586	Benzoin (Topical)	19011438	Benzoin	b33b5896-673b-498c-8a58-76ece8552f7a	2013-09-13 00:00:00	\N	\N
587	Benzonatate (Oral Pill)	1136601	benzonatate	057214bd-9892-4e4f-bd93-4c123c30c8ba	2015-09-29 00:00:00	\N	\N
588	Benzoyl Peroxide (Soap)	918172	Benzoyl Peroxide	3d8a20f7-0c4c-4c89-bddf-200194612b7a	2015-10-09 00:00:00	\N	\N
589	Benzoyl Peroxide (Topical)	918172	Benzoyl Peroxide	5a3f8bbf-22be-427b-83a9-f5573232ed5f	2015-09-30 00:00:00	\N	\N
590	Benzoyl Peroxide/Clindamycin (Topical)	918172	Benzoyl Peroxide	4c6b2aca-d940-42af-a068-418f015d277a	2015-05-21 00:00:00	\N	\N
591	Benzoyl Peroxide/Erythromycin (Topical)	918172	Benzoyl Peroxide	80397ecd-6069-43dc-b8ae-8703f4b66308	2014-12-08 00:00:00	\N	\N
592	Benzoyl Peroxide/Hydrocortisone (Topical)	918172	Benzoyl Peroxide	1f0edbd9-103e-4a49-b7a8-6552ef172c13	2014-10-24 00:00:00	\N	\N
593	Benzphetamine (Oral Pill)	719128	Benzphetamine	76c76f8e-d8e8-429a-ba67-c270e5ac6c83	2015-09-08 00:00:00	\N	\N
594	Benztropine (Injectable)	719174	Benztropine	d61eae0d-a29d-45ef-bd41-07123e0c21f9	2015-05-19 00:00:00	\N	\N
595	Benztropine (Oral Pill)	719174	Benztropine	9b93035b-34d6-4084-ba73-5dea72f9d124	2015-10-06 00:00:00	\N	\N
596	Benzyl Alcohol (Oral Gel)	919681	Benzyl Alcohol	0910d0d8-dc69-43bb-967d-08cab8ae917b	2014-02-05 00:00:00	\N	\N
597	Benzyl Alcohol (Topical)	919681	Benzyl Alcohol	aeba2488-1ac3-4c02-833c-78a36859f029	2014-07-29 00:00:00	\N	\N
598	Benzyl Alcohol/Calamine/DiphenhydrAMINE (Topical)	919681	Benzyl Alcohol	6f68cbbb-6269-4bb3-8cc9-50b146703b42	2012-10-18 00:00:00	\N	\N
599	Benzyl Alcohol/Camphor/Menthol (Topical)	919681	Benzyl Alcohol	4792a667-2378-4b3d-968d-9efb1866792f	2015-01-20 00:00:00	\N	\N
600	Benzyl Alcohol/Pramoxine (Topical)	919681	Benzyl Alcohol	03f85dbb-a13a-3126-e054-00144ff8d46c	2014-09-26 00:00:00	\N	\N
601	Benzyl benzoate (Topical)	19036946	benzyl benzoate	ba27041b-0253-43a3-a1d6-4fb0ddee5ecb	2015-06-29 00:00:00	\N	\N
602	Bepotastine (Ophthalmic)	40166571	bepotastine	68bbf6a0-c4b5-47c1-8a1c-08220fbdbce6	2015-08-03 00:00:00	\N	\N
603	BEPREVE (Ophthalmic)	40166571	bepotastine	68bbf6a0-c4b5-47c1-8a1c-08220fbdbce6	2015-08-03 00:00:00	\N	\N
604	Bermuda grass pollen extract (Injectable)	40161082	Bermuda grass pollen extract	1974e1c0-c5d2-2630-e054-00144ff88e88	2015-07-20 00:00:00	\N	\N
605	Bermuda grass smut extract (Injectable)	40227684	Bermuda grass smut extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
606	Bermuda grass smut extract/Johnson grass smut extract (Injectable)	40227684	Bermuda grass smut extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
607	BERRI-FREEZ (Topical)	901656	Menthol	3e7d643b-33a3-416b-b289-9e4b58c797e1	2013-12-06 00:00:00	\N	\N
608	Besifloxacin (Ophthalmic)	40161662	besifloxacin	a3e6d688-7e5e-4ca3-b27e-79756c322a32	2015-08-03 00:00:00	\N	\N
609	BESIVANCE (Ophthalmic)	40161662	besifloxacin	a3e6d688-7e5e-4ca3-b27e-79756c322a32	2015-08-03 00:00:00	\N	\N
610	BETADINE (Ophthalmic)	1750087	Povidone-Iodine	b026de1b-9949-4557-ac49-c7b0038c24cd	2011-07-12 00:00:00	\N	\N
611	BETADINE (Topical)	1750087	Povidone-Iodine	2f07daa4-86ee-4a2d-ae3a-c3a7b574ed10	2014-09-24 00:00:00	\N	\N
612	Betaine (Oral Liquid)	1520218	Betaine	05964dae-8b84-467c-af97-c82706a3cad2	2007-05-17 00:00:00	\N	\N
613	Betamethasone (Injectable)	920458	Betamethasone	9a6a3871-4e02-47f9-a20e-a256b3f3c498	2015-10-13 00:00:00	\N	\N
614	Betamethasone (Topical)	920458	Betamethasone	ab332791-461b-4396-9b46-7f00bc04c087	2015-09-29 00:00:00	\N	\N
615	Betamethasone/Calcipotriene (Topical)	920458	Betamethasone	6c2ed55a-c7f2-42be-a194-bd498707ce3f	2015-04-28 00:00:00	\N	\N
616	Betamethasone/Clotrimazole (Topical)	920458	Betamethasone	1c18e5fc-bf82-47bc-bfd9-8d3e503569ba	2014-12-15 00:00:00	\N	\N
617	Betamethasone/Clotrimazole/Gentamicin Sulfate (USP) (Otic)	920458	Betamethasone	ff110754-cbc9-413d-a920-8bb3c455f8ae	2014-10-17 00:00:00	\N	\N
618	Betamethasone/Gentamicin Sulfate (USP) (Topical)	920458	Betamethasone	a36457c1-6ace-456f-9438-228a6daf2542	2015-09-25 00:00:00	\N	\N
619	BETAPACE (Oral Pill)	1370109	Sotalol	21aea811-f47d-4a44-a552-dfc46d2773bf	2012-07-05 00:00:00	\N	\N
620	BETASEPT (Soap)	1790812	Chlorhexidine	7e64e7bf-e88f-4056-c9e1-b49a277daa6c	2013-06-06 00:00:00	\N	\N
621	BETASERON (Injectable)	713196	interferon beta-1b	261fde67-efb2-4bd7-947e-4f68a56e76ff	2013-04-26 00:00:00	\N	\N
622	Betaxolol (Ophthalmic)	1322081	Betaxolol	1fc0a413-4e6b-4ed7-9957-ace4c8cfab55	2014-09-05 00:00:00	\N	\N
623	Betaxolol (Oral Pill)	1322081	Betaxolol	9a58c45d-4b14-44d7-86ed-2997ac6942dd	2014-12-30 00:00:00	\N	\N
624	Bethanechol (Oral Pill)	937439	Bethanechol	138ed3d0-57db-4df1-8124-06033ecc76f0	2015-10-05 00:00:00	\N	\N
625	BETHKIS (Inhalant)	902722	Tobramycin	1cd3d47b-025f-4705-9daf-cf07725ec223	2015-01-28 00:00:00	\N	\N
626	BETIMOL (Ophthalmic)	902427	Timolol	3d7acd55-33b1-4a24-99ae-01f87b0dca1f	2014-03-28 00:00:00	\N	\N
627	BETOPTIC (Ophthalmic)	1322081	Betaxolol	31b9b263-11fd-4495-83dd-ababf0d70e9e	2008-03-13 00:00:00	\N	\N
628	BETOPTIC S (Ophthalmic)	1322081	Betaxolol	71659a34-efad-4147-81c7-da10985e9224	2011-09-21 00:00:00	\N	\N
629	Bexarotene (Oral Pill)	1389888	bexarotene	2d1eb4bd-51f9-4c9b-9fb1-0be5e30a3dc5	2015-08-12 00:00:00	\N	\N
630	Bexarotene (Topical)	1389888	bexarotene	e415c4c8-3144-4172-94a0-f4f3243130ae	2014-02-14 00:00:00	\N	\N
631	BEXTRA (Oral Pill)	1103374	valdecoxib	caf64301-262c-45ca-acd1-a9d6696c584e	2007-03-23 00:00:00	\N	\N
632	BIAXIN (Oral Liquid)	1750500	Clarithromycin	2e899f4a-a2e9-445c-a0ed-6ad811e997e6	2012-02-24 00:00:00	\N	\N
633	BIAXIN (Oral Pill)	1750500	Clarithromycin	7c3d8c2c-ece6-4aba-8b5a-3865402cffcf	2014-12-23 00:00:00	\N	\N
634	Bicalutamide (Oral Pill)	1344381	bicalutamide	427a872b-1b0b-41cf-aca2-49ce0163c7e6	2015-05-26 00:00:00	\N	\N
635	BICLORA (Oral Liquid)	1150886	chlophedianol	c588736a-250b-4fc6-b221-b4b51052b032	2013-03-01 00:00:00	\N	\N
636	BICNU (Injectable)	1350066	Carmustine	d6cbb63c-e0b1-43ee-ad6f-408da0772079	2013-12-27 00:00:00	\N	\N
637	BIDEX (Oral Pill)	1163944	Guaifenesin	41e795d8-755a-41d0-b1ce-804334559e09	2013-01-08 00:00:00	\N	\N
638	BIDIL (Oral Pill)	1373928	Hydralazine	c21325a9-cd57-4e39-98f2-0727ed8abb2d	2015-08-21 00:00:00	\N	\N
639	BIFERARX (Oral Pill)	19111620	Folic Acid	a7c1400a-d230-45db-afff-d5f70b091ee9	2015-07-17 00:00:00	\N	\N
640	BILTRICIDE (Oral Pill)	1750461	Praziquantel	34ce1cdd-648e-4f1e-8512-bf3d4cc22eb9	2015-07-08 00:00:00	\N	\N
641	Bimatoprost (Ophthalmic)	904525	bimatoprost	ec9097e7-4be4-4e62-99c3-24b48244c9f2	2015-05-20 00:00:00	\N	\N
642	BIOFLEXOR (Topical)	901656	Menthol	455353d1-74dc-4b54-9da8-9ab5b81d14be	2014-10-03 00:00:00	\N	\N
643	BIOFREEZE (Topical)	901656	Menthol	a8d59d45-0e85-43d1-affd-bbe922c4acb1	2015-06-02 00:00:00	\N	\N
644	BIOTENE DRY MOUTH (Toothpaste)	19068715	monofluorophosphate	a47a6502-efb2-4072-9562-cbe293531c2b	2015-09-15 00:00:00	\N	\N
645	BISAC-EVAC (Rectal)	924939	Bisacodyl	fc6dc813-717e-5e5c-4b72-9e46e40e9c40	2012-09-05 00:00:00	\N	\N
646	Bisacodyl (Oral Pill)	924939	Bisacodyl	2caa9488-eacb-4c0f-81f5-5d25397a4fb4	2015-10-13 00:00:00	\N	\N
647	Bisacodyl (Rectal)	924939	Bisacodyl	2ce32d23-a0e3-4dc3-a03c-0aeddf6e2ab4	2015-04-27 00:00:00	\N	\N
648	BISCO-LAX (Rectal)	924939	Bisacodyl	2a1b271e-ae17-4284-bfa1-4d0e3c75fcc3	2011-09-30 00:00:00	\N	\N
649	Bismuth subsalicylate (Chewable)	937791	bismuth subsalicylate	ee478df8-8dda-4d43-bcdf-5b950a348627	2015-08-06 00:00:00	\N	\N
650	Bismuth subsalicylate (Oral Liquid)	937791	bismuth subsalicylate	ae8b3196-6f4e-4760-af6a-d28cf234078b	2015-10-09 00:00:00	\N	\N
651	Bismuth subsalicylate (Oral Pill)	937791	bismuth subsalicylate	0f02f1a4-3ea4-43de-bfdb-b9cb7626f92a	2015-05-21 00:00:00	\N	\N
652	Bisoprolol (Oral Pill)	1338005	Bisoprolol	d82243b9-3e56-4a2b-8750-cb95ec106885	2015-08-28 00:00:00	\N	\N
653	Bisoprolol/Hydrochlorothiazide (Oral Pill)	1338005	Bisoprolol	b9ee689a-ea12-435d-b01c-70d45891e62f	2015-02-13 00:00:00	\N	\N
654	Bitter dock pollen extract (Injectable)	40228117	bitter dock pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
655	Bitternut hickory pollen extract (Injectable)	40171925	bitternut hickory pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
656	Bivalirudin (Injectable)	19084670	bivalirudin	ce56f806-7845-429d-a1ce-c2dbf79b22eb	2015-09-10 00:00:00	\N	\N
657	Black walnut pollen extract (Injectable)	40161692	black walnut pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-11-24 00:00:00	\N	\N
658	Bleomycin (Injectable)	1329241	Bleomycin	b5806c40-12ce-48e3-8abd-9f8997ef4428	2014-10-01 00:00:00	\N	\N
659	BLEPHAMIDE (Ophthalmic)	1550557	prednisolone	e88d861a-77dd-4e4c-a0c8-d9863cd16322	2014-04-16 00:00:00	\N	\N
660	BLINK TEARS (Ophthalmic)	948490	Polyethylene Glycol 400	6f7e06c3-204d-459a-af8f-c46be9ad0e8d	2015-08-24 00:00:00	\N	\N
661	BLISTEX COLD & ALLERGY LIP SOOTHER (Topical)	916662	dimethicone	5db6db29-f6eb-498f-8d80-76e9c36b8874	2011-12-14 00:00:00	\N	\N
662	BLISTEX KANKA (Mucosal)	917006	Benzocaine	eebc03ba-f849-4e70-a653-834f383b6aa4	2013-04-16 00:00:00	\N	\N
663	BLISTEX MEDICATED LIP (Topical)	938205	Camphor	63300820-80ca-432f-b86d-ef15d878671b	2012-11-15 00:00:00	\N	\N
664	BLOXIVERZ (Injectable)	717136	Neostigmine	79ee2111-d65c-11e1-9b23-0800200c9a66	2014-12-12 00:00:00	\N	\N
665	Blue beech pollen extract (Injectable)	40171961	blue beech pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
666	Blue spruce pollen extract (Injectable)	40171965	blue spruce pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
667	BONINE (Chewable)	994341	Meclizine	0b4b55cd-063e-4d0e-911c-8e03886e15d3	2010-10-09 00:00:00	\N	\N
668	BOROFAIR (Otic)	929549	Acetic Acid	040850b0-68c0-4160-b3a8-271e7ec4cde9	2009-12-03 00:00:00	\N	\N
669	BOROLEUM (Topical)	938205	Camphor	00bd405f-c1c2-402d-bc2e-fa25c8ffaa25	2013-01-24 00:00:00	\N	\N
670	BOSULIF (Oral Pill)	42900401	bosutinib	adc84ad5-a04d-4fee-9ba8-91f7abd928e3	2015-03-10 00:00:00	\N	\N
671	Bosutinib (Oral Pill)	42900401	bosutinib	adc84ad5-a04d-4fee-9ba8-91f7abd928e3	2015-03-10 00:00:00	\N	\N
672	Botrytis cinerea extract (Injectable)	40161103	Botrytis cinerea extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
673	Botulism Immune Globulin IV Human (Injectable)	19072699	Botulism Immune Globulin IV Human	9ec59262-35c1-4d8e-8451-a7cfbacb0675	2014-11-21 00:00:00	\N	\N
674	Box elder maple pollen extract (Injectable)	40161593	box elder maple pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
675	BRAVELLE (Injectable)	1515417	Urofollitropin	46f7740f-c879-4a77-9a16-2821fd772641	2006-09-28 00:00:00	\N	\N
676	Bread mold fungus extract (Injectable)	40175794	bread mold fungus extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
677	BREVIBLOC (Injectable)	19063575	esmolol	595cc3d5-1306-4828-aefa-5595219ffd62	2015-02-03 00:00:00	\N	\N
678	BREVITAL (Injectable)	19005015	Methohexital	468a7188-2e77-480f-8c68-6e2e9b6b47fd	2015-06-12 00:00:00	\N	\N
679	Brimonidine (Ophthalmic)	915542	brimonidine	bc1785c5-1448-4791-9868-2fbbc8703b3b	2015-08-03 00:00:00	\N	\N
680	Brimonidine/Timolol (Ophthalmic)	915542	brimonidine	feaf1480-a4b8-4486-992a-96be3a596243	2013-11-22 00:00:00	\N	\N
681	BRINTELLIX (Oral Pill)	44507700	vortioxetine	4b0700c9-b417-4c3a-b36f-de461e125bd3	2014-09-22 00:00:00	\N	\N
682	Brinzolamide (Ophthalmic)	938044	brinzolamide	e9ea2ae7-1b98-4034-9fba-8ce2225e0145	2012-03-12 00:00:00	\N	\N
683	BRISDELLE (Oral Pill)	722031	Paroxetine	bf208751-e6d8-11e1-aff1-0800200c9a66	2014-12-05 00:00:00	\N	\N
684	Broadleaf cattail pollen extract (Injectable)	42709317	broadleaf cattail pollen extract	c7d383a6-94b8-4101-8a4c-fa7747a21468	2009-11-19 00:00:00	\N	\N
685	BROMDAY (Ophthalmic)	1139179	bromfenac	234a2447-90a7-4b8a-a344-7eef1e5daa6a	2013-10-18 00:00:00	\N	\N
686	BROMFED DM (Oral Liquid)	1130863	Brompheniramine	ccdf22f3-171f-4c19-8273-fefa140d1969	2014-01-14 00:00:00	\N	\N
687	Bromfenac (Ophthalmic)	1139179	bromfenac	3296f72b-62ba-d417-132b-30c4a6166609	2015-08-17 00:00:00	\N	\N
688	Bromocriptine (Oral Pill)	730548	Bromocriptine	f85296ab-a104-496f-a23d-e0a88cf91ec7	2014-10-24 00:00:00	\N	\N
689	Brompheniramine (Oral Liquid)	1130863	Brompheniramine	4a03c41d-4a89-4e74-b287-ce166058458a	2011-10-27 00:00:00	\N	\N
690	Brompheniramine/Codeine/Phenylephrine (Oral Liquid)	1130863	Brompheniramine	41c354cd-5e98-47ac-a81b-9c3915924c93	2015-02-23 00:00:00	\N	\N
691	Brompheniramine/Codeine/Pseudoephedrine (Oral Liquid)	1130863	Brompheniramine	f07920ad-7f4b-48d6-8c86-d5a257ff91c6	2014-02-18 00:00:00	\N	\N
692	Brompheniramine/Dextromethorphan/Phenylephrine (Oral Liquid)	1130863	Brompheniramine	bd86d5e2-f4e9-4c15-9a5c-15f91f10d743	2015-09-09 00:00:00	\N	\N
693	Brompheniramine/Dextromethorphan/Pseudoephedrine (Oral Liquid)	1130863	Brompheniramine	0654b093-2067-492f-a0bc-647dac430bde	2014-08-22 00:00:00	\N	\N
694	Brompheniramine/Dihydrocodeine/Phenylephrine (Oral Liquid)	1130863	Brompheniramine	315a70bc-bfd8-471d-9379-d2746823537d	2010-07-20 00:00:00	\N	\N
695	Brompheniramine/Dihydrocodeine/Pseudoephedrine (Oral Liquid)	1130863	Brompheniramine	4de68448-1f01-4ca1-b002-15589999de0f	2012-02-24 00:00:00	\N	\N
696	Brompheniramine/Phenylephrine (Chewable)	1130863	Brompheniramine	655b4796-6ffc-c27f-b66e-d2ae0c7ad053	2010-10-09 00:00:00	\N	\N
697	Brompheniramine/Phenylephrine (Oral Liquid)	1130863	Brompheniramine	1ee8e5fb-cd12-4f37-a0c7-dbf386313ab8	2015-10-13 00:00:00	\N	\N
698	Brompheniramine/Phenylephrine (Oral Pill)	1130863	Brompheniramine	9aeaffc0-be85-4ca7-ae67-d439ccfe6511	2012-09-24 00:00:00	\N	\N
699	Brompheniramine/Pseudoephedrine (Oral Liquid)	1130863	Brompheniramine	4eba1542-8062-434a-a364-490a85ccc680	2013-04-10 00:00:00	\N	\N
700	Brompheniramine/Pseudoephedrine (Oral Pill)	1130863	Brompheniramine	4ae74ab3-c1f7-4347-9833-16553cf9969d	2012-02-06 00:00:00	\N	\N
701	BRONCOTRON (Oral Liquid)	1119510	Dextromethorphan	6cbf83f6-cbf4-4e5b-a383-6d71124547bc	2011-12-29 00:00:00	\N	\N
702	BRONKAID (Oral Pill)	1143374	Ephedrine	699e7629-5e8a-4dac-b494-fe42698ee460	2015-06-18 00:00:00	\N	\N
703	BROVEX PEB (Oral Liquid)	1130863	Brompheniramine	ceb99dea-44ca-40c8-b479-da97707c513f	2011-04-19 00:00:00	\N	\N
704	Budesonide (Inhalant)	939259	Budesonide	4f339e84-33be-44d1-bbae-e0579da12c7f	2015-07-24 00:00:00	\N	\N
705	Budesonide (Oral Pill)	939259	Budesonide	7633c9b3-dfb5-446f-a260-e44b6e48afa2	2015-10-09 00:00:00	\N	\N
706	BUFFERIN (Oral Pill)	1112807	Aspirin	802c81ff-e2ff-4d91-8589-55b1d1859b42	2013-06-28 00:00:00	\N	\N
707	Bumetanide (Injectable)	932745	Bumetanide	00b71dc2-1851-4670-a48e-b4eb89d48d0b	2014-05-08 00:00:00	\N	\N
708	Bumetanide (Oral Pill)	932745	Bumetanide	509dba6d-7e53-02ed-8d86-fe83a2126250	2015-04-23 00:00:00	\N	\N
709	BUMINATE (Injectable)	1344143	"Albumin Human, USP"	4efc78ab-6b74-4ce9-bd3e-9411130ea81b	2014-10-31 00:00:00	\N	\N
710	BUNAVAIL (Buccal)	1133201	Buprenorphine	12b963dd-f189-11e3-ac10-0800200c9a66	2014-08-06 00:00:00	\N	\N
711	BUPAP (Oral Pill)	1125315	Acetaminophen	30e483da-eaf1-4c73-9fed-333337f9ba86	2014-12-11 00:00:00	\N	\N
712	BUPHENYL (Oral Pill)	1539954	phenylbutyrate	aa638c13-3048-42b2-8a8b-79dae040ea35	2014-03-07 00:00:00	\N	\N
713	BUPHENYL (Oral Powder)	1539954	phenylbutyrate	aa638c13-3048-42b2-8a8b-79dae040ea35	2014-03-07 00:00:00	\N	\N
714	Bupivacaine (Injectable)	732893	Bupivacaine	5e2f3987-624f-4cbf-9cf1-fad4f181a78f	2015-10-13 00:00:00	\N	\N
715	Bupivacaine liposome (Injectable)	40244151	Bupivacaine liposome	bb5a9e59-0f51-11df-8a39-0800200c9a66	2015-04-24 00:00:00	\N	\N
716	Bupivacaine/EPINEPHrine (Injectable)	732893	Bupivacaine	6a60cb55-530a-41ee-bc78-971eaf9f0850	2015-09-10 00:00:00	\N	\N
717	Bupivacaine/fentaNYL (Injectable)	732893	Bupivacaine	e364b224-8fb5-45cd-8e29-adb09afae80f	2015-01-13 00:00:00	\N	\N
718	BUPRENEX (Injectable)	1133201	Buprenorphine	b086772e-d15a-4d13-b1a2-38bfbde1f18c	2014-11-18 00:00:00	\N	\N
719	Buprenorphine (Injectable)	1133201	Buprenorphine	6795ade9-e06e-4daa-bb45-821901a055f5	2015-09-14 00:00:00	\N	\N
720	Buprenorphine (Sublingual)	1133201	Buprenorphine	5efb3e1f-e908-4ed4-85d1-7961878d7fc5	2015-05-04 00:00:00	\N	\N
721	Buprenorphine/Naloxone (Buccal)	1133201	Buprenorphine	12b963dd-f189-11e3-ac10-0800200c9a66	2014-08-06 00:00:00	\N	\N
722	Buprenorphine/Naloxone (Oral Strip)	1133201	Buprenorphine	8a5edcf9-828c-4f97-b671-268ab13a8ecd	2015-10-06 00:00:00	\N	\N
723	Buprenorphine/Naloxone (Sublingual)	1133201	Buprenorphine	6cccf229-9611-4b6f-8f1b-acc8ff1ed3f8	2015-08-13 00:00:00	\N	\N
724	buPROPion (Oral Pill)	750982	Bupropion	714bd852-e9b1-4bda-8685-02f16c937222	2015-10-01 00:00:00	\N	\N
725	Bur oak pollen extract (Injectable)	40172010	bur oak pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
726	BURN JEL PLUS (Topical)	989878	Lidocaine	401023a5-6634-4c04-b6a6-55b78a9c79fe	2010-10-09 00:00:00	\N	\N
727	Burning bush pollen extract (Injectable)	40161629	burning bush pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-11-19 00:00:00	\N	\N
728	Burweed marshelder pollen extract/Rough marshelder pollen extract (Injectable)	40161637	burweed marshelder pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
729	busPIRone (Oral Pill)	733301	Buspirone	8ed30856-84d2-dd2b-04d4-b101f6030bc0	2015-09-21 00:00:00	\N	\N
730	Busulfan (Injectable)	1333357	Busulfan	03dc50f9-c7bd-4c0c-8bbb-c1216ec90c95	2008-03-13 00:00:00	\N	\N
731	Busulfan (Oral Pill)	1333357	Busulfan	bf456fc7-3a79-47f7-8acc-600b5e2f0dc2	2012-06-22 00:00:00	\N	\N
732	BUSULFEX (Injectable)	1333357	Busulfan	03dc50f9-c7bd-4c0c-8bbb-c1216ec90c95	2008-03-13 00:00:00	\N	\N
733	Butabarbital (Oral Pill)	959174	butabarbital	7883bbc0-0874-11dc-a818-0002a5d5c51b	2015-08-14 00:00:00	\N	\N
734	Butenafine (Topical)	958396	butenafine	36f09b0c-454a-4489-92be-8e6902874a74	2015-01-20 00:00:00	\N	\N
735	BUTISOL (Oral Pill)	959174	butabarbital	7883bbc0-0874-11dc-a818-0002a5d5c51b	2015-08-14 00:00:00	\N	\N
736	Butorphanol (Injectable)	1133732	Butorphanol	75d3fd4e-9dc3-8bbc-140e-0213ef135ab0	2013-08-19 00:00:00	\N	\N
737	Butorphanol (Nasal)	1133732	Butorphanol	9c069ce5-ea67-4f42-afe4-30b01b4ce24d	2015-09-24 00:00:00	\N	\N
738	BYSTOLIC (Oral Pill)	1314577	nebivolol	673f5ad2-c09b-4a89-9407-efdadd007917	2014-08-25 00:00:00	\N	\N
739	Cabergoline (Oral Pill)	1558471	cabergoline	0e2a2cb6-e453-4060-95f4-a8ce4ccecc10	2014-04-03 00:00:00	\N	\N
740	Cabozantinib (Oral Pill)	43012292	cabozantinib	1a0c3bea-c87b-4d25-bb44-5f0174da6b34	2012-12-13 00:00:00	\N	\N
741	CADUET (Oral Pill)	1332418	Amlodipine	909fad96-a941-443a-a39f-4f93607410fb	2010-03-30 00:00:00	\N	\N
742	CAFCIT (Injectable)	1134439	Caffeine	fbcd234e-57e1-4da2-a96c-e3f7b7cf6ec0	2014-05-30 00:00:00	\N	\N
743	CAFCIT (Oral Liquid)	1134439	Caffeine	fbcd234e-57e1-4da2-a96c-e3f7b7cf6ec0	2014-05-30 00:00:00	\N	\N
744	CAFERGOT (Oral Pill)	1134439	Caffeine	1c066197-dea6-4705-9b4a-8703dd564a2a	2011-04-26 00:00:00	\N	\N
745	Caffeine (Injectable)	1134439	Caffeine	cc632825-e0a4-4524-8d7d-ce926efab3d6	2015-05-07 00:00:00	\N	\N
746	Caffeine (Oral Liquid)	1134439	Caffeine	cc632825-e0a4-4524-8d7d-ce926efab3d6	2015-09-16 00:00:00	\N	\N
747	Caffeine (Oral Pill)	1134439	Caffeine	cc55f4e6-5304-4310-b3e5-f0a4e9aa5bf8	2015-10-13 00:00:00	\N	\N
748	Caffeine/Ergotamine (Oral Pill)	1134439	Caffeine	6a105e44-b558-45c1-9c91-fe1f3dfc5bd5	2015-09-04 00:00:00	\N	\N
749	Caffeine/Ergotamine (Rectal)	1134439	Caffeine	3a31ad0c-7bdd-544b-f5df-a99d04cf541c	2015-01-14 00:00:00	\N	\N
750	Caffeine/Magnesium Salicylate (Oral Pill)	1134439	Caffeine	e02a39f9-1c8c-4d38-b394-3f5b7062932c	2012-09-04 00:00:00	\N	\N
751	CAL GEST (Chewable)	19035704	Calcium Carbonate	a43184c4-d225-4539-b651-4d96535f208f	2014-08-19 00:00:00	\N	\N
752	CALADRYL CLEAR (Topical)	927478	pramoxine	fca6f08b-7fa0-4ae6-bce3-61f3bcae4332	2013-08-16 00:00:00	\N	\N
753	Calamine (Topical)	902616	Calamine	d9d6ea6f-0793-3c9d-f92c-a9e2f0bee20b	2012-07-11 00:00:00	\N	\N
754	Calamine/Menthol/Petrolatum/Zinc Oxide (Paste)	902616	Calamine	1295cfcc-5b61-481b-964b-f53ffd0cb58e	2012-03-26 00:00:00	\N	\N
755	Calamine/Menthol/Zinc Oxide (Topical)	902616	Calamine	7b52374e-1119-4145-b87b-96b7212fdc3e	2013-03-25 00:00:00	\N	\N
756	Calamine/Phenol/Zinc Oxide (Topical)	902616	Calamine	8e68efc4-4c95-41c0-9fed-32297b1b2edc	2014-04-02 00:00:00	\N	\N
757	Calamine/Pramoxine (Topical)	902616	Calamine	a042095e-a139-4c5d-8ffb-39e37da2a93a	2015-01-12 00:00:00	\N	\N
758	Calamine/Zinc Oxide (Topical)	902616	Calamine	777b0e66-1bce-4483-9dad-c46796fd6f23	2015-06-25 00:00:00	\N	\N
759	CALAZIME SKIN PROTECTANT (Paste)	902616	Calamine	1295cfcc-5b61-481b-964b-f53ffd0cb58e	2012-03-26 00:00:00	\N	\N
760	Calcipotriene (Topical)	908921	calcipotriene	21378c25-5622-8bf7-1a8c-b05940a846a0	2015-05-08 00:00:00	\N	\N
761	CALCITRENE (Topical)	908921	calcipotriene	94d4f46a-f254-4fe2-b4bd-7a533d6324fe	2012-05-14 00:00:00	\N	\N
762	Calcitriol (Injectable)	19035631	Calcitriol	406151ad-6c0a-4d66-86fc-e076df9671a3	2013-10-22 00:00:00	\N	\N
763	Calcitriol (Oral Liquid)	19035631	Calcitriol	dc293a1c-995d-40fa-ac99-68df12eb6d9e	2012-03-16 00:00:00	\N	\N
764	Calcitriol (Oral Pill)	19035631	Calcitriol	bebefb2a-7365-48e2-9681-83ed4b41e26e	2015-05-11 00:00:00	\N	\N
765	Calcitriol (Topical)	19035631	Calcitriol	a1567da9-af74-4afd-9ac5-8b53ec5d7cbf	2015-03-11 00:00:00	\N	\N
766	Calcium acetate (Oral Pill)	951469	calcium acetate	b02f8473-3220-4651-9c7f-993645f43a82	2015-09-10 00:00:00	\N	\N
767	Calcium Carbonate (Chewable)	19035704	Calcium Carbonate	21e9152c-6e83-454d-a782-00c2ced5b3fa	2015-10-01 00:00:00	\N	\N
768	Calcium Carbonate (Oral Liquid)	19035704	Calcium Carbonate	594e80a9-b2fa-4a69-ab70-c25e78b1a40d	2015-10-05 00:00:00	\N	\N
769	Calcium Carbonate (Oral Pill)	19035704	Calcium Carbonate	1cd621d0-58b9-45f7-80fb-e13ca68596a1	2014-07-03 00:00:00	\N	\N
770	Calcium Carbonate (Oral Powder)	19035704	Calcium Carbonate	88cadd90-c6f4-4229-aed4-bf3e4ce6dbf5	2014-10-17 00:00:00	\N	\N
771	Calcium Carbonate/Cholecalciferol (Oral Pill)	19035704	Calcium Carbonate	bba98e57-7056-4143-8fcd-95e25539d087	2013-05-23 00:00:00	\N	\N
772	Calcium Carbonate/Famotidine/Magnesium Hydroxide (Chewable)	19035704	Calcium Carbonate	cd787644-2809-478c-bf8f-01ab8c306d61	2015-09-23 00:00:00	\N	\N
773	Calcium Carbonate/Folic Acid/Magnesium carbonate (Oral Pill)	19035704	Calcium Carbonate	e74e25aa-2f4c-4026-bc2b-7bb21aaf6fc5	2014-08-15 00:00:00	\N	\N
774	Calcium Carbonate/Magnesium carbonate (Oral Pill)	19035704	Calcium Carbonate	af124c72-0a35-4305-abd8-2b0ebf84da08	2014-07-24 00:00:00	\N	\N
775	Calcium Carbonate/Magnesium Hydroxide (Chewable)	19035704	Calcium Carbonate	8806c912-ab83-4f45-ac78-e826bb3143d4	2014-06-19 00:00:00	\N	\N
776	Calcium Carbonate/Magnesium Hydroxide (Oral Liquid)	19035704	Calcium Carbonate	7fbc654b-a0d4-408c-bb5a-eb50b7b54382	2012-08-30 00:00:00	\N	\N
777	Calcium Carbonate/Simethicone (Chewable)	19035704	Calcium Carbonate	41d17406-3653-4889-81df-6270b7b5d3c7	2014-03-27 00:00:00	\N	\N
778	Calcium Chloride (Injectable)	19036781	Calcium Chloride	98de04ad-784f-4816-acbf-2b1ebfaa4005	2013-04-12 00:00:00	\N	\N
779	Calcium Chloride/Fibrinogen/Fibrinolysis inhibitor/Thrombin (Topical)	19036781	Calcium Chloride	e1aca067-0c96-4025-88bc-bd2345a46a30	2012-08-15 00:00:00	\N	\N
780	Calcium Chloride/Lactate/Potassium Chloride/Sodium Chloride (Injectable)	19036781	Calcium Chloride	c64bb1f7-715e-42dd-a8cb-09921cb56f23	2015-08-06 00:00:00	\N	\N
781	Calcium Chloride/Lactate/Potassium Chloride/Sodium Chloride (Irrigation)	19036781	Calcium Chloride	f09f80bf-2f8b-4420-865d-aec2d5e5cd4d	2015-10-13 00:00:00	\N	\N
782	Calcium Chloride/Potassium Chloride/Sodium Chloride (Injectable)	19036781	Calcium Chloride	76140511-686a-42c2-b3c1-32cfb71d24cb	2014-11-03 00:00:00	\N	\N
783	CALCIUM DISODIUM VERSENATE (Injectable)	43013616	Edetate Calcium	f960dbfa-b00c-4f3e-ad32-ed6a5deea831	2015-04-13 00:00:00	\N	\N
784	Calcium Gluconate (Injectable)	19037038	Calcium Gluconate	c069b9bf-a17f-4727-9eb3-a6c69af883f8	2012-01-27 00:00:00	\N	\N
785	Calcium Gluconate (Oral Pill)	19037038	Calcium Gluconate	d2239df8-199a-4c70-b56c-6ee78bb78919	2015-07-23 00:00:00	\N	\N
786	Calcium polycarbophil (Oral Pill)	940426	calcium polycarbophil	968a8b7d-b9ea-464a-8ff8-8e259f438bc3	2014-10-24 00:00:00	\N	\N
787	CALDECORT (Topical)	975125	Hydrocortisone	258723cf-d72e-49ee-8eaf-03fc00fa4a7c	2010-10-09 00:00:00	\N	\N
788	CALDESENE (Topical)	1036157	Starch	9f12dee2-7afa-45e9-a729-0fd42bb77715	2010-10-09 00:00:00	\N	\N
789	CALDOLOR (Injectable)	1177480	Ibuprofen	1eaa7790-f1a1-4f51-b10a-cbbaf033f684	2014-03-28 00:00:00	\N	\N
790	Calfactant (Inhalant)	19089891	calfactant	315c128a-272d-4c57-bfbe-1a8b3402af08	2011-07-22 00:00:00	\N	\N
791	California black walnut pollen extract (Injectable)	40161146	California black walnut pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
792	California mugwort pollen extract (Injectable)	40169509	California mugwort pollen extract	02de3b96-7daa-4776-8e2e-c21cf282f091	2010-01-07 00:00:00	\N	\N
793	CALMOL (Rectal)	951112	cocoa butter	5516f800-d3fa-4b90-a3eb-c0bdf3183b9b	2010-10-09 00:00:00	\N	\N
794	CALMOSEPTINE OINTMENT (Topical)	901656	Menthol	0e4d23b8-bb10-4b91-ace5-fe41b914004a	2015-09-14 00:00:00	\N	\N
795	CALPHRON (Oral Pill)	951469	calcium acetate	86f2e3d2-dbe3-400b-91cf-a4bf41db1342	2014-11-03 00:00:00	\N	\N
796	CAMBIA (Oral Liquid)	1124300	Diclofenac	d7335594-50c9-4ae2-a3e3-b9a375187b62	2012-04-02 00:00:00	\N	\N
797	CAMPATH (Injectable)	1312706	alemtuzumab	4f5f7255-7abc-4328-bd1a-ceaf139ef3e0	2014-10-21 00:00:00	\N	\N
798	CAMPHO-PHENIQUE (Topical)	938205	Camphor	0f888d89-b241-4a51-e054-00144ff8d46c	2015-02-20 00:00:00	\N	\N
799	Camphor (Inhalant)	938205	Camphor	007909d6-7c4b-47f9-bc4c-514bda647651	2014-04-01 00:00:00	\N	\N
800	Camphor (Topical)	938205	Camphor	36edeed8-894b-4f49-bb9a-9b43181b4906	2014-10-29 00:00:00	\N	\N
801	Camphor/Dimethicone/Menthol/Phenol (Topical)	938205	Camphor	63300820-80ca-432f-b86d-ef15d878671b	2012-11-15 00:00:00	\N	\N
802	Camphor/Eucalyptus oil/Menthol (Topical)	938205	Camphor	4cd2f751-e072-4f4e-b059-ed1dfcc60c6b	2015-06-09 00:00:00	\N	\N
803	Camphor/Menthol (Topical)	938205	Camphor	f406161e-a9c4-47d1-8b21-93b1b7938063	2015-08-03 00:00:00	\N	\N
804	Camphor/Menthol/Methyl salicylate (Topical)	938205	Camphor	0005e125-fbf2-4f90-8960-99e00250fc20	2015-05-29 00:00:00	\N	\N
805	Camphor/Menthol/Methyl salicylate (Transdermal)	938205	Camphor	47083271-4584-445a-be2d-c80b34503cc0	2015-09-08 00:00:00	\N	\N
806	Camphor/Menthol/Petrolatum (Topical)	938205	Camphor	00bd405f-c1c2-402d-bc2e-fa25c8ffaa25	2013-01-24 00:00:00	\N	\N
807	Camphor/Phenol (Topical)	938205	Camphor	0d914664-f8d4-2ff7-e054-00144ff88e88	2015-02-20 00:00:00	\N	\N
808	CAMPRAL (Oral Pill)	19043959	acamprosate	fe6f754f-62b4-4c86-805d-221332409516	2014-08-20 00:00:00	\N	\N
809	CAMPTOSAR (Injectable)	1367268	irinotecan	f2f20b37-8bd4-4e8a-b596-be80b48ca2f1	2015-02-02 00:00:00	\N	\N
810	Canadian bluegrass pollen extract (Injectable)	40227802	Canadian bluegrass pollen extract	c7d383a6-94b8-4101-8a4c-fa7747a21468	2009-11-19 00:00:00	\N	\N
811	Canagliflozin/metFORMIN (Oral Pill)	43526465	canagliflozin	6868666b-c25e-40d1-9d1f-306bbe9390c1	2015-09-17 00:00:00	\N	\N
812	CANASA (Rectal)	968426	mesalamine	357e0e6b-cfbd-454c-82d7-cfc460dc0d68	2010-08-25 00:00:00	\N	\N
813	Candesartan (Oral Pill)	1351557	candesartan	a67f4f53-76c7-4239-9dd6-fef8e8019e9a	2015-03-12 00:00:00	\N	\N
814	Candesartan/Hydrochlorothiazide (Oral Pill)	1351557	candesartan	f3c4f7ed-e667-4528-a675-b032c2a4425d	2015-05-19 00:00:00	\N	\N
815	CAPACET (Oral Pill)	1125315	Acetaminophen	f3a37ce1-5082-4ac4-88a2-c8fadbd0b7b3	2013-11-27 00:00:00	\N	\N
816	CAPASTAT (Injectable)	19026710	Capreomycin	808e4421-2b9c-41e1-a82c-39256b112ae8	2011-06-03 00:00:00	\N	\N
817	Capecitabine (Oral Pill)	1337620	capecitabine	2777b481-7d7f-461a-b5e0-c09ce2990c34	2015-10-01 00:00:00	\N	\N
818	CAPEX (Shampoo)	996541	fluocinolone	a52763d0-7024-48a8-9cca-3127333dfb01	2010-11-02 00:00:00	\N	\N
819	Capreomycin (Injectable)	19026710	Capreomycin	808e4421-2b9c-41e1-a82c-39256b112ae8	2011-06-03 00:00:00	\N	\N
820	Capsaicin (Topical)	939881	Capsaicin	345c9159-0efe-436b-9068-3b717678936b	2015-08-26 00:00:00	\N	\N
821	Capsaicin (Transdermal)	939881	Capsaicin	ef5373aa-9857-4d01-95af-2d7716e54ae4	2014-11-06 00:00:00	\N	\N
822	Capsaicin/Lidocaine/Menthol/Methyl salicylate (Topical)	939881	Capsaicin	85066887-44d0-4a4a-adee-670073e4b22c	2014-03-26 00:00:00	\N	\N
823	Capsaicin/Lidocaine/Menthol/Methyl salicylate (Transdermal)	939881	Capsaicin	2587a121-2544-4409-92b3-5c4049e53161	2014-06-04 00:00:00	\N	\N
824	Capsaicin/Menthol (Topical)	939881	Capsaicin	0096cca7-5671-4717-bc92-12170c1bcf2f	2014-04-22 00:00:00	\N	\N
825	Capsaicin/Menthol (Transdermal)	939881	Capsaicin	59bd46fa-9460-416d-b4ef-6beeddda96cf	2015-10-01 00:00:00	\N	\N
826	Capsaicin/Menthol/Methyl salicylate (Topical)	939881	Capsaicin	fd7e50c9-5ed4-45d3-bc8d-c5583ca436be	2015-04-16 00:00:00	\N	\N
827	Capsaicin/Menthol/Methyl salicylate (Transdermal)	939881	Capsaicin	a9343d24-8435-4a51-98a2-b7976cd369ab	2011-12-14 00:00:00	\N	\N
828	Captopril (Oral Pill)	1340128	Captopril	851ff660-e6a4-48f8-a6d0-4c10dbb01836	2015-08-10 00:00:00	\N	\N
829	Captopril/Hydrochlorothiazide (Oral Pill)	1340128	Captopril	d826812e-ede7-49e7-8384-29ec5b142ef3	2014-05-21 00:00:00	\N	\N
830	CAPZASIN QUICK RELIEF (Topical)	939881	Capsaicin	d6c313a3-8dc6-4231-95b6-ac9399e1c1be	2010-10-09 00:00:00	\N	\N
831	CAPZASIN-HP (Topical)	939881	Capsaicin	345c9159-0efe-436b-9068-3b717678936b	2010-10-09 00:00:00	\N	\N
832	CAPZASIN-P (Topical)	939881	Capsaicin	605703e8-b353-40df-9ac4-67a76b866d63	2010-10-09 00:00:00	\N	\N
833	CARAC (Topical)	955632	Fluorouracil	8379f1db-4255-4285-abd3-8ecdcaf03372	2014-04-30 00:00:00	\N	\N
834	CARAFATE (Oral Liquid)	1036228	Sucralfate	0fb67b1c-b4c0-46f2-8a81-df1510e006aa	2014-05-06 00:00:00	\N	\N
835	Carbachol (Injectable)	940183	Carbachol	f28d7a56-e079-4a8b-ad81-9a97c780de67	2011-07-18 00:00:00	\N	\N
836	carBAMazepine (Chewable)	740275	Carbamazepine	e36ece79-544b-43b2-8cf9-ca9861b071b5	2015-05-20 00:00:00	\N	\N
837	carBAMazepine (Oral Liquid)	740275	Carbamazepine	536811ab-308b-4866-9185-9e4149483512	2011-07-19 00:00:00	\N	\N
838	carBAMazepine (Oral Pill)	740275	Carbamazepine	ce5aec7a-e161-46bf-8fc0-afb41689e59a	2015-05-20 00:00:00	\N	\N
839	Carbamide peroxide (Mucosal)	958999	carbamide peroxide	086a0b82-e947-41c9-89e7-ba06483960c9	2012-07-12 00:00:00	\N	\N
840	Carbamide peroxide (Otic)	958999	carbamide peroxide	dfd2a0a4-0cb6-4e19-addc-b9db2488dcbf	2015-07-23 00:00:00	\N	\N
841	CARBASTAT (Injectable)	940183	Carbachol	048af9c6-4866-4500-9914-cd7071a19b63	2006-10-05 00:00:00	\N	\N
842	CARBATUSS SYRUP (Oral Liquid)	1140640	carbetapentane	8d886ec3-8ccf-4fd0-84d6-de9e858da0fb	2011-03-10 00:00:00	\N	\N
843	Carbenicillin (Oral Pill)	1740546	Carbenicillin	02010995-9826-4a67-945b-f3022e6081df	2007-09-14 00:00:00	\N	\N
844	Carbetapentane/guaiFENesin (Oral Liquid)	1140640	carbetapentane	c3a1a47a-27ce-4565-9d6a-a2d8314357a6	2010-07-20 00:00:00	\N	\N
845	Carbetapentane/guaiFENesin/Phenylephrine (Oral Liquid)	1140640	carbetapentane	8d886ec3-8ccf-4fd0-84d6-de9e858da0fb	2011-03-10 00:00:00	\N	\N
846	Carbidopa (Oral Pill)	740560	Carbidopa	ff8e105b-7415-42d4-bbb2-b36cfb8945a5	2015-05-14 00:00:00	\N	\N
847	Carbidopa/Entacapone/Levodopa (Oral Pill)	740560	Carbidopa	dabb7f5d-03b3-4d46-951a-e41a1f8d69cc	2015-05-11 00:00:00	\N	\N
848	Carbidopa/Levodopa (Oral Disintegrating)	740560	Carbidopa	d26b56fa-d521-461b-a619-40b65862b644	2014-12-16 00:00:00	\N	\N
849	Carbidopa/Levodopa (Oral Pill)	740560	Carbidopa	a15f5833-42f0-4890-9596-992eef0846e5	2015-10-01 00:00:00	\N	\N
850	Carbidopa/Levodopa XR (Oral Pill)	740560	Carbidopa	043db807-8381-4df8-b3a3-825988d63ef5	2015-05-13 00:00:00	\N	\N
851	Carbinoxamine (Oral Liquid)	1141018	carbinoxamine	748c233b-6ab9-42d0-89ab-e7ead30f7947	2015-09-28 00:00:00	\N	\N
852	Carbinoxamine (Oral Pill)	1141018	carbinoxamine	3f4f633c-5c5d-4d52-abb8-dfa2896b40d2	2015-09-28 00:00:00	\N	\N
853	CARBOCAINE (Injectable)	702774	Mepivacaine	f00557a9-ec79-4c54-9d06-c71d2a8aff2c	2012-06-11 00:00:00	\N	\N
854	CARBOCAINE WITH NEOCOBEFRIN (Injectable)	19015395	Levonordefrin	f00557a9-ec79-4c54-9d06-c71d2a8aff2c	2012-06-11 00:00:00	\N	\N
855	Carbon Dioxide (Inhalant)	19046180	Carbon Dioxide	f4cf5b1b-ca57-4799-ae51-130f6fd5d058	2014-05-13 00:00:00	\N	\N
856	CARBOplatin (Injectable)	1344905	Carboplatin	806736d3-215a-4df5-8187-97f2161e5a53	2015-10-13 00:00:00	\N	\N
857	Carboxymethylcellulose (Ophthalmic)	949279	Carboxymethylcellulose	cd467181-9d56-4b11-9826-15b5357d0689	2015-02-27 00:00:00	\N	\N
858	Carboxymethylcellulose/Glycerin (Ophthalmic)	949279	Carboxymethylcellulose	37e99aa8-02d6-4efb-a862-90bc7fcd5ca5	2015-09-23 00:00:00	\N	\N
859	Carboxymethylcellulose/Hypromellose (Ophthalmic)	949279	Carboxymethylcellulose	c9dcab71-3ec8-45ff-83f0-132c6c6e63bd	2012-10-23 00:00:00	\N	\N
860	CARDENE (Injectable)	1318137	Nicardipine	0d58f812-37bf-439f-b3f2-c31f8eefe22e	2015-07-21 00:00:00	\N	\N
861	CARDIZEM (Oral Pill)	1328165	Diltiazem	f3e7ecef-f360-4987-a4f5-933214130ab2	2015-01-23 00:00:00	\N	\N
862	CARIMUNE (Injectable)	19117912	Immunoglobulin G	610b905a-50d3-48f0-919a-69cc99aab5a8	2013-10-18 00:00:00	\N	\N
863	Carisoprodol (Oral Pill)	749910	Carisoprodol	cfef5764-49ff-4ce2-84fe-5e421e4b0202	2015-09-23 00:00:00	\N	\N
864	Carmustine (Implant)	1350066	Carmustine	783ec80b-95d7-44c7-8b90-fa7394f50f67	2010-05-14 00:00:00	\N	\N
865	Carmustine (Injectable)	1350066	Carmustine	d6cbb63c-e0b1-43ee-ad6f-408da0772079	2013-12-27 00:00:00	\N	\N
866	CARNITOR (Oral Liquid)	1553610	Levocarnitine	b2cbc620-59fd-47b6-9e4b-7e3e31533a1c	2015-07-06 00:00:00	\N	\N
867	CARNITOR (Oral Pill)	1553610	Levocarnitine	d2133bc3-9c15-48bd-8b16-b8995a6a14cd	2015-07-02 00:00:00	\N	\N
868	Carteolol (Ophthalmic)	950370	Carteolol	571fe550-399d-4296-835c-37aa1ab9b409	2015-09-28 00:00:00	\N	\N
869	CARTERS LITTLE PILLS (Oral Pill)	924939	Bisacodyl	4ee15f4b-070e-4f6a-a3ff-dbb5136f8db6	2012-02-07 00:00:00	\N	\N
870	Carvedilol (Oral Pill)	1346823	carvedilol	c3f7f2f7-7309-4825-b868-13c6ef89fe86	2015-10-01 00:00:00	\N	\N
871	CASTELLANI PAINT (Topical)	923540	phenol	bf6845e5-16f3-4828-bfbf-2bc2596a02f3	2015-09-02 00:00:00	\N	\N
872	Castor Oil (Oral Liquid)	950933	Castor Oil	5fe0f114-67ae-44c5-906f-60e49a9a8475	2014-09-26 00:00:00	\N	\N
873	Castor Oil/Peruvian balsam (Topical)	950933	Castor Oil	6bf98ba3-d9f6-4872-8220-a1b403226223	2012-10-31 00:00:00	\N	\N
874	Cat Hair Extract (Injectable)	19095690	Cat Hair Extract	6f9e5a38-738c-470f-b9cf-4fcef6bc7f01	2012-01-19 00:00:00	\N	\N
875	Cat skin extract (Injectable)	40161698	cat skin extract	01a914b7-51b5-4aab-952f-2eae56d25e9c	2009-05-20 00:00:00	\N	\N
876	CATAFLAM (Oral Pill)	1124300	Diclofenac	1582c050-925a-4af8-a44f-948017946ae6	2011-03-18 00:00:00	\N	\N
877	CATAPRES (Oral Pill)	1398937	Clonidine	d7f569dc-6bed-42dc-9bec-940a9e6b090d	2012-06-14 00:00:00	\N	\N
878	CAVERJECT (Injectable)	1381504	Alprostadil	a295fc1e-d82c-4f44-bc2d-a552bf594c98	2015-07-27 00:00:00	\N	\N
879	CAVILON DURABLE BARRIER CREAM (Topical)	916662	dimethicone	4cc117f2-65be-4c7b-b182-0417acd5dc41	2012-12-17 00:00:00	\N	\N
880	CAVIRINSE (Mouthwash)	19069022	Sodium Fluoride	e061e50c-cea2-4aea-b59c-3916829b253a	2010-12-08 00:00:00	\N	\N
881	CEDAX (Oral Liquid)	1749083	ceftibuten	2dd58c88-142f-41ad-bc31-0a4fff074970	2015-09-03 00:00:00	\N	\N
882	CEDAX (Oral Pill)	1749083	ceftibuten	2dd58c88-142f-41ad-bc31-0a4fff074970	2010-01-15 00:00:00	\N	\N
883	CEENU (Oral Pill)	1391846	Lomustine	17893de9-7d54-448c-9fca-d10642046d14	2012-12-07 00:00:00	\N	\N
884	Cefaclor (Oral Liquid)	1768849	Cefaclor	9f919252-7a87-4386-a64c-5d8213f7e881	2012-09-25 00:00:00	\N	\N
885	Cefaclor (Oral Pill)	1768849	Cefaclor	b093ec49-da83-40e3-8e1c-8a64b7f45d27	2013-06-24 00:00:00	\N	\N
886	Cefadroxil (Oral Liquid)	1769535	Cefadroxil	30bb3686-87b4-4676-9ff5-e20deb8bff9d	2014-05-30 00:00:00	\N	\N
887	Cefadroxil (Oral Pill)	1769535	Cefadroxil	bda86975-8c2f-4c4e-9a4c-a1a959f9336a	2015-08-17 00:00:00	\N	\N
888	ceFAZolin (Injectable)	1771162	Cefazolin	d3fe1e18-9e3e-4797-9fb4-275900fa9ff3	2015-07-01 00:00:00	\N	\N
889	Cefdinir (Oral Liquid)	1796458	cefdinir	542fb9ea-f289-43c3-81fa-555a632e6a45	2015-03-09 00:00:00	\N	\N
890	Cefdinir (Oral Pill)	1796458	cefdinir	77e061e8-d3e2-4955-9f65-59510b5afc70	2015-08-25 00:00:00	\N	\N
891	Cefditoren (Oral Pill)	1747005	cefditoren	d5050d0e-81d1-4707-a38a-e80de2aebf09	2013-06-06 00:00:00	\N	\N
892	Cefixime (Chewable)	1796435	Cefixime	5007152e-a679-4e85-ac3f-c46087812774	2014-09-11 00:00:00	\N	\N
893	Cefixime (Oral Liquid)	1796435	Cefixime	d0fd45bd-7d52-4fa6-a5f7-f46d5651ffa2	2015-04-23 00:00:00	\N	\N
894	Cefixime (Oral Pill)	1796435	Cefixime	d0fd45bd-7d52-4fa6-a5f7-f46d5651ffa2	2014-09-11 00:00:00	\N	\N
895	CEFIZOX (Injectable)	1777254	Ceftizoxime	0013824b-6aee-4da4-affd-35bc6bf19d91	2007-08-06 00:00:00	\N	\N
896	CEFOTAN (Injectable)	1774932	Cefotetan	56912a83-4cba-4461-d983-3a0656515458	2007-04-20 00:00:00	\N	\N
897	Cefotaxime (Injectable)	1774470	Cefotaxime	ef1a6dc6-bc3d-4f09-8f92-7ff328f56561	2015-07-06 00:00:00	\N	\N
898	cefoTEtan (Injectable)	1774932	Cefotetan	c6b8667e-8bb6-ea58-a969-2f74458bc611	2015-07-14 00:00:00	\N	\N
899	cefOXitin (Injectable)	1775741	Cefoxitin	6a4a2afa-4f00-41d4-bd6d-baa0a95f6929	2012-03-14 00:00:00	\N	\N
900	Cefpodoxime (Oral Liquid)	1749008	cefpodoxime	5310de78-22c3-4bee-9956-854e767b6bef	2014-04-21 00:00:00	\N	\N
901	Cefpodoxime (Oral Pill)	1749008	cefpodoxime	8b7f7043-5bfb-47a5-80cb-4f3f65358dff	2014-12-04 00:00:00	\N	\N
902	Cefprozil (Oral Liquid)	1738366	cefprozil	3ec55c0a-1456-412e-972f-352b3135c8f2	2015-08-24 00:00:00	\N	\N
903	Cefprozil (Oral Pill)	1738366	cefprozil	75d57e35-ffeb-4d88-8dba-5458e284fd82	2013-08-21 00:00:00	\N	\N
904	cefTAZidime (Injectable)	1776684	Ceftazidime	22d6534c-4488-48a1-8d78-e2fb908259de	2015-02-17 00:00:00	\N	\N
905	Ceftibuten (Oral Liquid)	1749083	ceftibuten	2dd58c88-142f-41ad-bc31-0a4fff074970	2010-01-15 00:00:00	\N	\N
906	Ceftibuten (Oral Pill)	1749083	ceftibuten	2dd58c88-142f-41ad-bc31-0a4fff074970	2010-01-15 00:00:00	\N	\N
907	Ceftizoxime (Injectable)	1777254	Ceftizoxime	3574df06-fec5-4888-8080-3b817addfb02	2007-08-06 00:00:00	\N	\N
908	cefTRIAXone (Injectable)	1777806	Ceftriaxone	0faaee8c-30f6-4715-a9b6-7978da7c1ec8	2015-08-20 00:00:00	\N	\N
909	Cefuroxime (Injectable)	1778162	Cefuroxime	98ea197c-b3ff-47bc-8d0f-fce91b539959	2015-05-12 00:00:00	\N	\N
910	Cefuroxime (Oral Liquid)	1778162	Cefuroxime	135e2dfc-eb47-4d04-a903-a081d36c267e	2013-08-21 00:00:00	\N	\N
911	Cefuroxime (Oral Pill)	1778162	Cefuroxime	61d3f51b-a8ed-4be5-849c-4bf653538d3e	2015-10-05 00:00:00	\N	\N
912	CeleBREX (Oral Pill)	1118084	celecoxib	8d52185d-421f-4e34-8db7-f7676db2a226	2015-05-05 00:00:00	\N	\N
913	Celecoxib (Oral Pill)	1118084	celecoxib	8d52185d-421f-4e34-8db7-f7676db2a226	2015-08-24 00:00:00	\N	\N
914	CELESTONE SOLUSPAN (Injectable)	920458	Betamethasone	2fb9fb11-d4ab-4c19-b5d1-c0177b3d8ef6	2015-05-20 00:00:00	\N	\N
915	CeleXA (Oral Pill)	797617	Citalopram	6c96373f-6744-49d4-aec5-3720bc993fab	2010-12-21 00:00:00	\N	\N
916	CELLCEPT (Oral Pill)	19003999	mycophenolate mofetil	81ca6530-76d1-46f1-9bf8-0ffac79d2523	2015-03-19 00:00:00	\N	\N
917	CENESTIN (Oral Pill)	1596779	"synthetic conjugated estrogens, A"	410f9433-98ed-4c3f-abb1-2386296d2f72	2015-08-19 00:00:00	\N	\N
918	CENOLATE (Injectable)	19011773	Ascorbic Acid	af67a2f3-65b7-4a6e-9a51-315a280f976b	2007-11-01 00:00:00	\N	\N
919	CENTANY (Topical)	951511	Mupirocin	ae3defca-06d5-49ac-8a27-be5c4e9304d1	2011-02-02 00:00:00	\N	\N
920	CENTUSSIN (Oral Liquid)	1130863	Brompheniramine	315a70bc-bfd8-471d-9379-d2746823537d	2010-07-20 00:00:00	\N	\N
921	CEO-TWO (Rectal)	19086788	Potassium bitartrate	d868de56-ac3b-4e44-8aa5-031661f0ac25	2015-03-12 00:00:00	\N	\N
922	CEPACOL (Oral Disintegrating)	917006	Benzocaine	a0e52795-e4ec-4205-8862-a51a2b2a7ae1	2010-10-09 00:00:00	\N	\N
923	CEPACOL (Oral Lozenge)	917006	Benzocaine	48ce5553-5275-461b-8fe5-7f2bde197741	2013-10-18 00:00:00	\N	\N
924	CEPACOL ANTIBACTERIAL MOUTHWASH (Mouthwash)	989301	Cetylpyridinium	7c19eba6-3ebd-497f-9066-6152b72eafdd	2013-06-11 00:00:00	\N	\N
925	CEPACOL DUAL RELIEF (Mucosal)	917006	Benzocaine	45561e94-2b54-4c19-be3e-b1949e1a5bbc	2012-07-17 00:00:00	\N	\N
926	CEPACOL SENSATIONS COOLING (Oral Lozenge)	917006	Benzocaine	968f2322-fa9a-4ef8-baab-49576713618c	2015-04-17 00:00:00	\N	\N
927	CEPACOL SORE THROAT FROM POST NASAL DRIP (Oral Lozenge)	901656	Menthol	599912f1-f888-4528-a676-78ef9a15b128	2010-10-09 00:00:00	\N	\N
928	CEPACOL SORE THROAT PAIN RELIEF (Oral Lozenge)	917006	Benzocaine	17d32d80-520a-4e32-9b45-1e296add9924	2015-04-01 00:00:00	\N	\N
929	CEPACOL SORE THROAT PLUS COATING (Oral Lozenge)	917006	Benzocaine	634a8e8a-4a7b-4eed-ba34-b06acb9c6525	2010-10-09 00:00:00	\N	\N
930	CEPACOL SORE THROAT PLUS COUGH (Oral Lozenge)	917006	Benzocaine	d25f736d-07ee-40cf-bc16-0f2c231eecd1	2014-09-17 00:00:00	\N	\N
931	CEPASTAT (Oral Lozenge)	923540	phenol	6f4402aa-3f6e-4469-b512-868dba734d2b	2010-10-09 00:00:00	\N	\N
932	Cephalexin (Oral Liquid)	1786621	Cephalexin	c408de52-a15e-49ec-8bcd-eede240e5225	2015-06-12 00:00:00	\N	\N
933	Cephalexin (Oral Pill)	1786621	Cephalexin	937d6426-aed3-445b-9e9d-f30fa2f27a29	2015-09-17 00:00:00	\N	\N
934	CEPROTIN (Injectable)	42801108	Protein C	926914a9-78b2-40ea-b37d-2a55c09bf275	2015-08-24 00:00:00	\N	\N
935	CERDELGA (Oral Pill)	45775782	eliglustat	819f828a-b888-4e46-83fc-94d774a28a83	2014-09-03 00:00:00	\N	\N
936	CEREZYME (Injectable)	1348407	imiglucerase	df60f030-866b-4374-a31f-8ae3f6b45c38	2012-12-17 00:00:00	\N	\N
937	CERISA WASH (Soap)	1036252	Sulfacetamide	00278dd5-328f-4f4c-992c-a02ecde24e51	2010-07-19 00:00:00	\N	\N
938	CERVIDIL (Implant)	1329415	Dinoprostone	f1391c7c-233e-44d8-8838-36cc12f01044	2015-09-29 00:00:00	\N	\N
939	CESAMET (Oral Pill)	913440	nabilone	bb582d64-0f51-11df-8a39-0800200c9a66	2015-05-15 00:00:00	\N	\N
940	CETACAINE (Topical)	917006	Benzocaine	af1773c5-5d5b-4278-b551-30ad2df6d5b5	2015-10-02 00:00:00	\N	\N
941	CETAFEN (Oral Pill)	1125315	Acetaminophen	207cf327-b35c-405c-979e-af25183e6ae5	2012-11-14 00:00:00	\N	\N
942	CETAMIDE (Ophthalmic)	1036252	Sulfacetamide	5a5d8fee-b42a-4f0c-a508-75c7c71bedb4	2008-03-13 00:00:00	\N	\N
943	Cetirizine (Chewable)	1149196	Cetirizine	dcc69bbe-e24c-4acf-8746-559ac1600dda	2015-05-12 00:00:00	\N	\N
944	Cetirizine (Oral Liquid)	1149196	Cetirizine	b088ac07-3246-434b-98cb-8759e9109fb0	2015-10-01 00:00:00	\N	\N
945	Cetirizine (Oral Pill)	1149196	Cetirizine	91fe3ab8-c155-4482-9f06-f029d3563aad	2015-09-21 00:00:00	\N	\N
946	CETRAXAL (Otic)	1797513	Ciprofloxacin	213b339a-75e0-4b1d-9052-8ee82a65d713	2009-06-17 00:00:00	\N	\N
947	Cetrorelix (Injectable)	1503983	cetrorelix	aca7768e-28a7-4027-b1d8-e66247665f79	2014-05-14 00:00:00	\N	\N
948	CETROTIDE (Injectable)	1503983	cetrorelix	aca7768e-28a7-4027-b1d8-e66247665f79	2014-05-14 00:00:00	\N	\N
949	Cetylpyridinium (Mouthwash)	989301	Cetylpyridinium	5db380e6-f2f2-434d-b2d7-c19fedb6e821	2015-09-14 00:00:00	\N	\N
950	Cetylpyridinium (Mucosal)	989301	Cetylpyridinium	48b1f5b8-69b1-4d50-960b-733151beef91	2012-09-25 00:00:00	\N	\N
951	Cevimeline (Oral Pill)	954819	cevimeline	0679dd4c-fece-4c6d-b273-2c62237e8973	2015-03-31 00:00:00	\N	\N
952	Chaetomium globosum extract (Injectable)	40161167	Chaetomium globosum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
953	CHANTIX (Oral Pill)	780442	varenicline	3e689dae-5058-4556-be14-df50e2803208	2014-09-29 00:00:00	\N	\N
954	CHEMET (Oral Pill)	1728909	Succimer	62035612-9505-3a3f-1ac8-e2dbd711d24e	2013-08-29 00:00:00	\N	\N
955	CHENODAL (Oral Pill)	19052447	Chenodeoxycholate	b8b4539b-31d1-40cb-b284-86cf8b16522a	2010-01-08 00:00:00	\N	\N
956	Chenodeoxycholate (Oral Pill)	19052447	Chenodeoxycholate	bbb86251-9423-40e6-9117-9511ab5fbf63	2010-02-02 00:00:00	\N	\N
957	CHERATUSSIN (Oral Liquid)	1201620	Codeine	532d83c7-7e01-4777-927c-cf01db6847e5	2013-07-09 00:00:00	\N	\N
958	Chesnut oak pollen extract (Injectable)	40172048	chesnut oak pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
959	CHILDREN'S NYQUIL COLD AND COUGH (Oral Liquid)	1192710	Chlorpheniramine	e67ae132-d9c7-4a56-b6f7-562a2bd4747f	2014-10-02 00:00:00	\N	\N
960	CHIRHOSTIM (Injectable)	19084212	Human Secretin	b4dfe70f-0a86-4488-9ba1-dcd8f86cbfcd	2007-08-15 00:00:00	\N	\N
961	Chlophedianol/Chlorcyclizine (Oral Liquid)	1150886	chlophedianol	c588736a-250b-4fc6-b221-b4b51052b032	2013-03-01 00:00:00	\N	\N
962	Chlophedianol/Chlorpheniramine/Phenylephrine (Oral Liquid)	1150886	chlophedianol	c032041e-fa67-4ef8-aa5a-82d5b0432178	2012-04-03 00:00:00	\N	\N
963	Chlophedianol/Chlorpheniramine/Phenylephrine (Oral Pill)	1150886	chlophedianol	7c682422-a719-4b96-a7f4-a5733d655e38	2013-03-12 00:00:00	\N	\N
964	Chlophedianol/Dexbrompheniramine (Oral Liquid)	1150886	chlophedianol	d046f4ba-5753-4ed5-a924-0b66fd116781	2014-10-02 00:00:00	\N	\N
965	Chlophedianol/Dexbrompheniramine/Pseudoephedrine (Oral Liquid)	1150886	chlophedianol	43610aaa-8b94-40d5-ae09-3d75bd2317c8	2014-04-17 00:00:00	\N	\N
966	Chlophedianol/Dexchlorpheniramine/Pseudoephedrine (Oral Liquid)	1150886	chlophedianol	8c34580b-fd41-4710-91dc-bdcbefa63cf0	2015-08-24 00:00:00	\N	\N
967	Chlophedianol/guaiFENesin (Oral Liquid)	1150886	chlophedianol	1021efb8-27c6-42f7-b3ae-84b6cb056569	2011-11-29 00:00:00	\N	\N
968	Chlophedianol/guaiFENesin/Phenylephrine (Oral Liquid)	1150886	chlophedianol	2e4abee4-58dc-45b7-a91c-68dea307c327	2011-10-20 00:00:00	\N	\N
969	Chlophedianol/Phenylephrine/Pyrilamine (Oral Liquid)	1150886	chlophedianol	c767a626-a3ce-490c-a511-00749784acab	2012-02-14 00:00:00	\N	\N
970	Chlophedianol/Pseudoephedrine (Oral Liquid)	1150886	chlophedianol	cd95ea40-5461-4435-bec1-979a66d62944	2010-10-09 00:00:00	\N	\N
971	Chlophedianol/Pyrilamine (Oral Liquid)	1150886	chlophedianol	e2bca40f-9c27-ec8b-2ff0-ef9847ba2037	2014-12-08 00:00:00	\N	\N
972	Chlophedianol/Thonzylamine (Oral Liquid)	1150886	chlophedianol	d219ff56-bf03-4a5f-9100-7c6d07c972dd	2015-02-23 00:00:00	\N	\N
973	CHLOR-TRIMETON (Oral Pill)	1192710	Chlorpheniramine	883a0a71-c9fb-44fd-9f2c-591d7e17c973	2013-07-24 00:00:00	\N	\N
974	Chlorambucil (Oral Pill)	1390051	Chlorambucil	967ed3ff-d99b-41e8-b768-dfb586d3d9a6	2012-06-22 00:00:00	\N	\N
975	Chloramphenicol (Injectable)	990069	Chloramphenicol	08c16a42-1ad4-400f-b1b0-75303eb86713	2010-09-13 00:00:00	\N	\N
976	Chloramphenicol (Ophthalmic)	990069	Chloramphenicol	698aaa0a-9fd3-40c2-ec93-0dc2170a75ba	2008-03-13 00:00:00	\N	\N
977	CHLORAPREP ONE-STEP (Topical)	1790812	Chlorhexidine	8a4da72e-47bc-454b-b020-f23dcd4bb692	2015-09-18 00:00:00	\N	\N
978	CHLORASEPTIC (Oral Lozenge)	917006	Benzocaine	7c161a17-cf82-4de3-8348-888c040df0f9	2013-04-17 00:00:00	\N	\N
979	CHLORASEPTIC MAX SPRAY (Mucosal)	961145	Glycerin	882c940c-b3c3-4aa4-8d64-e4260f066ff4	2013-03-05 00:00:00	\N	\N
980	CHLORASEPTIC SORE THROAT (Oral Lozenge)	917006	Benzocaine	5815a5e4-9b84-43bc-bbf3-4b85596e43d6	2010-11-17 00:00:00	\N	\N
981	CHLORASEPTIC SORE THROAT + COUGH (Oral Lozenge)	917006	Benzocaine	6b1a50d0-be54-4fcb-b5e2-b47abf3555c0	2010-11-16 00:00:00	\N	\N
982	CHLORASEPTIC SPRAY (Mucosal)	923540	phenol	a197fab2-70ce-4a6c-9add-29d7368a75c5	2013-03-05 00:00:00	\N	\N
983	Chlorcyclizine/Codeine (Oral Liquid)	990413	chlorcyclizine	aa5a37d5-1ab7-40a4-a25f-2094bb46bfe3	2012-09-28 00:00:00	\N	\N
984	Chlorcyclizine/Codeine/Pseudoephedrine (Oral Liquid)	990413	chlorcyclizine	9d1d42e4-9d69-4360-a057-81f909133880	2012-01-10 00:00:00	\N	\N
985	Chlorcyclizine/Phenylephrine (Chewable)	990413	chlorcyclizine	70f9d9c5-6204-4ddc-be82-d6c9e59d70e5	2011-11-25 00:00:00	\N	\N
986	Chlorcyclizine/Phenylephrine (Oral Liquid)	990413	chlorcyclizine	5585cf36-d7e7-40ce-982e-e8c6a58e85d1	2013-01-08 00:00:00	\N	\N
987	Chlorcyclizine/Pseudoephedrine (Oral Liquid)	990413	chlorcyclizine	4e1bd76c-3fd8-4372-907f-6b799d67cfbb	2012-04-11 00:00:00	\N	\N
988	Chlorcyclizine/Pseudoephedrine (Oral Pill)	990413	chlorcyclizine	ccedbc38-2479-4c35-9f86-a9f29bcfab3f	2012-01-09 00:00:00	\N	\N
989	chlordiazePOXIDE (Oral Pill)	990678	Chlordiazepoxide	b11a0582-eb80-4d60-914e-dc8e84177869	2015-02-10 00:00:00	\N	\N
990	chlordiazePOXIDE/Clidinium (Oral Pill)	990678	Chlordiazepoxide	e8e41a74-6816-4b9a-9905-d072e6e4cfa8	2015-02-17 00:00:00	\N	\N
991	Chlorhexidine (Implant)	1790812	Chlorhexidine	c40ab6ac-8987-42d2-a95b-95fbfd3b0162	2010-03-24 00:00:00	\N	\N
992	Chlorhexidine (Mouthwash)	1790812	Chlorhexidine	8d90c38e-e241-4f73-877d-ff314408a510	2015-05-28 00:00:00	\N	\N
993	Chlorhexidine (Soap)	1790812	Chlorhexidine	ef5ed5db-2787-4d4a-90d9-09b9740c882a	2015-10-05 00:00:00	\N	\N
994	Chlorhexidine (Topical)	1790812	Chlorhexidine	dfdaa646-0ef5-4433-b8d3-39ec139827b9	2015-08-12 00:00:00	\N	\N
995	Chlorhexidine/Isopropyl Alcohol (Topical)	1790812	Chlorhexidine	ea4d9094-1aca-4c0f-a67d-7276a9fd591b	2015-09-18 00:00:00	\N	\N
996	CHLOROMAG (Injectable)	19092849	Magnesium Chloride	30f8b0f5-d601-4ed6-8463-20746db78d94	2011-07-08 00:00:00	\N	\N
997	CHLOROMYCETIN (Ophthalmic)	990069	Chloramphenicol	698aaa0a-9fd3-40c2-ec93-0dc2170a75ba	2006-11-17 00:00:00	\N	\N
998	Chloroprocaine (Injectable)	19049410	chloroprocaine	ec4ab877-878f-4b0e-3eb6-106a606479ad	2014-09-18 00:00:00	\N	\N
999	Chloroquine (Oral Pill)	1792515	Chloroquine	56f3380c-9411-417a-a3f7-fe4025900c75	2014-03-18 00:00:00	\N	\N
1000	Chlorothiazide (Injectable)	992590	Chlorothiazide	5b5d8a97-1428-4047-8e6c-b778429a26e4	2015-04-01 00:00:00	\N	\N
1001	Chloroxylenol (Soap)	949459	chloroxylenol	b4493ad6-e1c8-4b2d-8a57-1845589b04f9	2015-09-08 00:00:00	\N	\N
1002	Chloroxylenol (Topical)	949459	chloroxylenol	9ba4c1a7-e397-44a2-979e-ad2b794bd1fe	2014-09-16 00:00:00	\N	\N
1003	Chloroxylenol/Hydrocortisone/Pramoxine (Otic)	949459	chloroxylenol	ae998218-7f49-46cf-9898-0920572b6fd1	2011-09-27 00:00:00	\N	\N
1004	Chlorpheniramine (Oral Liquid)	1192710	Chlorpheniramine	3065bc51-c210-483b-876d-14a4d060bdec	2011-09-23 00:00:00	\N	\N
1005	Chlorpheniramine (Oral Pill)	1192710	Chlorpheniramine	883a0a71-c9fb-44fd-9f2c-591d7e17c973	2015-07-24 00:00:00	\N	\N
1006	Chlorpheniramine/Codeine (Oral Liquid)	1192710	Chlorpheniramine	acc21b1e-729c-4004-820f-5edbde869458	2011-10-03 00:00:00	\N	\N
1007	Chlorpheniramine/Codeine/Pseudoephedrine (Oral Liquid)	1192710	Chlorpheniramine	6ca7c4ff-ba0d-490f-b8b8-9518955424e1	2015-05-07 00:00:00	\N	\N
1008	Chlorpheniramine/Dextromethorphan (Oral Liquid)	1192710	Chlorpheniramine	becb4025-b63e-f2ea-9d11-d51fdf4e5c13	2014-10-02 00:00:00	\N	\N
1009	Chlorpheniramine/Dextromethorphan (Oral Pill)	1192710	Chlorpheniramine	de7d5d7e-415f-4ae4-9f53-fa5bef790154	2015-06-03 00:00:00	\N	\N
1010	Chlorpheniramine/Dextromethorphan/Phenylephrine (Oral Liquid)	1192710	Chlorpheniramine	12e5b41b-6a30-456c-9242-45fe7e9e45d8	2015-06-12 00:00:00	\N	\N
1011	Chlorpheniramine/Dextromethorphan/Pseudoephedrine (Oral Liquid)	1192710	Chlorpheniramine	63fdf19e-f467-4873-8cbf-da2e5e2cdc0b	2015-05-07 00:00:00	\N	\N
1012	Chlorpheniramine/HYDROcodone (Oral Liquid)	1192710	Chlorpheniramine	47dae0e8-065f-4722-a1c1-4763e25e14d4	2015-03-03 00:00:00	\N	\N
1013	Chlorpheniramine/HYDROcodone/Pseudoephedrine (Oral Liquid)	1192710	Chlorpheniramine	5ab09c98-cb39-43be-b306-5eff3c31b563	2015-01-05 00:00:00	\N	\N
1014	Chlorpheniramine/Ibuprofen/Pseudoephedrine (Oral Pill)	1192710	Chlorpheniramine	ecd6ea11-8b34-01b4-cbd9-901ba7a8f6e2	2014-02-05 00:00:00	\N	\N
1015	Chlorpheniramine/Methscopolamine (Oral Liquid)	1192710	Chlorpheniramine	9aca3d25-d042-479b-a00e-63be5b5073fe	2010-07-20 00:00:00	\N	\N
1016	Chlorpheniramine/Phenylephrine (Oral Liquid)	1192710	Chlorpheniramine	bf5c4a23-9581-4b84-a75b-e17e1d768970	2014-02-03 00:00:00	\N	\N
1017	Chlorpheniramine/Phenylephrine (Oral Pill)	1192710	Chlorpheniramine	58e7d1e6-080c-4aa3-ad02-e93288db6007	2015-07-21 00:00:00	\N	\N
1018	Chlorpheniramine/Phenylephrine/Pyrilamine (Oral Liquid)	1192710	Chlorpheniramine	8728160d-6172-4f4e-b512-46f5d9bca733	2010-07-20 00:00:00	\N	\N
1019	Chlorpheniramine/Pseudoephedrine (Oral Pill)	1192710	Chlorpheniramine	7cd8f7f3-c262-4f7c-bcaf-068be2c952f9	2015-09-23 00:00:00	\N	\N
1020	chlorproMAZINE (Oral Pill)	794852	Chlorpromazine	d2f1cc4b-eaf7-4a76-819e-f5168f22a5de	2015-09-23 00:00:00	\N	\N
1021	chlorproPAMIDE (Oral Pill)	1594973	Chlorpropamide	baa54287-8065-da1a-f19e-ce8daf61bd01	2014-05-21 00:00:00	\N	\N
1022	Chlorthalidone (Oral Pill)	1395058	Chlorthalidone	bb7112ae-3a37-4525-8c7f-c0f4100ffc0a	2015-05-07 00:00:00	\N	\N
1023	Chlorthalidone/cloNIDine (Oral Pill)	1395058	Chlorthalidone	79a0f78a-bd88-4657-8b51-e24a64a270b6	2015-02-10 00:00:00	\N	\N
1024	Chlorzoxazone (Oral Pill)	795113	Chlorzoxazone	3b91e3ba-1eb6-4297-9d1b-28d87b36a5b3	2015-07-14 00:00:00	\N	\N
1025	Cholecalciferol (Oral Pill)	19095164	Cholecalciferol	fdec1f4d-8ede-42ff-882d-406154911127	2014-02-03 00:00:00	\N	\N
1026	Cholecalciferol/Folic Acid (Oral Pill)	19095164	Cholecalciferol	7bc8730c-38cf-4bae-b8f2-da92751a551c	2014-11-12 00:00:00	\N	\N
1027	Cholestyramine Resin (Oral Liquid)	19095309	Cholestyramine Resin	362ddd91-a63f-4ec6-841a-75785dd208c8	2015-06-25 00:00:00	\N	\N
1028	Cholic Acid (Oral Pill)	44506782	Cholic Acid	e5b67402-8550-4604-97a0-c7b149fbf753	2015-04-06 00:00:00	\N	\N
1029	Chondroitin Sulfates/Glucosamine/Methylsulfonylmethane (Oral Pill)	1395573	Chondroitin Sulfates	67916a8f-5000-4b2b-bf8c-47d2e014176b	2014-12-08 00:00:00	\N	\N
1030	CHOOZ (Chewable)	19035704	Calcium Carbonate	b2dd2047-e00b-410f-a7ee-74e9c365d4a8	2010-10-09 00:00:00	\N	\N
1031	Chorionic Gonadotropin (Injectable)	1563600	Chorionic Gonadotropin	dc604794-6dd6-43a7-85fa-2f04ed325c33	2012-04-20 00:00:00	\N	\N
1032	Chromic chloride (Injectable)	19049877	chromic chloride	6c6d8d3b-fd30-4cbc-a988-92cc73d0414c	2011-09-13 00:00:00	\N	\N
1033	Chromic chloride/Copper Sulfate/Manganese sulfate/Zinc Sulfate (Injectable)	19049877	chromic chloride	5ee6a685-3c35-467b-8d4d-79efdd0bfa8e	2014-09-02 00:00:00	\N	\N
1034	CIALIS (Oral Pill)	1336926	tadalafil	1da40b7c-c96a-45d2-a3f2-fafad429afd6	2014-03-21 00:00:00	\N	\N
1035	CICLODAN (Topical)	950098	ciclopirox	346422b8-003d-4c4f-8a92-1e9146c13732	2012-06-18 00:00:00	\N	\N
1036	Ciclopirox (Shampoo)	950098	ciclopirox	b44b190b-8e2a-4937-a6c5-92f37911e7f8	2012-02-24 00:00:00	\N	\N
1037	Ciclopirox (Topical)	950098	ciclopirox	4439cb3d-6825-4558-a981-122ec15f7b05	2015-09-29 00:00:00	\N	\N
1038	Cidofovir (Injectable)	1745072	Cidofovir	56541229-8c1a-4550-8951-2415ed08e7e9	2013-06-04 00:00:00	\N	\N
1039	Cilastatin/Imipenem (Injectable)	1797258	Cilastatin	4b652048-d5e1-48d1-acd4-091c14d9022d	2015-07-13 00:00:00	\N	\N
1040	Cilostazol (Oral Pill)	1350310	cilostazol	20a05739-46a6-47ca-ae61-4341d028460e	2015-03-30 00:00:00	\N	\N
1041	CILOXAN (Ophthalmic)	1797513	Ciprofloxacin	614af481-f9ef-44ac-9cb8-f421660d9cdd	2011-07-29 00:00:00	\N	\N
1042	Cimetidine (Oral Liquid)	997276	Cimetidine	f2ec923a-2b88-43c0-ac2a-7ae20c053039	2009-09-01 00:00:00	\N	\N
1043	Cimetidine (Oral Pill)	997276	Cimetidine	ad3e8f6a-8e35-42c2-a98c-566a2868e923	2015-09-14 00:00:00	\N	\N
1044	Cinacalcet (Oral Pill)	1548111	cinacalcet	4cb2ad7a-c70d-4647-bc4d-bac9b5d13b92	2014-07-23 00:00:00	\N	\N
1045	CIPRO HC (Otic)	1797513	Ciprofloxacin	70b19501-34b6-4f95-a8dd-dd3e67d22399	2011-09-08 00:00:00	\N	\N
1046	CIPRODEX (Otic)	1797513	Ciprofloxacin	1c4db12f-285b-4714-9b1c-26bcdc39cebf	2013-11-19 00:00:00	\N	\N
1047	Ciprofloxacin (Ophthalmic)	1797513	Ciprofloxacin	11f56251-d913-4986-9dba-c2e4df8a3822	2015-09-15 00:00:00	\N	\N
1048	Ciprofloxacin (Oral Liquid)	1797513	Ciprofloxacin	f8f4461c-c9fa-451b-ba24-b080c8bfc2d7	2014-06-06 00:00:00	\N	\N
1049	Ciprofloxacin (Oral Pill)	1797513	Ciprofloxacin	178dc379-e2b8-4b47-9f0c-3fc7fb435c36	2015-09-23 00:00:00	\N	\N
1050	Ciprofloxacin (Otic)	1797513	Ciprofloxacin	d0125acf-1879-452d-ba29-c0f753653789	2012-09-14 00:00:00	\N	\N
1051	Ciprofloxacin/Dexamethasone (Otic)	1797513	Ciprofloxacin	0ed518de-4ae1-43d1-84ff-26872d9e6a0f	2013-11-19 00:00:00	\N	\N
1052	Ciprofloxacin/Hydrocortisone (Otic)	1797513	Ciprofloxacin	598288ca-256a-4b9e-91e0-829f02cb8cd3	2011-09-08 00:00:00	\N	\N
1053	Cisatracurium (Injectable)	19015726	Cisatracurium	f78a07e2-0d3b-4460-b29e-8c10c90afbda	2015-09-02 00:00:00	\N	\N
1054	CISplatin (Injectable)	1397599	Cisplatin	64975f5d-0eca-4998-8a72-06eec98285eb	2015-08-14 00:00:00	\N	\N
1055	Citalopram (Oral Pill)	797617	Citalopram	6c96373f-6744-49d4-aec5-3720bc993fab	2015-09-21 00:00:00	\N	\N
1056	Citric Acid/Gluconolactone/Magnesium carbonate (Irrigation)	950435	Citric Acid	bdb3cef8-79c4-4322-9a21-c13123abe0cc	2013-03-21 00:00:00	\N	\N
1057	Citric Acid/Glucose/Sodium citrate (Injectable)	950435	Citric Acid	22805f0d-ba58-41ea-b245-19980abcda22	2013-06-10 00:00:00	\N	\N
1058	Citric Acid/Potassium citrate (Oral Liquid)	950435	Citric Acid	93cca32a-d173-4d27-b493-9d8cfd1b7978	2015-08-19 00:00:00	\N	\N
1059	Citric Acid/Potassium citrate/Sodium citrate (Oral Liquid)	950435	Citric Acid	eb0bade0-fc86-4bfa-90cc-f0d5f7b4d3a8	2015-08-14 00:00:00	\N	\N
1060	Citric Acid/Sodium Bicarbonate (Effervescent)	950435	Citric Acid	672106ae-9e27-4173-b7b7-1f5494643673	2010-10-09 00:00:00	\N	\N
1061	Citric Acid/Sodium citrate (Oral Liquid)	950435	Citric Acid	5c8b16fa-023a-4e10-a3a2-8ad79a19f24c	2015-08-25 00:00:00	\N	\N
1062	CITROMA (Oral Liquid)	967861	magnesium citrate	af276471-c5d7-4326-8ba2-cf546ab50f77	2015-01-13 00:00:00	\N	\N
1063	CITRUCEL (Oral Liquid)	905371	Methylcellulose	9d5f2244-a610-4d45-b6e8-e79bb17a558f	2015-09-16 00:00:00	\N	\N
1064	CITRUCEL (Oral Pill)	905371	Methylcellulose	d27f6742-2dcc-451e-b803-6ffe183038ec	2015-09-16 00:00:00	\N	\N
1065	Cladosporium cladosporioides extract (Injectable)	40167025	Cladosporium cladosporioides extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
1066	Cladosporium herbarum extract (Injectable)	40161203	Cladosporium herbarum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
1067	Cladribine (Injectable)	19054825	Cladribine	a2592a9b-bca6-4a5a-89c2-855a0634d5fe	2015-08-24 00:00:00	\N	\N
1068	CLARAVIS (Oral Pill)	984232	Isotretinoin	ee862463-77c0-4694-bba8-97274f13963f	2015-09-16 00:00:00	\N	\N
1069	CLARINEX (Oral Pill)	1103006	desloratadine	b7b0b1a0-2ab3-4697-bee4-0cd7fd5088b9	2011-04-28 00:00:00	\N	\N
1070	CLARIS (Soap)	1036252	Sulfacetamide	7045e1e0-de48-4cc4-862d-f5c7a9b693b9	2010-07-20 00:00:00	\N	\N
1071	Clarithromycin (Oral Liquid)	1750500	Clarithromycin	2e899f4a-a2e9-445c-a0ed-6ad811e997e6	2015-05-05 00:00:00	\N	\N
1072	Clarithromycin (Oral Pill)	1750500	Clarithromycin	185422f8-12f8-4bcf-b5da-57544e6528f0	2015-08-21 00:00:00	\N	\N
1073	CLARITIN (Oral Disintegrating)	1107830	Loratadine	7dc04b48-f053-4e4b-a493-9e8286d2a791	2014-09-22 00:00:00	\N	\N
1074	CLARITIN (Oral Liquid)	1107830	Loratadine	1fdeaf8b-6c6b-7033-e054-00144ff8d46c	2015-09-21 00:00:00	\N	\N
1075	CLARITIN (Oral Pill)	1107830	Loratadine	660ac9df-f1b1-4c89-94dd-9fae0a013f3c	2014-11-14 00:00:00	\N	\N
1076	CLARUS (Topical)	902950	Tolnaftate	7e8897ff-67d1-4336-866e-cb76a36edddc	2012-06-11 00:00:00	\N	\N
1077	CLEAN AND CLEAR ADVANTAGE ACNE CLEANSER (Soap)	964407	Salicylic Acid	20a9ba99-1d86-4edb-a0f5-f5df16d142f0	2012-11-01 00:00:00	\N	\N
1078	CLEAN AND CLEAR ADVANTAGE MARK TREATMENT (Topical)	964407	Salicylic Acid	d39c2906-97d7-4b85-bb36-68e5f086935a	2012-07-24 00:00:00	\N	\N
1079	CLEAN AND CLEAR ADVANTAGE POPPED PIMPLE RELIEF (Topical)	964407	Salicylic Acid	c3852160-2a19-442b-8118-4579edf0afe9	2013-03-15 00:00:00	\N	\N
1080	CLEAN AND CLEAR BLACKHEAD ERASER (Topical)	964407	Salicylic Acid	c33ac045-a8e4-4171-a6f4-ecb5829ee004	2015-05-19 00:00:00	\N	\N
1081	CLEAN AND CLEAR DEEP CLEANING (Topical)	964407	Salicylic Acid	d61db0ce-11f2-42f4-b975-b623872c786e	2012-05-03 00:00:00	\N	\N
1082	CLEAR EYES COMPLETE (Ophthalmic)	902251	hypromellose	9a1ce5e2-c3da-424d-b754-cf2de8c655e3	2010-10-09 00:00:00	\N	\N
1083	CLEAR EYES COOLING COMFORT (Ophthalmic)	961145	Glycerin	a710be3f-fa5b-46a6-87b5-5a4d1f807e1c	2012-04-12 00:00:00	\N	\N
1084	CLEAR EYES NATURAL TEARS (Ophthalmic)	948856	Polyvinyl Alcohol	efba3eb0-798d-4635-b19b-4970e45b3cc9	2012-11-05 00:00:00	\N	\N
1085	CLEAR EYES REDNESS RELIEF REFORMULATED NOV 2011 (Ophthalmic)	961145	Glycerin	a26ef66e-2def-4c98-9959-d40d4cfe3108	2011-11-14 00:00:00	\N	\N
1086	CLEARASIL (Topical)	918172	Benzoyl Peroxide	6158ced9-cd3a-41b2-809e-9aec2ba90d33	2013-11-22 00:00:00	\N	\N
1087	CLEARASIL ACNE CONTROL (Soap)	964407	Salicylic Acid	ebe4669e-0387-47b2-9778-eb7c04a1c9f9	2015-07-06 00:00:00	\N	\N
1088	CLEARASIL ACNE CONTROL (Topical)	964407	Salicylic Acid	c19ea241-9952-4251-bb4d-2db521bead94	2012-11-09 00:00:00	\N	\N
1089	CLEARCANAL (Otic)	958999	carbamide peroxide	0ef2be5b-cc39-48ae-b5c5-e787464dea08	2012-03-15 00:00:00	\N	\N
1090	CLEARLAX (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	ee30489a-8683-4403-8f85-76434242663c	2015-05-27 00:00:00	\N	\N
1091	Clemastine (Oral Liquid)	1197677	Clemastine	3e403ca1-0c23-4af6-bfac-50187d8d4653	2011-06-29 00:00:00	\N	\N
1092	Clemastine (Oral Pill)	1197677	Clemastine	5243fbe1-e45d-4673-86bf-6f8454d36f39	2014-07-08 00:00:00	\N	\N
1093	CLENIA (Topical)	1036252	Sulfacetamide	4089ba41-7b16-4fc3-b160-470b426a21ec	2010-07-20 00:00:00	\N	\N
1094	CLEOCIN (Injectable)	997881	Clindamycin	7741156f-b98f-4975-a7e3-1c7d508a6a14	2012-10-31 00:00:00	\N	\N
1095	CLEOCIN (Oral Liquid)	997881	Clindamycin	1ef87b6c-9d32-44ac-8c55-8bf01424cc45	2015-08-11 00:00:00	\N	\N
1096	CLEOCIN (Vaginal)	997881	Clindamycin	c72f21f8-c81a-4e4c-9c98-ed46a57b3343	2015-09-14 00:00:00	\N	\N
1097	CLINDACIN (Topical)	997881	Clindamycin	288371ef-96b6-4ce3-9be1-1d9d309b400c	2011-02-22 00:00:00	\N	\N
1098	CLINDAMAX (Topical)	997881	Clindamycin	2ceee427-50d3-4bfe-8ccf-9efb11a90fb7	2009-10-09 00:00:00	\N	\N
1099	Clindamycin (Injectable)	997881	Clindamycin	bd1c1648-4733-4233-8337-469fe11bd0cb	2014-07-17 00:00:00	\N	\N
1100	Clindamycin (Oral Liquid)	997881	Clindamycin	e1cb8caa-1e49-41e7-bbd8-a2e75bea2fe4	2015-09-29 00:00:00	\N	\N
1101	Clindamycin (Oral Pill)	997881	Clindamycin	63a0466c-af7d-4696-a950-19b73b55a65a	2015-09-28 00:00:00	\N	\N
1102	Clindamycin (Topical)	997881	Clindamycin	64c28c73-5a2a-4bb0-bcec-9948463a9c8f	2015-10-01 00:00:00	\N	\N
1103	Clindamycin (Vaginal)	997881	Clindamycin	706dd0b6-367c-4950-88fe-7a6c0661c2b9	2015-09-14 00:00:00	\N	\N
1104	Clindamycin/Tretinoin (Topical)	997881	Clindamycin	78c329f9-f0c9-486d-9e54-0123699fb9e1	2014-11-19 00:00:00	\N	\N
1105	CLINPRO 5000 (Toothpaste)	19069022	Sodium Fluoride	a20d3cf0-2e1f-4191-971e-9e47936b4580	2012-01-06 00:00:00	\N	\N
1106	Clioquinol/Hydrocortisone (Topical)	980867	Clioquinol	b1f875e9-a95b-47ff-80cc-54a2d7a2c08c	2015-10-02 00:00:00	\N	\N
1107	Clobetasol (Shampoo)	998415	Clobetasol	a4f82a4c-bc7e-4927-936e-add854812559	2014-06-27 00:00:00	\N	\N
1108	Clobetasol (Topical)	998415	Clobetasol	976d9c90-1800-4dac-9b92-48284b29d2b9	2015-09-21 00:00:00	\N	\N
1109	CLOBEX (Topical)	998415	Clobetasol	a086ead1-b906-4198-af19-5423957c9e2a	2011-02-24 00:00:00	\N	\N
1110	Clocortolone (Topical)	950882	clocortolone	1b20b467-1b29-45de-b00e-4228812444f6	2015-05-01 00:00:00	\N	\N
1111	CLODAN (Shampoo)	998415	Clobetasol	4150d579-eb8b-46cd-b044-352807894e1a	2014-06-27 00:00:00	\N	\N
1112	CLODERM (Topical)	950882	clocortolone	4abc01f2-03d4-43d5-a085-f452443cfca2	2015-05-01 00:00:00	\N	\N
1113	Clofarabine (Injectable)	19054821	clofarabine	55d3c78b-dca5-436b-97b5-73d166217415	2014-10-01 00:00:00	\N	\N
1114	CLOFERA (Oral Liquid)	1150886	chlophedianol	cd95ea40-5461-4435-bec1-979a66d62944	2010-10-09 00:00:00	\N	\N
1115	CLOLAR (Injectable)	19054821	clofarabine	55d3c78b-dca5-436b-97b5-73d166217415	2014-10-01 00:00:00	\N	\N
1116	clomiPHENE (Oral Pill)	1598819	Clomiphene	53eff40f-37b1-47b1-a9b8-c22360855f18	2014-04-10 00:00:00	\N	\N
1117	clomiPRAMINE (Oral Pill)	798834	Clomipramine	4c32971e-feb3-4388-9cd6-d1f99f258b0d	2015-07-10 00:00:00	\N	\N
1118	clonazePAM (Oral Disintegrating)	798874	Clonazepam	26b1d362-e727-49db-9e81-ee80ca97795c	2013-07-17 00:00:00	\N	\N
1119	clonazePAM (Oral Pill)	798874	Clonazepam	79a3305b-be80-416f-a346-5a907f7b669e	2015-08-14 00:00:00	\N	\N
1120	cloNIDine (Injectable)	1398937	Clonidine	f6798f73-b5a6-434b-a627-aa102b123dd5	2013-10-23 00:00:00	\N	\N
1121	cloNIDine (Oral Pill)	1398937	Clonidine	e6583ff5-0e03-470b-a986-35770aa0e80b	2015-09-21 00:00:00	\N	\N
1122	Clopidogrel (Oral Pill)	1322184	clopidogrel	8b84d00e-9aac-4da2-b9aa-17e5ddf9b922	2015-09-30 00:00:00	\N	\N
1123	Clorazepate (Oral Pill)	790253	clorazepate	b8fbc985-62a5-4bc2-b9b8-0451926e86de	2014-11-05 00:00:00	\N	\N
1124	CLORPACTIN WCS-90 (Topical)	1719061	oxychlorosene	6b3b2d67-4142-4a98-9a73-fb107b19a636	2013-03-11 00:00:00	\N	\N
1125	CLORPRES (Oral Pill)	1395058	Chlorthalidone	79a0f78a-bd88-4657-8b51-e24a64a270b6	2015-02-10 00:00:00	\N	\N
1126	Clotrimazole (Oral Lozenge)	1000632	Clotrimazole	7464e883-6286-4f04-ae38-b7ddc3fec754	2014-04-30 00:00:00	\N	\N
1127	Clotrimazole (Topical)	1000632	Clotrimazole	b4d9cde8-bf6d-470b-9b5c-29f8e680157e	2015-09-29 00:00:00	\N	\N
1128	Clotrimazole (Vaginal)	1000632	Clotrimazole	2970c5f2-282e-4b22-8e24-331c959f0e3e	2015-04-02 00:00:00	\N	\N
1129	cloZAPine (Oral Liquid)	800878	Clozapine	693cb9d4-39db-4ecf-9eae-b01f06f8d5d1	2015-09-30 00:00:00	\N	\N
1130	cloZAPine (Oral Pill)	800878	Clozapine	0cf63b13-48b2-4b07-b241-617725b52f6b	2014-09-24 00:00:00	\N	\N
1131	CLOZARIL (Oral Pill)	800878	Clozapine	0cf63b13-48b2-4b07-b241-617725b52f6b	2014-09-24 00:00:00	\N	\N
1132	Coal Tar (Shampoo)	1000995	Coal Tar	1c18fde9-d39b-4339-8f62-3f352d450291	2015-09-21 00:00:00	\N	\N
1133	Coal Tar (Topical)	1000995	Coal Tar	1e32ccda-6760-489b-83ef-f7759d0c044e	2015-08-07 00:00:00	\N	\N
1134	Coal Tar/Salicylic Acid (Shampoo)	1000995	Coal Tar	d990a3d8-8be8-44e3-8e84-a6d8da21f3b5	2014-10-24 00:00:00	\N	\N
1135	Coal Tar/Salicylic Acid/Sulfur (Shampoo)	1000995	Coal Tar	ec7873bb-288a-4671-b649-1d5d5ced6476	2011-07-01 00:00:00	\N	\N
1136	Coast live oak pollen extract (Injectable)	40161565	coast live oak pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
1137	Cobicistat (Oral Pill)	42874220	cobicistat	3784c35c-e87f-410c-900b-8fd6313c6010	2014-10-09 00:00:00	\N	\N
1138	Cobicistat/Elvitegravir/Emtricitabine/Tenofovir disoproxil (Oral Pill)	42874220	cobicistat	74ae2a93-b267-444c-8f0f-a2a6522260ee	2015-08-11 00:00:00	\N	\N
1139	Cocaine (Topical)	1001419	Cocaine	24faa247-fe12-4574-881d-445b078b3e87	2012-06-25 00:00:00	\N	\N
1140	Cochliobolus sativus extract (Injectable)	40161182	Cochliobolus sativus extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
1141	Cocoa butter/Phenylephrine (Rectal)	951112	cocoa butter	cfb1d1d9-d45d-4ead-bd73-48456dcff3df	2015-07-24 00:00:00	\N	\N
1142	Cocoa butter/Phenylephrine/Shark liver oil (Rectal)	951112	cocoa butter	2504b132-20cf-4b7e-8074-407c1adbdb19	2012-10-09 00:00:00	\N	\N
1143	Cocoa butter/Zinc Oxide (Rectal)	951112	cocoa butter	5516f800-d3fa-4b90-a3eb-c0bdf3183b9b	2010-10-09 00:00:00	\N	\N
1144	CODAR AR (Oral Liquid)	1192710	Chlorpheniramine	acc21b1e-729c-4004-820f-5edbde869458	2011-06-28 00:00:00	\N	\N
1145	CODAR GF (Oral Liquid)	1201620	Codeine	6eda2c06-fb11-4a58-98fb-4eafe1d1df5f	2011-06-28 00:00:00	\N	\N
1146	Codeine (Oral Liquid)	1201620	Codeine	3b04ed3f-1a3d-4e8f-b91b-216c63d40b88	2013-07-02 00:00:00	\N	\N
1147	Codeine (Oral Pill)	1201620	Codeine	5819bdf7-300e-45b8-8f3a-447b53656293	2014-06-23 00:00:00	\N	\N
1148	Codeine/Dexbrompheniramine/Pseudoephedrine (Oral Liquid)	1201620	Codeine	9f8fc672-3589-498d-82a7-e243f4e0dec0	2011-10-17 00:00:00	\N	\N
1149	Codeine/guaiFENesin (Oral Liquid)	1201620	Codeine	fe126254-6ee6-48c3-965c-96e4276a5314	2015-07-13 00:00:00	\N	\N
1150	Codeine/guaiFENesin/Pseudoephedrine (Oral Liquid)	1201620	Codeine	48a209ca-7f1b-4b66-9e49-943f0e7605a3	2014-12-22 00:00:00	\N	\N
1151	Codeine/Phenylephrine (Oral Liquid)	1201620	Codeine	e2d73253-1777-4993-b693-323f0450c1c4	2012-03-09 00:00:00	\N	\N
1152	Codeine/Phenylephrine/Promethazine (Oral Liquid)	1201620	Codeine	c09ba689-4377-4946-b8b0-5f64d5e90d07	2015-06-16 00:00:00	\N	\N
1153	Codeine/Promethazine (Oral Liquid)	1201620	Codeine	47d4eb4f-6dd4-44b9-aea1-19c4bfc1d425	2015-06-12 00:00:00	\N	\N
1154	Codeine/Pseudoephedrine/Pyrilamine (Oral Liquid)	1201620	Codeine	f11abf48-ec05-44d6-9057-1c81a433efbd	2011-06-28 00:00:00	\N	\N
1155	Codeine/Pseudoephedrine/Triprolidine (Oral Liquid)	1201620	Codeine	dd62a5eb-dd5a-4329-8696-07acb555af10	2015-07-30 00:00:00	\N	\N
1156	CODRIX (Oral Pill)	1125315	Acetaminophen	632c566c-39fb-4321-ac56-aea83780fa02	2008-06-02 00:00:00	\N	\N
1157	COLACE (Oral Pill)	941258	Docusate	7793fced-e8ee-44e2-b212-dd2a59a5f462	2015-01-28 00:00:00	\N	\N
1158	Colchicine (Oral Pill)	1101554	Colchicine	cb5f9d85-6b81-49f8-bcd6-17b7bfbc10f2	2015-10-05 00:00:00	\N	\N
1159	COLCRYS (Oral Pill)	1101554	Colchicine	a0688f33-f00f-4a68-abc3-73ec887a471a	2015-08-12 00:00:00	\N	\N
1160	Colesevelam (Oral Liquid)	1518148	colesevelam	b9df447c-b65b-45b9-873a-07a2ab6e2d1f	2012-02-14 00:00:00	\N	\N
1161	Colesevelam (Oral Pill)	1518148	colesevelam	b9df447c-b65b-45b9-873a-07a2ab6e2d1f	2012-02-14 00:00:00	\N	\N
1162	COLESTID (Oral Granules)	1501617	Colestipol	21b37725-fc0c-4365-a7dc-1a473d42502d	2015-07-14 00:00:00	\N	\N
1163	Colestipol (Oral Granules)	1501617	Colestipol	21b37725-fc0c-4365-a7dc-1a473d42502d	2015-07-14 00:00:00	\N	\N
1164	Colestipol (Oral Pill)	1501617	Colestipol	fa6c3e11-84e9-433d-aa74-7cd34336bbed	2014-08-20 00:00:00	\N	\N
1165	Colistin (Injectable)	901845	Colistin	ab241809-0d2f-44ba-829c-26be67ee623f	2015-02-02 00:00:00	\N	\N
1166	Colistin/Hydrocortisone/Neomycin/THONZONIUM (Otic)	901845	Colistin	317cc880-73fe-4561-897e-41489108b3ba	2015-06-26 00:00:00	\N	\N
1167	COLLAGENASE (Topical)	980311	COLLAGENASE	a7bf0341-49ff-4338-a339-679a3f3f953d	2014-02-03 00:00:00	\N	\N
1168	Colloidal oatmeal (Topical)	986261	Colloidal oatmeal	9f211875-4ffb-493d-a011-40c3a2b86615	2015-10-02 00:00:00	\N	\N
1169	COLOCORT (Rectal)	975125	Hydrocortisone	a5b47406-b933-4f6b-96dc-db837bcccf77	2014-10-22 00:00:00	\N	\N
1170	COLY MYCIN M (Injectable)	901845	Colistin	6d6e13e2-dc33-4b7b-84d0-66146a57c552	2013-04-04 00:00:00	\N	\N
1171	COLY MYCIN S (Otic)	901845	Colistin	317cc880-73fe-4561-897e-41489108b3ba	2010-02-04 00:00:00	\N	\N
1172	COMBIGAN (Ophthalmic)	915542	brimonidine	feaf1480-a4b8-4486-992a-96be3a596243	2013-11-22 00:00:00	\N	\N
1173	COMBIVIR (Oral Pill)	1704183	Lamivudine	16da660b-9981-4d24-a14a-94c7744fce4f	2015-10-13 00:00:00	\N	\N
1174	COMETRIQ (Oral Pill)	43012292	cabozantinib	1a0c3bea-c87b-4d25-bb44-5f0174da6b34	2012-12-13 00:00:00	\N	\N
1175	Common sagebrush pollen extract (Injectable)	40161598	common sagebrush pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
1176	COMPAZINE (Oral Pill)	752061	Prochlorperazine	a8c5db51-e8b2-4594-8b05-aaa78ca0682d	2014-04-01 00:00:00	\N	\N
1177	COMPAZINE (Rectal)	752061	Prochlorperazine	9bdba30b-53b4-427a-af74-7a39b52130b2	2013-08-29 00:00:00	\N	\N
1178	COMPLERA (Oral Pill)	1703069	emtricitabine	54c8bec2-d565-489c-8d7c-afd3cdf78df5	2013-03-21 00:00:00	\N	\N
1179	COMTAN (Oral Pill)	782211	entacapone	95976f1d-1b36-4f08-a98f-36d5d7883d7b	2014-07-21 00:00:00	\N	\N
1180	CONGESTAC (Oral Pill)	1163944	Guaifenesin	03d29b11-deba-3727-e054-00144ff8d46c	2014-09-25 00:00:00	\N	\N
1181	CONSTULOSE (Oral Liquid)	987245	Lactulose	461ec39f-eeb4-4460-9b5c-62367d47162b	2012-04-10 00:00:00	\N	\N
1182	CONTAC COLD AND FLU NON DROWSY MAXIMUM STRENGTH (Oral Pill)	1125315	Acetaminophen	8ed2df70-fdb1-11e3-a3ac-0800200c9a66	2014-07-07 00:00:00	\N	\N
1183	CONTROL RX (Toothpaste)	19069022	Sodium Fluoride	b334c974-055f-458f-bac0-c28372be53c3	2011-02-08 00:00:00	\N	\N
1184	Cootamundra wattle pollen extract (Injectable)	40169140	Cootamundra wattle pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
1185	Copper Sulfate (Injectable)	19057346	Copper Sulfate	941ad1e2-6052-4df4-8cfe-5af4a99703e4	2011-10-17 00:00:00	\N	\N
1186	CORDRAN (Topical)	956266	Flurandrenolide	a0949773-c75f-4ef0-a69c-1abd978340d0	2014-06-06 00:00:00	\N	\N
1187	COREG (Oral Pill)	1346823	carvedilol	fdb12700-116b-4203-8d74-9a94b9401fe6	2010-10-28 00:00:00	\N	\N
1188	CORGARD (Oral Pill)	1313200	Nadolol	c2e709d2-96a2-41ea-b5e9-9ce4ccb91f59	2013-12-12 00:00:00	\N	\N
1189	CORICIDIN HBP CHEST CONGESTION (Oral Pill)	1119510	Dextromethorphan	e33f2319-2181-46db-a094-3e874b324c0a	2014-03-27 00:00:00	\N	\N
1190	CORICIDIN HBP COLD & FLU (Oral Pill)	1125315	Acetaminophen	763a5334-a741-4678-9947-603776622450	2013-10-18 00:00:00	\N	\N
1191	CORICIDIN HBP COUGH AND COLD (Oral Pill)	1192710	Chlorpheniramine	ee666963-e686-4374-b52b-a677f1cd4114	2013-05-01 00:00:00	\N	\N
1192	CORMAX (Topical)	998415	Clobetasol	29735bf2-e08e-4f60-a640-0e3b9ccca80f	2012-07-05 00:00:00	\N	\N
1193	Corn pollen extract (Injectable)	40161610	corn pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
1194	Cornstarch/Kaolin/Zinc Oxide (Topical)	40230159	cornstarch	5654facc-ad51-4501-a505-9c0b2035e653	2011-09-08 00:00:00	\N	\N
1195	CORTAID (Topical)	975125	Hydrocortisone	f3f31285-4dde-4708-b715-6da36a4f2a14	2015-09-11 00:00:00	\N	\N
1196	CORTEF (Oral Pill)	975125	Hydrocortisone	9ce19944-dd88-4a7b-84ca-b07f4ec23bad	2014-08-19 00:00:00	\N	\N
1197	CORTENEMA (Rectal)	975125	Hydrocortisone	a307448a-ccc4-41a8-977a-11f28f0bded9	2013-03-27 00:00:00	\N	\N
1198	CORTICOOL (Topical)	975125	Hydrocortisone	ad772e39-02c1-4995-bd8e-46fa63be2c5a	2014-11-26 00:00:00	\N	\N
1199	Corticotropin (Injectable)	1541079	Corticotropin	7b48ddec-e815-45f4-9ca0-5c0daaf56f30	2015-07-31 00:00:00	\N	\N
1200	CORTIFOAM (Rectal)	975125	Hydrocortisone	36f623df-2ae3-4858-9783-c058097951f4	2015-06-30 00:00:00	\N	\N
1201	Cortisone (Oral Pill)	1507705	Cortisone	5d59b43c-f10d-463f-92df-6171d02b7a45	2013-10-18 00:00:00	\N	\N
1202	CORTISPORIN (Topical)	975125	Hydrocortisone	e86a5293-312d-4425-bf95-35e4d7149aed	2015-04-21 00:00:00	\N	\N
1203	CORTISPORIN OINTMENT (Topical)	915175	Bacitracin	097a7a8d-04d4-4736-c8b7-0796117457bf	2015-04-03 00:00:00	\N	\N
1204	CORTISPORIN-TC (Otic)	901845	Colistin	0869fd8d-6dd7-4dc2-b33c-20d72dc47718	2015-06-26 00:00:00	\N	\N
1205	CORTIZONE-10 (Topical)	975125	Hydrocortisone	c0dccf64-44fd-4cbf-a9cd-50b3150ee205	2015-04-06 00:00:00	\N	\N
1206	CORTOMYCIN (Otic)	975125	Hydrocortisone	41cfa382-d4ae-43c5-83a5-1ecc635d109b	2009-12-02 00:00:00	\N	\N
1207	CORTOMYCIN OINTMENT (Ophthalmic)	915175	Bacitracin	7c50e7f2-1208-4f19-9807-4ab0dd314d3b	2010-12-02 00:00:00	\N	\N
1208	CORTROSYN (Injectable)	19008009	Cosyntropin	746856e9-3930-4f6a-b8e6-a03845d6dd0b	2015-05-19 00:00:00	\N	\N
1209	COSOPT (Ophthalmic)	981709	dorzolamide	06c062ca-add7-4ddf-ba7c-7b5dd531e9ec	2015-08-14 00:00:00	\N	\N
1210	Cosyntropin (Injectable)	19008009	Cosyntropin	39af194b-c854-4abf-893a-a47856fe42a1	2015-05-19 00:00:00	\N	\N
1211	COUMADIN (Injectable)	1310149	Warfarin	c0f238ff-2804-4150-9766-22a5111b4e74	2013-01-31 00:00:00	\N	\N
1212	COUMADIN (Oral Pill)	1310149	Warfarin	91fa852c-b43d-4a55-983b-74aa6827125d	2015-02-17 00:00:00	\N	\N
1213	COZAAR (Oral Pill)	1367500	Losartan	9199238d-8b24-4ca8-bd24-c200853416f6	2012-10-04 00:00:00	\N	\N
1214	CREOMULSION (Oral Liquid)	1119510	Dextromethorphan	0e810cf2-fdb9-4d32-be57-8046318fb029	2013-01-25 00:00:00	\N	\N
1215	CREON (Oral Pill)	919204	Amylases	45b9a46b-3294-4604-8aea-60624d663020	2012-05-29 00:00:00	\N	\N
1216	Cresol/Formaldehyde (Irrigation)	19087223	Cresol	6989bddc-910e-47e6-aa8f-619a330e81b8	2010-07-20 00:00:00	\N	\N
1217	CREST MOUTHWASH (Mouthwash)	989301	Cetylpyridinium	41dc2d29-376d-4e8e-84c0-acf0e6ad1205	2012-09-20 00:00:00	\N	\N
1218	CRESTOR (Oral Pill)	1510813	rosuvastatin	4f2f91bb-f119-4e29-8499-f36f436707b3	2015-09-28 00:00:00	\N	\N
1219	CRITIC-AID CLEAR (Topical)	907879	Miconazole	cbc5d976-850a-476e-b179-b7a5a8675524	2012-08-13 00:00:00	\N	\N
1220	CRITIC-AID CLEAR MOISTURE (Topical)	19033354	Petrolatum	0b6da97e-519b-4579-9895-f4ede5c48b47	2012-08-13 00:00:00	\N	\N
1221	CRITIC-AID SKIN (Paste)	911064	Zinc Oxide	caaac1f0-437d-4185-8670-9f11b9cefe63	2015-09-14 00:00:00	\N	\N
1222	CRIXIVAN (Oral Pill)	1711523	Indinavir	01c5574c-1056-49c6-af20-e950db3f4139	2012-06-18 00:00:00	\N	\N
1223	Cromolyn (Inhalant)	1152631	Cromolyn	8fe37a7a-edd6-4733-bb7e-e01c1906aeba	2012-09-27 00:00:00	\N	\N
1224	Cromolyn (Ophthalmic)	1152631	Cromolyn	5d8ed6be-ecc9-4e26-b6c1-4eaef46c0fa7	2015-08-05 00:00:00	\N	\N
1225	Cromolyn (Oral Liquid)	1152631	Cromolyn	169a439e-aa20-4cdf-bbe0-6b17934e8355	2015-06-09 00:00:00	\N	\N
1226	Crotamiton (Topical)	969276	crotamiton	56465446-7f78-4ad1-acb3-08a4d60e5715	2015-02-02 00:00:00	\N	\N
1227	Cultivated oat pollen extract (Injectable)	40161642	cultivated oat pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
1228	Cultivated rye grass pollen extract (Injectable)	40228147	cultivated rye grass pollen extract	c7d383a6-94b8-4101-8a4c-fa7747a21468	2009-11-19 00:00:00	\N	\N
1229	Cupric oxide/Folic Acid/Niacinamide/Zinc Oxide (Oral Pill)	19073229	Cupric oxide	91d306d7-ef63-4f35-84a4-36e8469eac98	2013-10-18 00:00:00	\N	\N
1230	CUPRIMINE (Oral Pill)	19028050	Penicillamine	80e736d3-2017-4d68-94b4-38255c3c59c6	2012-08-28 00:00:00	\N	\N
1231	CUTIVATE (Topical)	1149380	fluticasone	9953df12-a2b4-4d22-b204-746fc29f7a5f	2015-03-04 00:00:00	\N	\N
1232	CUVPOSA (Oral Liquid)	963353	Glycopyrrolate	d200bd44-9856-4104-a29e-a4cca3db6737	2013-06-10 00:00:00	\N	\N
1233	CYANOKIT (Injectable)	1377023	Hydroxocobalamin	416c7978-5661-6e63-6546-6f7265766572	2012-08-10 00:00:00	\N	\N
1234	Cyclobenzaprine (Oral Pill)	778711	cyclobenzaprine	54a6b01c-5a7c-4710-93fa-69fd2c2549e3	2015-09-30 00:00:00	\N	\N
1235	Cyclobenzaprine/Magnesium Oxide (Oral Pill)	778711	cyclobenzaprine	c2b6213c-3397-42cf-8080-59d6a5c31d0a	2010-07-20 00:00:00	\N	\N
1236	CYCLOGYL (Ophthalmic)	910232	Cyclopentolate	1d008c76-7210-4ace-90fa-7cd22762e12e	2011-08-05 00:00:00	\N	\N
1237	CYCLOMYDRIL (Ophthalmic)	910232	Cyclopentolate	8268b70f-3f10-48dd-bb24-baaeb27a1325	2015-10-09 00:00:00	\N	\N
1238	Cyclopentolate (Ophthalmic)	910232	Cyclopentolate	0504a84a-0ba4-483b-9682-9bf3818410ee	2013-02-08 00:00:00	\N	\N
1239	Cyclopentolate/Phenylephrine (Ophthalmic)	910232	Cyclopentolate	8268b70f-3f10-48dd-bb24-baaeb27a1325	2015-10-09 00:00:00	\N	\N
1240	Cyclophosphamide (Injectable)	1310317	Cyclophosphamide	591d9955-3d9c-4cdc-a308-2f1288376b9f	2015-06-24 00:00:00	\N	\N
1241	Cyclophosphamide (Oral Pill)	1310317	Cyclophosphamide	15d30249-4714-4b13-b8ca-5dff38424282	2015-05-13 00:00:00	\N	\N
1242	cycloSERINE (Oral Pill)	1710446	Cycloserine	0071f9f3-a29b-4ba6-9555-69f672501cbc	2013-09-10 00:00:00	\N	\N
1243	cycloSPORINE (Oral Pill)	19010482	Cyclosporine	a8e29b54-e4ab-4bb9-ab6c-e4414a3f025b	2015-10-06 00:00:00	\N	\N
1244	CYMBALTA (Oral Pill)	715259	duloxetine	67927928-c20f-4e12-a327-d26561d7810a	2015-04-30 00:00:00	\N	\N
1245	Cyproheptadine (Oral Liquid)	1110727	Cyproheptadine	54686520-506f-7765-7220-436f736d6963	2013-08-02 00:00:00	\N	\N
1246	Cyproheptadine (Oral Pill)	1110727	Cyproheptadine	f90faaa3-f40f-4653-8fb8-144d61c6b1d4	2014-07-08 00:00:00	\N	\N
1247	CYSTADANE (Oral Liquid)	1520218	Betaine	05964dae-8b84-467c-af97-c82706a3cad2	2007-05-17 00:00:00	\N	\N
1248	Cysteamine (Oral Pill)	910888	Cysteamine	b7b6e290-5168-46dc-9e7f-5995420ec1c1	2015-08-27 00:00:00	\N	\N
1249	Cysteine (Injectable)	19010955	Cysteine	85669228-2bb1-4095-b90e-a467d357b9bb	2011-10-17 00:00:00	\N	\N
1250	Cytarabine (Injectable)	1311078	Cytarabine	ee6decae-7e1b-45cf-b2d0-c15946d8fa1f	2015-04-29 00:00:00	\N	\N
1251	Cytarabine liposome (Injectable)	40175460	Cytarabine liposome	9d05d299-b9b0-4bf6-95cf-904dcc4e1f84	2015-01-09 00:00:00	\N	\N
1252	CYTOGAM (Injectable)	586491	cytomegalovirus immune globulin	d72d56e3-1f27-4ec1-a49d-7c0f8f5bc512	2012-12-19 00:00:00	\N	\N
1253	Cytomegalovirus immune globulin (Injectable)	586491	cytomegalovirus immune globulin	d72d56e3-1f27-4ec1-a49d-7c0f8f5bc512	2012-12-19 00:00:00	\N	\N
1254	CYTOMEL (Oral Pill)	1505346	Triiodothyronine	248d01a9-a79a-474a-b244-49b24e5b9873	2013-10-18 00:00:00	\N	\N
1255	CYTOTEC (Oral Pill)	1150871	Misoprostol	04c42f2b-d049-4892-b003-bdf346cb4ab4	2014-08-04 00:00:00	\N	\N
1256	CYTOVENE (Injectable)	1757803	Ganciclovir	38e8f819-985c-4d20-aafd-3ba953af26ca	2010-08-20 00:00:00	\N	\N
1257	Dabigatran etexilate (Oral Pill)	40228152	dabigatran etexilate	5db7f199-8752-4d24-85f7-e34ca8f4d02e	2011-04-14 00:00:00	\N	\N
1258	Dabrafenib (Oral Pill)	43532299	dabrafenib	803beaaa-33f9-48cc-9a95-c2e887e095b4	2015-02-02 00:00:00	\N	\N
1259	Dacarbazine (Injectable)	1311409	Dacarbazine	b6b97e41-5f15-498c-abfb-d8443ea4d216	2015-02-06 00:00:00	\N	\N
1260	DACOGEN (Injectable)	19024728	decitabine	acaf6e50-7cd3-4431-98ef-d1c07e3ed8c2	2014-10-02 00:00:00	\N	\N
1261	DALIRESP (Oral Pill)	40236897	Roflumilast	c9a1d0a8-581f-4f91-a2b8-f419192d0ebf	2015-07-01 00:00:00	\N	\N
1262	DALLERGY DROPS (Oral Liquid)	1192710	Chlorpheniramine	d7ef44ce-626d-41b3-8114-98d2ce1ae31a	2014-02-03 00:00:00	\N	\N
1263	DALLERGY REFORMULATED MAR 2014 (Oral Liquid)	990413	chlorcyclizine	16353978-488f-4248-908a-ad03eee60cbf	2014-06-03 00:00:00	\N	\N
1264	DALLERGY REFORMULATED MAR 2014 (Oral Pill)	990413	chlorcyclizine	f567b8ff-d476-4e14-838e-8f62467790cf	2014-02-03 00:00:00	\N	\N
1265	DALLERGY REFORMULATED NOV 2011 (Chewable)	990413	chlorcyclizine	70f9d9c5-6204-4ddc-be82-d6c9e59d70e5	2011-11-25 00:00:00	\N	\N
1266	DALLERGY REFORMULATED NOV 2011 (Oral Liquid)	990413	chlorcyclizine	5585cf36-d7e7-40ce-982e-e8c6a58e85d1	2013-01-08 00:00:00	\N	\N
1267	Dalteparin (Injectable)	1301065	Dalteparin	23527b8b-9b28-4e6d-9751-33b143975ac7	2015-09-08 00:00:00	\N	\N
1268	DANTRIUM (Injectable)	711714	Dantrolene	4df35098-8702-46be-ac67-30cfdf1aa570	2014-05-20 00:00:00	\N	\N
1269	DANTRIUM (Oral Pill)	711714	Dantrolene	57b4eec1-49e1-432c-95ae-0fe36e32d64b	2012-10-17 00:00:00	\N	\N
1270	Dantrolene (Injectable)	711714	Dantrolene	8f7b3ac0-604d-4c78-b545-5e0f8ea3d698	2014-12-23 00:00:00	\N	\N
1271	Dantrolene (Oral Pill)	711714	Dantrolene	57b4eec1-49e1-432c-95ae-0fe36e32d64b	2014-07-08 00:00:00	\N	\N
1272	Dapagliflozin (Oral Pill)	44785829	dapagliflozin	fc6ae30e-868b-4ac9-b69d-900922503998	2015-01-28 00:00:00	\N	\N
1273	Dapsone (Oral Pill)	1711759	Dapsone	aec21561-42bd-4706-86e6-ff0e1e915079	2013-09-24 00:00:00	\N	\N
1274	DAPTOmycin (Injectable)	1786617	Daptomycin	e33053a5-38cd-4a34-8566-208f94f55714	2015-06-25 00:00:00	\N	\N
1275	DARAPRIM (Oral Pill)	1760039	Pyrimethamine	5368616d-6520-6f6e-2053-686b72656c69	2015-10-05 00:00:00	\N	\N
1276	Dark leaved mugwort pollen extract (Injectable)	40170722	dark leaved mugwort pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
1277	Darunavir (Oral Pill)	1756831	darunavir	69b6f72d-fe6b-4347-8801-99ece7e2a29b	2013-05-29 00:00:00	\N	\N
1278	DARVON-N (Oral Pill)	1153664	Propoxyphene	c6c48eee-240b-4425-8691-35462523652e	2010-01-25 00:00:00	\N	\N
1279	Dasatinib (Oral Pill)	1358436	dasatinib	0e7f054c-7a27-4192-bd1c-6115d8be858f	2012-06-04 00:00:00	\N	\N
1280	Daunorubicin Liposomal (Injectable)	19051599	Daunorubicin Liposomal	bf2b4eaf-5227-42d9-af78-88d921e565f6	2012-05-23 00:00:00	\N	\N
1281	DAUNOXOME (Injectable)	19051599	Daunorubicin Liposomal	bf2b4eaf-5227-42d9-af78-88d921e565f6	2012-05-23 00:00:00	\N	\N
1282	DAYHIST-1 (Oral Pill)	1197677	Clemastine	1257b2e0-4ae6-4aab-b1f3-c93fd70116c6	2012-06-11 00:00:00	\N	\N
1283	DAYPRO (Oral Pill)	1118045	oxaprozin	755ca241-0d01-41ba-a735-e37365352a71	2013-01-29 00:00:00	\N	\N
1284	DDAVP (Injectable)	1517070	desmopressin	651f6fee-a2c7-431b-8d5d-58b156c72244	2015-03-05 00:00:00	\N	\N
1285	DDAVP (Nasal)	1517070	desmopressin	95e53e87-2d52-4e37-93ea-89f440938f7a	2012-07-20 00:00:00	\N	\N
1286	DDAVP (Oral Pill)	1517070	desmopressin	1bb9b8d5-eed6-45cb-b1b9-e43d3ee6fecd	2009-09-04 00:00:00	\N	\N
1287	DEBACTEROL (Mucosal)	991706	SULFONATED PHENOL	15d22ca4-503e-2751-e054-00144ff8d46c	2015-05-26 00:00:00	\N	\N
1288	DEBACTEROL (Topical)	991706	SULFONATED PHENOL	15d22ca4-503e-2751-e054-00144ff8d46c	2015-05-26 00:00:00	\N	\N
1289	DEBROX (Otic)	958999	carbamide peroxide	755d3234-2df4-4464-a2c5-b04276065fc5	2015-03-16 00:00:00	\N	\N
1290	DECARA (Oral Pill)	19095164	Cholecalciferol	3822c324-e22a-4ac4-ac1c-9b63983b516a	2014-02-03 00:00:00	\N	\N
1291	DECAVAC (Injectable)	529303	"diphtheria toxoid vaccine, inactivated"	f7faec1c-046f-45c9-b9c0-ef65d377ba87	2011-04-01 00:00:00	\N	\N
1292	Decitabine (Injectable)	19024728	decitabine	0b9599e8-9018-42ee-b247-e2a944c36510	2015-05-07 00:00:00	\N	\N
1293	DECONEX (Oral Pill)	1163944	Guaifenesin	51c84f58-f1b9-4fa8-916b-78c6eec61861	2012-03-23 00:00:00	\N	\N
1294	Deferiprone (Oral Pill)	19011091	deferiprone	dc8cbc3d-026c-0db5-42e8-8e93d374dd23	2015-04-02 00:00:00	\N	\N
1295	Deferoxamine (Injectable)	1711947	Deferoxamine	a7174843-5965-49fc-b842-f7eff7b48bbc	2012-09-07 00:00:00	\N	\N
1296	DELATESTRYL (Injectable)	1636780	Testosterone	67e2cc36-a379-11dc-8314-0800200c9a66	2015-05-20 00:00:00	\N	\N
1297	Delavirdine (Oral Pill)	1747157	Delavirdine	992306f0-c612-41dd-a4df-35d1fd360033	2011-07-07 00:00:00	\N	\N
1298	DELSYM COUGH PLUS CHEST CONGESTION DM (Oral Liquid)	1119510	Dextromethorphan	8252cdec-b668-4450-b045-e093479ab542	2014-11-20 00:00:00	\N	\N
1299	DELSYM COUGH RELIEF PLUS SOOTHING ACTION (Oral Lozenge)	1119510	Dextromethorphan	cac708a5-af6c-4c60-beb4-32e792f588c5	2012-07-02 00:00:00	\N	\N
1300	DELSYM NIGHT TIME COUGH AND COLD REFORMULATED JAN 2012 (Oral Liquid)	1125315	Acetaminophen	f8437225-5e77-4dae-82f5-e706f7965c53	2011-12-29 00:00:00	\N	\N
1301	DELTASONE (Oral Pill)	1551099	Prednisone	18bebd56-4848-32ae-e054-00144ff88e88	2015-08-17 00:00:00	\N	\N
1302	DEMADEX (Injectable)	942350	torsemide	cf288ad5-d4e7-4b0b-bfd0-41c5327e6984	2007-02-16 00:00:00	\N	\N
1303	DEMADEX (Oral Pill)	942350	torsemide	cf288ad5-d4e7-4b0b-bfd0-41c5327e6984	2007-02-16 00:00:00	\N	\N
1304	Demeclocycline (Oral Pill)	1714527	Demeclocycline	4ff23e3b-e111-47fd-9776-1d89d6da049b	2015-08-14 00:00:00	\N	\N
1305	DEMEROL (Injectable)	1102527	Meperidine	53ddfe26-5a7e-4f39-8904-829a03538f63	2011-12-30 00:00:00	\N	\N
1306	DEMEROL (Oral Pill)	1102527	Meperidine	6c2b41c3-732c-477f-8790-0eecea43b2da	2014-10-09 00:00:00	\N	\N
1307	DEMSER (Oral Pill)	1401581	Metyrosine	32fb2f2f-34b5-4cd5-9145-c3ab37c5ca92	2011-03-29 00:00:00	\N	\N
1308	DENAVIR (Topical)	981654	penciclovir	8d119057-f299-43ea-b516-e84a09cab890	2014-08-25 00:00:00	\N	\N
1309	DENDRACIN NEURODENDRAXCIN (Topical)	939881	Capsaicin	05742cd5-ece2-4007-bdf0-46b76d23df74	2015-02-06 00:00:00	\N	\N
1310	Denileukin diftitox (Injectable)	19051642	denileukin diftitox	42dfffb1-d0f3-42d5-944c-64f092fc436e	2013-03-26 00:00:00	\N	\N
1311	DENTA 5000 PLUS (Toothpaste)	19069022	Sodium Fluoride	00b09487-043e-4e8c-badd-116dc56eef15	2012-07-27 00:00:00	\N	\N
1312	DENTICARE DENTI FOAM (Oral Foam)	19069022	Sodium Fluoride	c92bb4ea-e7e0-49ec-8329-2cc215c35ab8	2010-07-20 00:00:00	\N	\N
1313	DENTICARE DENTI FREEZE GEL (Oral Gel)	917006	Benzocaine	8489b2e8-4647-4838-88b9-817b59ef83b0	2010-07-20 00:00:00	\N	\N
1314	DENTICARE DENTI FREEZE OINTMENT (Oral Ointment)	917006	Benzocaine	522754bc-5d11-48b1-99fd-1edcf3cd13fc	2010-07-20 00:00:00	\N	\N
1315	DENTICARE NEUTRAL (Mouthwash)	19069022	Sodium Fluoride	1da64824-9389-4109-bea9-b91600caf023	2010-07-19 00:00:00	\N	\N
1316	DENTICARE PRO GEL (Oral Gel)	19069022	Sodium Fluoride	b4dbb9f5-4355-4d85-ae8b-a46e4fb2af78	2014-04-30 00:00:00	\N	\N
1317	Deoxycorticosterone (Injectable)	19017895	Deoxycorticosterone	5e9f71f1-09d4-4313-ad66-5cfffe428ba8	2013-07-31 00:00:00	\N	\N
1318	DEPAKOTE (Oral Pill)	745466	Valproate	d3f7c414-db83-4a7a-a7aa-745c5606cdba	2013-05-16 00:00:00	\N	\N
1319	DEPO-ESTRADIOL (Injectable)	1548195	Estradiol	9a4229fd-fecd-4ac1-9c4f-6d442533457f	2013-08-20 00:00:00	\N	\N
1320	DEPO-MEDROL (Injectable)	1506270	Methylprednisolone	823b0010-2b57-4e76-b5ac-4a8c2963438f	2015-05-18 00:00:00	\N	\N
1321	DEPO-PROVERA (Injectable)	1500211	Medroxyprogesterone	2425f944-15d7-4b84-95a0-6538e843f130	2013-10-28 00:00:00	\N	\N
1322	DEPO-TESTOSTERONE (Injectable)	1636780	Testosterone	fe808a56-7542-4d23-97b4-d98a3ef63016	2015-08-10 00:00:00	\N	\N
1323	DEPOCYT (Injectable)	40175460	Cytarabine liposome	9d05d299-b9b0-4bf6-95cf-904dcc4e1f84	2015-01-09 00:00:00	\N	\N
1324	DEPODUR (Injectable)	19112635	Morphine Liposomal	cc8f105c-c8ee-4c57-86ee-ee6bf917cf78	2008-01-31 00:00:00	\N	\N
1325	DERMA GRAN (Topical)	985247	Aluminum Hydroxide	464bdaf6-e64b-401f-9d14-f6148bb16653	2013-11-14 00:00:00	\N	\N
1326	DERMA-SMOOTHE FS (Topical)	996541	fluocinolone	bc61c619-a71c-46f5-80f1-9e9ee71134aa	2013-08-27 00:00:00	\N	\N
1327	DERMACORT (Topical)	975125	Hydrocortisone	a0962a88-8a49-414c-aecf-db94ec033f16	2011-11-22 00:00:00	\N	\N
1328	DERMAREST ECZEMA (Topical)	975125	Hydrocortisone	0292ab62-5088-45fa-a056-70c2fcc19ef7	2012-05-25 00:00:00	\N	\N
1329	DERMAREST PSORIASIS (Topical)	964407	Salicylic Acid	aa786552-9ed8-41ef-aa20-0ac254555c41	2012-05-25 00:00:00	\N	\N
1330	DERMASORB AF (Topical)	980867	Clioquinol	b1f875e9-a95b-47ff-80cc-54a2d7a2c08c	2013-12-02 00:00:00	\N	\N
1331	DERMASORB HC (Topical)	975125	Hydrocortisone	eaaf8c06-6aac-4488-a4be-2f8912e30363	2013-11-14 00:00:00	\N	\N
1332	DERMASORB TA (Topical)	903963	Triamcinolone	5b1d1510-118f-4b82-9119-386d572971d2	2013-12-05 00:00:00	\N	\N
1333	DERMASORB XM (Topical)	906914	Urea	95e5f86e-897b-4ef9-a514-6b003387f84c	2013-11-14 00:00:00	\N	\N
1334	DERMATOP (Topical)	928110	prednicarbate	ccc7985a-da29-475f-8a53-0f76ba20b86d	2014-07-09 00:00:00	\N	\N
1335	DERMAZENE (Topical)	975125	Hydrocortisone	cc657bc6-31db-47cb-970d-796d77ccf0ed	2010-07-20 00:00:00	\N	\N
1336	DERMOPLAST ANTIBACTERIAL (Topical)	916802	Benzethonium	2fbb256e-6b36-4923-b57d-58575f5abf2e	2014-05-07 00:00:00	\N	\N
1337	DERMOPLAST PAIN (Topical)	917006	Benzocaine	0648c46c-a3db-4b82-971b-50a46098ac7e	2014-05-07 00:00:00	\N	\N
1338	DERMOTIC (Otic)	996541	fluocinolone	d2ffb64b-1614-4e2f-8125-9660ea3754f2	2012-03-09 00:00:00	\N	\N
1339	DESENEX (Topical)	907879	Miconazole	c2ec4973-07d6-480f-b47a-ac57b4b703f1	2012-12-05 00:00:00	\N	\N
1340	DESFERAL (Injectable)	1711947	Deferoxamine	a7174843-5965-49fc-b842-f7eff7b48bbc	2012-09-07 00:00:00	\N	\N
1341	Desflurane (Inhalant)	19002770	desflurane	7f977eb6-c7c4-4dc5-ab3b-07414dbe5da5	2015-03-11 00:00:00	\N	\N
1342	Desipramine (Oral Pill)	716968	Desipramine	7500ac1b-a1ca-46ed-8f4e-5998310c676e	2015-09-01 00:00:00	\N	\N
1343	DESITIN (Topical)	911064	Zinc Oxide	bee0ed35-a0ca-45d4-9fed-b890369e323e	2015-07-16 00:00:00	\N	\N
1344	Desloratadine (Oral Disintegrating)	1103006	desloratadine	84b20dcb-e15b-44a2-b692-1eea5adb996e	2015-05-05 00:00:00	\N	\N
1345	Desloratadine (Oral Pill)	1103006	desloratadine	91ce2b02-8f8e-4929-a962-b8f88a40b70a	2015-10-05 00:00:00	\N	\N
1346	Desmopressin (Injectable)	1517070	desmopressin	fd7672cb-4c15-403c-8e04-68369ad9bb77	2015-05-07 00:00:00	\N	\N
1347	Desmopressin (Nasal)	1517070	desmopressin	c9e4aedb-27d6-4499-9245-93937d3a375f	2015-08-10 00:00:00	\N	\N
1348	Desmopressin (Oral Pill)	1517070	desmopressin	7a26b415-77cd-4b2f-9c76-fa52d2eb6be6	2015-09-28 00:00:00	\N	\N
1349	Desogestrel/Ethinyl Estradiol (Oral Pill)	1588000	Desogestrel	fed687f4-1ffa-49ec-92c9-4d09de17a833	2015-09-03 00:00:00	\N	\N
1350	DESONATE (Topical)	917205	Desonide	8d7c46ed-e6c3-465b-be3d-16ecab43a9e7	2014-08-07 00:00:00	\N	\N
1351	Desonide (Topical)	917205	Desonide	a7e5f030-b849-4805-94e6-f45631eaa37f	2015-08-06 00:00:00	\N	\N
1352	DESOWEN (Topical)	917205	Desonide	a7e5f030-b849-4805-94e6-f45631eaa37f	2015-04-30 00:00:00	\N	\N
1353	Desoximetasone (Topical)	917336	Desoximetasone	950f08b4-467f-4f01-ab99-834cac94875e	2015-10-06 00:00:00	\N	\N
1354	DESOXYN (Oral Pill)	704053	Methamphetamine	f03a68d5-ed00-8a2d-af68-28be909ea85f	2015-03-03 00:00:00	\N	\N
1355	DESPEC REFORMULATED JUN 2008 (Oral Liquid)	1163944	Guaifenesin	5e7c3fe6-ea77-4472-8a4c-4a015ad01fd5	2014-05-06 00:00:00	\N	\N
1356	DESQUAM (Soap)	918172	Benzoyl Peroxide	0e775c30-7294-4e99-bcc5-3b3b01a62fc5	2011-06-02 00:00:00	\N	\N
1357	DETROL (Oral Pill)	913782	tolterodine	fa938543-29b3-46ce-a176-5563bc8f2f80	2011-08-02 00:00:00	\N	\N
1358	DEWEES CARMINATIVE (Oral Liquid)	908464	magnesium carbonate	163bceeb-ca74-413e-88b9-5c7bc9bbeb0d	2014-03-12 00:00:00	\N	\N
1359	Dexamethasone (Injectable)	1518254	Dexamethasone	685c33e5-c6e0-4717-b3bb-4c2cd0fcb063	2015-07-06 00:00:00	\N	\N
1360	Dexamethasone (Ophthalmic)	1518254	Dexamethasone	863fb43c-dd33-485b-9385-744db7a98b83	2014-12-16 00:00:00	\N	\N
1361	Dexamethasone (Oral Liquid)	1518254	Dexamethasone	a817ab46-54ec-4e3f-886b-04ce6ac1caf9	2015-04-27 00:00:00	\N	\N
1362	Dexamethasone (Oral Pill)	1518254	Dexamethasone	428cc7bb-e0f9-466c-b38f-11ac22cda752	2015-08-27 00:00:00	\N	\N
1363	Dexamethasone/Neomycin/Polymyxin B (Ophthalmic)	1518254	Dexamethasone	449a6fd8-c2ac-40d0-b74a-e5c7fc6670f3	2015-08-17 00:00:00	\N	\N
1364	Dexamethasone/Tobramycin (Ophthalmic)	1518254	Dexamethasone	1b6887e4-9deb-494a-939d-49ce77ef2c1b	2015-09-30 00:00:00	\N	\N
1365	Dexbrompheniramine (Chewable)	1188052	dexbrompheniramine	f0b90cc2-901c-4498-b892-d8883182b6fd	2014-08-13 00:00:00	\N	\N
1366	Dexbrompheniramine (Oral Pill)	1188052	dexbrompheniramine	0d203b5c-8b10-428b-8703-17be6b4ce6eb	2015-02-23 00:00:00	\N	\N
1367	Dexbrompheniramine/Dextromethorphan/Phenylephrine (Oral Liquid)	1188052	dexbrompheniramine	a3b34f38-87da-4a38-ac73-66d28cc8647e	2012-01-26 00:00:00	\N	\N
1368	Dexbrompheniramine/Phenylephrine (Oral Liquid)	1188052	dexbrompheniramine	16353978-488f-4248-908a-ad03eee60cbf	2014-06-03 00:00:00	\N	\N
1369	Dexbrompheniramine/Phenylephrine (Oral Pill)	1188052	dexbrompheniramine	f567b8ff-d476-4e14-838e-8f62467790cf	2014-02-03 00:00:00	\N	\N
1370	Dexbrompheniramine/Pseudoephedrine (Oral Pill)	1188052	dexbrompheniramine	82f9f52c-797e-4842-9c9a-40213181d99a	2012-06-19 00:00:00	\N	\N
1371	Dexchlorpheniramine (Oral Liquid)	1188114	dexchlorpheniramine	1950f4d6-7fc2-44cd-9f7d-1359315353fc	2012-09-19 00:00:00	\N	\N
1372	Dexchlorpheniramine/Phenylephrine (Oral Pill)	1188114	dexchlorpheniramine	c1d6e914-74cc-4cdf-9587-7eaaa4a386e5	2013-04-01 00:00:00	\N	\N
1373	Dexchlorpheniramine/Pseudoephedrine (Oral Liquid)	1188114	dexchlorpheniramine	93e0411b-68c2-4b5c-aa74-b1d94b5b2206	2015-08-28 00:00:00	\N	\N
1374	Dexchlorpheniramine/Pseudoephedrine (Oral Pill)	1188114	dexchlorpheniramine	9d08d801-6cca-4a1c-ab53-5979f16e3110	2012-03-30 00:00:00	\N	\N
1375	DEXEDRINE (Oral Pill)	719311	Dextroamphetamine	9ee6fd99-88ea-4cea-8370-a8945581325f	2015-03-04 00:00:00	\N	\N
1376	DEXFERRUM (Injectable)	1381661	Iron-Dextran Complex	77f5ae2a-8cd3-4f01-bddd-8158f932c8db	2014-04-04 00:00:00	\N	\N
1377	DEXILANT (Oral Pill)	19039926	dexlansoprazole	d62d754e-2310-4912-b022-603ae925710d	2012-02-15 00:00:00	\N	\N
1378	Dexlansoprazole (Oral Pill)	19039926	dexlansoprazole	d62d754e-2310-4912-b022-603ae925710d	2012-02-15 00:00:00	\N	\N
1379	Dexmedetomidine (Injectable)	19061088	Dexmedetomidine	c1b8eb58-596b-481d-beb6-ba9d2237abf4	2015-09-28 00:00:00	\N	\N
1380	Dexmethylphenidate (Oral Pill)	731533	dexmethylphenidate	07efe5d5-9857-490a-9a31-9dd07ea9386e	2015-09-29 00:00:00	\N	\N
1381	Dexpanthenol (Injectable)	988294	dexpanthenol	0ed47f4b-5182-40b7-a440-9e7b06819d95	2014-09-12 00:00:00	\N	\N
1382	Dexpanthenol/Niacinamide/Riboflavin/Thiamine/Vitamin B6 (Injectable)	988294	dexpanthenol	282ccec8-9bcd-4571-9b91-bbb96ef2620d	2015-08-14 00:00:00	\N	\N
1383	Dexrazoxane (Injectable)	1353011	Dexrazoxane	77702d60-d1ea-4e4c-a837-aaa813b66064	2015-06-25 00:00:00	\N	\N
1384	Dextran 70/Hypromellose (Ophthalmic)	1319156	Dextran 70	9dba4117-a6e1-40ef-ab9e-b2f21e032766	2015-09-17 00:00:00	\N	\N
1385	Dextran 70/Polyethylene Glycol 400/Povidone/Tetrahydrozoline (Ophthalmic)	1319156	Dextran 70	593d1899-6c87-4366-9c1b-9f6933598b8a	2014-12-23 00:00:00	\N	\N
1386	Dextroamphetamine (Oral Liquid)	719311	Dextroamphetamine	7658071e-ee2c-4d23-94ce-1906959ec036	2015-09-24 00:00:00	\N	\N
1387	Dextroamphetamine (Oral Pill)	719311	Dextroamphetamine	d6394df5-f2c9-47eb-b57e-f3e9cfd94f84	2015-09-30 00:00:00	\N	\N
1388	Dextroamphetamine XR (Oral Pill)	719311	Dextroamphetamine	669a308e-ce09-4ac8-84d9-ee252c5d3223	2015-06-05 00:00:00	\N	\N
1389	Dextromethorphan (Oral Liquid)	1119510	Dextromethorphan	4edc0605-25fc-4a66-8f68-798d1d71446b	2015-10-01 00:00:00	\N	\N
1390	Dextromethorphan (Oral Lozenge)	1119510	Dextromethorphan	00ad5b08-5371-4a2f-be49-4254106d7f64	2011-12-28 00:00:00	\N	\N
1391	Dextromethorphan (Oral Pill)	1119510	Dextromethorphan	76118c4c-3008-4173-b114-a8a5553243e3	2015-08-28 00:00:00	\N	\N
1392	Dextromethorphan XR (Oral Liquid)	1119510	Dextromethorphan	5d12a1b8-f1fb-41ca-9a4f-0595a585cbb5	2015-07-30 00:00:00	\N	\N
1393	Dextromethorphan/Doxylamine (Oral Liquid)	1119510	Dextromethorphan	d26d12d6-b44a-4f33-bf8b-bc0f9c55d2fe	2015-07-31 00:00:00	\N	\N
1451	DILANTIN (Oral Pill)	740910	Phenytoin	0c2e0671-bb5e-4704-a242-83c5b9a0bbb0	2011-07-08 00:00:00	\N	\N
1394	Dextromethorphan/Doxylamine/Pseudoephedrine (Oral Liquid)	1119510	Dextromethorphan	784843f7-2d13-4831-a50d-d109a371966d	2014-07-16 00:00:00	\N	\N
1395	Dextromethorphan/guaiFENesin (Oral Granules)	1119510	Dextromethorphan	98679846-e383-4341-96a7-7df2a35ca5ff	2014-11-24 00:00:00	\N	\N
1396	Dextromethorphan/guaiFENesin (Oral Liquid)	1119510	Dextromethorphan	6cbf83f6-cbf4-4e5b-a383-6d71124547bc	2015-10-02 00:00:00	\N	\N
1397	Dextromethorphan/guaiFENesin (Oral Pill)	1119510	Dextromethorphan	64797c73-2a3b-4cff-9311-c0eb663872c2	2015-09-16 00:00:00	\N	\N
1398	Dextromethorphan/guaiFENesin/Phenylephrine (Oral Liquid)	1119510	Dextromethorphan	f8c86c63-281b-40dc-9f64-ba88961bd906	2015-09-29 00:00:00	\N	\N
1399	Dextromethorphan/guaiFENesin/Phenylephrine (Oral Pill)	1119510	Dextromethorphan	5fd655a8-f298-4d35-80df-933c165568aa	2015-08-11 00:00:00	\N	\N
1400	Dextromethorphan/guaiFENesin/Pseudoephedrine (Oral Liquid)	1119510	Dextromethorphan	18b42a89-22b9-46d6-9a08-8642b7bbca5e	2015-08-31 00:00:00	\N	\N
1401	Dextromethorphan/guaiFENesin/Pseudoephedrine (Oral Pill)	1119510	Dextromethorphan	18043cd4-1062-6059-e054-00144ff88e88	2015-06-10 00:00:00	\N	\N
1402	Dextromethorphan/Menthol (Oral Lozenge)	1119510	Dextromethorphan	cac708a5-af6c-4c60-beb4-32e792f588c5	2014-05-21 00:00:00	\N	\N
1403	Dextromethorphan/Phenylephrine (Oral Liquid)	1119510	Dextromethorphan	20e45243-3989-413a-bcf1-49d754ff2e44	2015-09-03 00:00:00	\N	\N
1404	Dextromethorphan/Phenylephrine/Pyrilamine (Oral Liquid)	1119510	Dextromethorphan	3b5ca328-d462-490d-a28d-8a1a47299668	2015-03-13 00:00:00	\N	\N
1405	Dextromethorphan/Phenylephrine/Pyrilamine (Oral Pill)	1119510	Dextromethorphan	480b04c4-40ee-41d7-842b-d53ba074dcb8	2012-05-23 00:00:00	\N	\N
1406	Dextromethorphan/Phenylephrine/Thonzylamine (Oral Liquid)	1119510	Dextromethorphan	d1c74d4c-71bb-4934-9a4e-556366c07fca	2015-02-23 00:00:00	\N	\N
1407	Dextromethorphan/Phenylephrine/Triprolidine (Oral Liquid)	1119510	Dextromethorphan	836d062c-29f0-4fd7-b65c-771a3bbd52c4	2014-03-19 00:00:00	\N	\N
1408	Dextromethorphan/Promethazine (Oral Liquid)	1119510	Dextromethorphan	c13f5f93-d291-4d0d-80fe-44dba4c5401e	2015-06-12 00:00:00	\N	\N
1409	DHE-45 (Injectable)	1126557	Dihydroergotamine	aec0308f-f583-4e27-9bb8-21800bde7faa	2015-01-02 00:00:00	\N	\N
1410	DHS ZINC (Shampoo)	944360	zinc pyrithione	62e13b0d-2455-46c2-bff3-1aa88b092327	2015-03-16 00:00:00	\N	\N
1411	DI-DAK-SOL (Topical)	44784806	Hypochlorite	fdf5975e-20fa-41e4-8cd6-3d1d7c7b2d2c	2010-10-09 00:00:00	\N	\N
1412	DIABETIC TUSSIN DM (Oral Liquid)	1119510	Dextromethorphan	e70bcb6c-6ffb-474f-b388-7a6c8cc8c146	2014-11-12 00:00:00	\N	\N
1413	DIAMODE (Oral Pill)	991876	Loperamide	069e7979-a223-4819-b6cf-ea2731bf156b	2015-04-30 00:00:00	\N	\N
1414	Diazepam (Injectable)	723013	Diazepam	0fb9bdfb-4d92-483e-acfe-4c9b2a84441c	2015-04-29 00:00:00	\N	\N
1415	Diazepam (Oral Liquid)	723013	Diazepam	78d5a77d-5ca7-4f16-b4d0-fce86456593c	2012-03-02 00:00:00	\N	\N
1416	Diazepam (Oral Pill)	723013	Diazepam	66ea2936-8b6c-4b72-b077-ecf88e83fee7	2015-09-23 00:00:00	\N	\N
1417	Diazoxide (Oral Liquid)	1523280	Diazoxide	b16c7832-2fd9-49af-b923-1dc0d91fd6e2	2015-10-05 00:00:00	\N	\N
1418	Dibasic potassium phosphate/Potassium phosphate (Injectable)	19076714	Dibasic potassium phosphate	e7d6dfe1-d8ad-4daf-9c6a-5f42e3e19138	2014-07-01 00:00:00	\N	\N
1419	Dibucaine (Rectal)	923840	Dibucaine	bcf33951-d3a4-46c5-b208-56adc0011047	2014-01-22 00:00:00	\N	\N
1420	Dibucaine (Topical)	923840	Dibucaine	fc11a231-1d2f-42ba-8ece-34495a14ab44	2014-09-05 00:00:00	\N	\N
1421	Diclofenac (Ophthalmic)	1124300	Diclofenac	980b3b80-44cb-44b5-89cc-d451a3b20ae3	2015-04-03 00:00:00	\N	\N
1422	Diclofenac (Oral Liquid)	1124300	Diclofenac	d7335594-50c9-4ae2-a3e3-b9a375187b62	2012-04-02 00:00:00	\N	\N
1423	Diclofenac (Oral Pill)	1124300	Diclofenac	7a7e69c1-6eea-4f27-b2ed-3e5fb176fdae	2015-09-04 00:00:00	\N	\N
1424	Diclofenac (Topical)	1124300	Diclofenac	43d7d5d1-a593-4b97-ae24-f3e92be90004	2015-09-03 00:00:00	\N	\N
1425	Diclofenac/Misoprostol (Oral Pill)	1124300	Diclofenac	27ccf64c-fc2b-44d3-bf57-397417b406f8	2015-08-06 00:00:00	\N	\N
1426	Dicloxacillin (Oral Pill)	1724666	Dicloxacillin	24e821aa-85b8-4f5a-aa13-83ff132952ca	2015-02-17 00:00:00	\N	\N
1427	Dicyclomine (Oral Liquid)	924724	Dicyclomine	d59fa254-7959-47c9-bb77-ab7946a1a127	2015-05-08 00:00:00	\N	\N
1428	Dicyclomine (Oral Pill)	924724	Dicyclomine	b8c72fd8-6030-4c0a-80a6-d36cf698a576	2015-08-20 00:00:00	\N	\N
1429	Didanosine (Oral Pill)	1724869	Didanosine	79d6a5ea-77d3-4547-aa67-1b465141b1f5	2015-04-27 00:00:00	\N	\N
1430	DIDREX (Oral Pill)	719128	Benzphetamine	fe6d8813-25d9-4e56-84c7-ca6c3111a19a	2014-12-15 00:00:00	\N	\N
1431	Dienogest/Estradiol (Oral Pill)	19054876	dienogest	02c91fba-9c47-43ef-ac78-e82369798834	2015-09-15 00:00:00	\N	\N
1432	Diethylpropion (Oral Pill)	725822	Diethylpropion	31b58e5e-60af-4466-bd20-4b648e867e64	2014-12-22 00:00:00	\N	\N
1433	DIFFERIN (Topical)	981774	adapalene	e616d076-9e99-46ea-b69a-585867334142	2013-12-18 00:00:00	\N	\N
1434	DIFICID (Oral Pill)	40239985	fidaxomicin	dd966338-c820-4270-b704-09ef75fa3ceb	2014-05-30 00:00:00	\N	\N
1435	Diflorasone (Topical)	960988	Diflorasone	5b92dbac-3f28-4c72-b529-7455e1b7b366	2015-09-02 00:00:00	\N	\N
1436	DIFLUCAN (Oral Pill)	1754994	Fluconazole	9d45bff1-5615-4be0-8b7e-d749f919ea36	2013-02-21 00:00:00	\N	\N
1437	Diflunisal (Oral Pill)	1126128	Diflunisal	3baf108a-e9c1-4a2a-8e69-34aa69af1de3	2015-06-03 00:00:00	\N	\N
1438	DIGIFAB (Injectable)	19045317	digoxin antibodies Fab fragments	c05ee6a5-c98b-45f4-83fd-40781639d653	2015-07-29 00:00:00	\N	\N
1439	DIGITEK (Oral Pill)	1326303	Digoxin	de7843bb-2cbd-4a76-8cd7-838ed1a12826	2015-06-23 00:00:00	\N	\N
1440	DIGOX (Oral Pill)	1326303	Digoxin	d2b7a781-8ef2-482b-b359-ef47d12f3e8e	2014-10-17 00:00:00	\N	\N
1441	Digoxin (Injectable)	1326303	Digoxin	58678fd6-afe3-4a4c-a37f-356444194cd6	2013-01-15 00:00:00	\N	\N
1442	Digoxin (Oral Liquid)	1326303	Digoxin	7b03a2d7-f17c-4954-85c9-fb78cfec7d76	2014-08-12 00:00:00	\N	\N
1443	Digoxin (Oral Pill)	1326303	Digoxin	73b5f256-f362-4206-a021-db117930ff53	2015-10-01 00:00:00	\N	\N
1444	Digoxin antibodies Fab fragments (Injectable)	19045317	digoxin antibodies Fab fragments	c05ee6a5-c98b-45f4-83fd-40781639d653	2015-07-29 00:00:00	\N	\N
1445	Dihematoporphyrin Ether (Injectable)	19089602	Dihematoporphyrin Ether	f5fdda24-da7d-4e61-936e-9d1a55056b82	2015-04-29 00:00:00	\N	\N
1446	Dihydrocodeine/guaiFENesin (Oral Liquid)	1189596	dihydrocodeine	61e61344-bf91-4742-be57-d74b30cfa4ad	2012-02-24 00:00:00	\N	\N
1447	Dihydrocodeine/guaiFENesin/Phenylephrine (Oral Liquid)	1189596	dihydrocodeine	a3d94294-e66b-4384-9e9a-489a98bd5964	2010-07-20 00:00:00	\N	\N
1448	Dihydroergotamine (Injectable)	1126557	Dihydroergotamine	fe826e6a-75c8-43ed-9c36-f8263ec35aff	2015-01-02 00:00:00	\N	\N
1449	Dihydroergotamine (Nasal)	1126557	Dihydroergotamine	977de209-c53a-4cb4-9f3f-1e850600a9dc	2013-03-20 00:00:00	\N	\N
1450	DILANTIN (Chewable)	740910	Phenytoin	95d29970-f8ef-4799-b489-ebe2285de4de	2013-04-19 00:00:00	\N	\N
1452	DILANTIN XR (Oral Pill)	740910	Phenytoin	ecab970d-83e9-4aad-92de-dbb73d7a151f	2015-05-21 00:00:00	\N	\N
1453	DILATRATE XR (Oral Pill)	1383925	Isosorbide Dinitrate	2a4cd065-a1dd-4b88-9f7a-7ba93502f972	2014-11-10 00:00:00	\N	\N
1454	DILAUDID (Injectable)	1126658	Hydromorphone	c88f81ac-1643-4c08-ae2c-63cbe956db7e	2015-09-10 00:00:00	\N	\N
1455	DILAUDID (Oral Liquid)	1126658	Hydromorphone	3afae8b9-bb24-447a-bc7f-041c8326a438	2013-07-29 00:00:00	\N	\N
1456	DILAUDID (Oral Pill)	1126658	Hydromorphone	4daba60f-af60-4c7e-916e-f2ad7e7532c5	2013-07-29 00:00:00	\N	\N
1457	Diltiazem (Injectable)	1328165	Diltiazem	f5ea3383-5da4-4219-9802-3737a2eaeef4	2015-01-12 00:00:00	\N	\N
1458	Diltiazem (Oral Pill)	1328165	Diltiazem	a174f7b4-4b61-4f8f-b0ec-44b8eb8826e1	2015-07-16 00:00:00	\N	\N
1459	dimenhyDRINATE (Chewable)	928744	Dimenhydrinate	09936316-8667-4950-b017-19e3a05385a4	2013-01-16 00:00:00	\N	\N
1460	dimenhyDRINATE (Injectable)	928744	Dimenhydrinate	bc71539e-1a33-4709-8a24-c2894e8dbc1c	2012-01-26 00:00:00	\N	\N
1461	dimenhyDRINATE (Oral Pill)	928744	Dimenhydrinate	14ccdb11-5706-4007-aa27-a60ef3f09ce7	2015-09-08 00:00:00	\N	\N
1462	Dimercaprol (Injectable)	1728903	Dimercaprol	bee9a137-160f-47e8-a551-ca461ae4f51e	2012-05-01 00:00:00	\N	\N
1463	DIMETAPP COLD (Chewable)	1130863	Brompheniramine	655b4796-6ffc-c27f-b66e-d2ae0c7ad053	2010-10-09 00:00:00	\N	\N
1464	DIMETAPP LONG ACTING COUGH PLUS COLD (Oral Liquid)	1192710	Chlorpheniramine	059a3e6e-ea98-b0c5-ba27-b7cbbdedc917	2010-10-09 00:00:00	\N	\N
1465	DIMETAPP NIGHTTIME COLD & CONGESTION (Oral Liquid)	1129625	Diphenhydramine	df83f907-4695-7257-f503-6e92dc97a2f2	2010-10-09 00:00:00	\N	\N
1466	Dimethicone (Topical)	916662	dimethicone	3b0aacd3-348d-4d47-93c6-c56ea3b94ce7	2015-10-01 00:00:00	\N	\N
1467	Dimethicone/Menthol (Topical)	916662	dimethicone	33cc1470-f0c2-4e25-bc49-ca23e3b195f0	2014-09-17 00:00:00	\N	\N
1468	Dimethicone/Menthol/Pramoxine (Topical)	916662	dimethicone	7c0f98df-6900-4fe5-abee-8378799ea754	2014-06-19 00:00:00	\N	\N
1469	Dimethicone/Miconazole/Zinc Oxide (Topical)	916662	dimethicone	4114c685-acd1-4c65-842b-1cb7840852dc	2011-11-16 00:00:00	\N	\N
1470	Dimethicone/Petrolatum (Topical)	916662	dimethicone	0b5753aa-b591-4d6e-8341-fcc9456299b6	2013-12-23 00:00:00	\N	\N
1471	Dimethicone/Pramoxine (Topical)	916662	dimethicone	d5a58662-a628-4e3d-b2f9-b9c7ac12f772	2011-12-14 00:00:00	\N	\N
1472	Dimethicone/Zinc Oxide (Topical)	916662	dimethicone	54d7250e-6aaa-4fc8-88b3-2fee58ebaf73	2014-06-20 00:00:00	\N	\N
1473	Dimethyl Sulfoxide (Irrigation)	928980	Dimethyl Sulfoxide	58b25d79-78f2-4953-b0c6-61658dc4ef0d	2013-06-04 00:00:00	\N	\N
1474	Dinoprost (Injectable)	19029421	Dinoprost	069a7c28-5442-4fb7-83a1-bcf6ce147a21	2014-05-07 00:00:00	\N	\N
1475	Dinoprostone (Implant)	1329415	Dinoprostone	f1391c7c-233e-44d8-8838-36cc12f01044	2015-09-29 00:00:00	\N	\N
1476	Dinoprostone (Vaginal)	1329415	Dinoprostone	fae013fc-e199-43f3-86ef-66d34017c534	2014-10-30 00:00:00	\N	\N
1477	DIOVAN (Oral Pill)	1308842	valsartan	9e70df98-38fe-4634-a49c-c5f0b562e0b7	2014-08-25 00:00:00	\N	\N
1478	DIOVAN HCT (Oral Pill)	974166	Hydrochlorothiazide	1bbdcc66-c8c0-4710-a447-d12cc78b5aa8	2013-10-18 00:00:00	\N	\N
1479	DIPENTUM (Oral Pill)	916282	olsalazine	75a96561-6f52-4c11-a105-391fbbfe4827	2007-10-10 00:00:00	\N	\N
1480	DIPHENHIST (Oral Pill)	1129625	Diphenhydramine	ae7957ee-72b3-46f8-966c-526ac894af92	2015-01-15 00:00:00	\N	\N
1481	diphenhydrAMINE (Chewable)	1129625	Diphenhydramine	b06d03d1-3d61-4a46-91f4-5e3ad2e8b2b1	2015-08-12 00:00:00	\N	\N
1482	diphenhydrAMINE (Injectable)	1129625	Diphenhydramine	4c40fb96-819a-4e11-9500-f11cbd51fd6c	2015-07-27 00:00:00	\N	\N
1483	diphenhydrAMINE (Oral Disintegrating)	1129625	Diphenhydramine	826c5868-c9bf-42b2-a97e-2e7ae6fae057	2015-07-02 00:00:00	\N	\N
1484	diphenhydrAMINE (Oral Liquid)	1129625	Diphenhydramine	bea08963-16c9-4c27-b0d6-5734b91a3900	2015-10-01 00:00:00	\N	\N
1485	diphenhydrAMINE (Oral Pill)	1129625	Diphenhydramine	a19f1edc-d2cf-45fc-8233-d882441b0247	2015-10-13 00:00:00	\N	\N
1486	diphenhydrAMINE (Topical)	1129625	Diphenhydramine	baa7ae0b-dfce-4f56-a26b-5bfe31099b66	2014-09-30 00:00:00	\N	\N
1487	DiphenhydrAMINE/Ibuprofen (Oral Pill)	1129625	Diphenhydramine	3cc319ee-4908-4739-887c-8c5131208368	2015-09-14 00:00:00	\N	\N
1488	DiphenhydrAMINE/Naproxen (Oral Pill)	1129625	Diphenhydramine	82891458-ab0d-459a-8602-dcebd22c3010	2014-10-01 00:00:00	\N	\N
1489	DiphenhydrAMINE/Phenylephrine (Oral Liquid)	1129625	Diphenhydramine	40ae8bfc-4007-4483-bb08-cf32f2e802c6	2015-09-28 00:00:00	\N	\N
1490	DiphenhydrAMINE/Phenylephrine (Oral Pill)	1129625	Diphenhydramine	d5cbf5f5-746a-443c-9fa4-b3a7745d0dab	2015-04-02 00:00:00	\N	\N
1491	DiphenhydrAMINE/Pramoxine (Topical)	1129625	Diphenhydramine	70c5bb8c-24d2-448b-a3b1-92c7f4754614	2011-12-06 00:00:00	\N	\N
1492	DiphenhydrAMINE/Zinc Acetate (Topical)	1129625	Diphenhydramine	020e139a-6f0a-4c18-8169-d95e9b5dc7f4	2015-10-01 00:00:00	\N	\N
1493	"Diphtheria toxoid vaccine, inactivated/Tetanus toxoid vaccine, inactivated (Injectable)"	529303	"diphtheria toxoid vaccine, inactivated"	ce88effe-7ff2-418f-acb3-3cb5d5d2bf95	2015-07-01 00:00:00	\N	\N
1494	DIPRIVAN (Injectable)	753626	Propofol	e3105799-a4b6-f3f4-e6e2-b2b29bbdb538	2014-06-18 00:00:00	\N	\N
1495	DIPROLENE (Topical)	920458	Betamethasone	dbe069ce-f93e-4f67-bcb2-dfbb932a1f15	2015-09-11 00:00:00	\N	\N
1496	Dipyridamole (Injectable)	1331270	Dipyridamole	c76c3c6f-c3e0-4e35-ab01-5468585e0d9d	2012-07-09 00:00:00	\N	\N
1497	Dipyridamole (Oral Pill)	1331270	Dipyridamole	dcf785b2-e923-43bf-93bb-00a9501479f4	2015-02-12 00:00:00	\N	\N
1498	DISALCID (Oral Pill)	1137460	Salsalate	30371119-beaf-4ade-a9d5-12adc09f7827	2014-10-02 00:00:00	\N	\N
1499	Disopyramide (Oral Pill)	1335606	Disopyramide	f5e0c230-db38-4476-8357-9a227ccff1bc	2014-08-15 00:00:00	\N	\N
1500	Disulfiram (Oral Pill)	735850	Disulfiram	f0ca0e1f-9641-48d5-9367-e5d1069e8680	2015-03-06 00:00:00	\N	\N
1501	DIUREX (Oral Pill)	1134439	Caffeine	e02a39f9-1c8c-4d38-b394-3f5b7062932c	2012-09-04 00:00:00	\N	\N
1502	DIUREX AQUAGELS (Oral Pill)	1172206	pamabrom	22122002-c367-480b-b9f5-0504f918cc98	2015-08-07 00:00:00	\N	\N
1503	DIUREX MAX (Oral Pill)	1172206	pamabrom	37dfece3-d570-4ab2-ba95-af6eb1f3acd4	2010-10-09 00:00:00	\N	\N
1504	DIURIL (Injectable)	992590	Chlorothiazide	1d9fa4e6-6516-45cd-a316-292c6a529ecc	2012-08-13 00:00:00	\N	\N
1505	DIVIGEL (Topical)	1548195	Estradiol	22191eca-c98d-4a07-844e-11edb0f04b8d	2014-11-06 00:00:00	\N	\N
1506	DOAN'S (Oral Pill)	1168079	Magnesium Salicylate	d98ee9c8-40e2-4abb-b5c1-45e73e7dd23b	2013-06-28 00:00:00	\N	\N
1507	DOBUTamine (Injectable)	1337720	Dobutamine	a0882db1-2532-4b80-b753-68f013fe79e7	2014-11-12 00:00:00	\N	\N
1508	DOCEtaxel (Injectable)	1315942	docetaxel	70aeb960-426c-4805-b956-476bebccd926	2015-08-26 00:00:00	\N	\N
1509	Docosanol (Topical)	980955	docosanol	c39b38a7-dcdd-4c32-8f35-b565c4d3cec6	2015-07-07 00:00:00	\N	\N
1510	Docusate (Oral Liquid)	941258	Docusate	1fcb6361-7598-4ac9-b04d-faf4397197eb	2015-02-12 00:00:00	\N	\N
1511	Docusate (Oral Pill)	941258	Docusate	c49fb9f2-489e-48d1-b377-5cd3e2fabeba	2015-09-23 00:00:00	\N	\N
1512	Docusate (Rectal)	941258	Docusate	1235366d-b572-3a41-e054-00144ff8d46c	2015-04-07 00:00:00	\N	\N
1513	"Docusate/Sennosides, USP (Oral Pill)"	941258	Docusate	16b2ff3b-0a96-4521-9b41-c7adcee27f8b	2015-08-05 00:00:00	\N	\N
1514	DOCUSOL (Rectal)	941258	Docusate	0d9355f0-d19f-4404-9b9e-bb2c874e39d6	2015-04-07 00:00:00	\N	\N
1515	DOCUSOL PLUS (Rectal)	917006	Benzocaine	08d1d3ed-1427-4a14-a2c0-91d46e258e07	2015-04-07 00:00:00	\N	\N
1516	Dodecyl sulfate/Oxyquinoline (Vaginal)	43012263	dodecyl sulfate	1e4a1caa-e6ba-44ef-8347-07e6385a7c9e	2014-12-03 00:00:00	\N	\N
1517	Dog hair extract (Injectable)	40170475	dog hair extract	ea1e43ad-632d-4e07-887f-c80f4e9798af	2011-06-09 00:00:00	\N	\N
1518	DOK (Oral Pill)	941258	Docusate	7f48d80a-df42-4776-ad22-2d7a47bd03e1	2015-09-22 00:00:00	\N	\N
1519	DOLOGEN (Oral Pill)	1125315	Acetaminophen	dad63da3-cd1f-42a8-93d5-44b39aae1268	2014-08-28 00:00:00	\N	\N
1520	DOLOGESIC (Oral Liquid)	1125315	Acetaminophen	738e7767-42de-4076-acf2-9152484c2007	2012-06-20 00:00:00	\N	\N
1521	DOLORACIN (Topical)	939881	Capsaicin	ce4747e3-d8a4-48e6-910f-0f287c0c38fd	2013-09-18 00:00:00	\N	\N
1522	Dolutegravir (Oral Pill)	43560385	dolutegravir	63df5af3-b8ac-4e76-9830-2dbb340af922	2015-08-07 00:00:00	\N	\N
1523	DOMEBORO (Topical)	19030692	aluminum sulfate	28c39200-2f7c-954b-3ce7-7349b2738812	2015-07-10 00:00:00	\N	\N
1524	DONATUSSIN DROPS (Oral Liquid)	1163944	Guaifenesin	9ebee4c3-c0fb-417e-901f-eaaf678654f9	2011-01-07 00:00:00	\N	\N
1525	Donepezil (Oral Disintegrating)	715997	donepezil	6bbb7b73-910b-4664-8856-4c6adbbb48cb	2015-08-03 00:00:00	\N	\N
1526	Donepezil (Oral Pill)	715997	donepezil	11ac01f4-d26e-47b2-9660-d514ab097fdb	2015-09-30 00:00:00	\N	\N
1527	DONNATAL (Oral Liquid)	914335	Atropine	85c207ad-83bb-20e8-ef73-9a374eb8ccb6	2015-09-22 00:00:00	\N	\N
1528	DONNATAL (Oral Pill)	914335	Atropine	c93cccdc-2f92-4cb3-9d14-06acdd51d94c	2015-09-22 00:00:00	\N	\N
1529	DONNATAL XR (Oral Pill)	914335	Atropine	2064014b-6f8e-4232-88c2-d1870042abc7	2011-10-17 00:00:00	\N	\N
1530	DOPamine (Injectable)	1337860	Dopamine	e061fb3e-afd7-4188-b5fb-617ac1d3e38d	2015-09-24 00:00:00	\N	\N
1531	DOPRAM (Injectable)	738152	Doxapram	b8eb330a-a75b-46cb-b694-5be9327ed2eb	2012-04-25 00:00:00	\N	\N
1532	Dornase Alfa (Inhalant)	1125443	Dornase Alfa	d8c78a7e-ff99-48f3-8952-643ec2ea0f86	2015-01-16 00:00:00	\N	\N
1533	DORYX (Oral Pill)	1738521	Doxycycline	1292fa83-e2a1-4fda-b0dd-ccf763265fe1	2015-06-10 00:00:00	\N	\N
1534	Dorzolamide (Ophthalmic)	981709	dorzolamide	f16732ba-2cd8-473d-b79f-f48f29869c8d	2015-08-10 00:00:00	\N	\N
1535	Dorzolamide/Timolol (Ophthalmic)	981709	dorzolamide	06c062ca-add7-4ddf-ba7c-7b5dd531e9ec	2015-08-14 00:00:00	\N	\N
1536	DOVONEX (Topical)	908921	calcipotriene	92d53473-e33d-4490-9390-ec333dbf7676	2015-04-27 00:00:00	\N	\N
1537	Doxapram (Injectable)	738152	Doxapram	b8eb330a-a75b-46cb-b694-5be9327ed2eb	2012-04-25 00:00:00	\N	\N
1538	Doxazosin (Oral Pill)	1363053	Doxazosin	7d5b94bd-bd39-414d-855e-b8e6f22e593e	2015-07-30 00:00:00	\N	\N
1539	Doxepin (Oral Liquid)	738156	Doxepin	fa31c1a5-91ed-4726-ab58-fbe98056fe5e	2014-12-09 00:00:00	\N	\N
1540	Doxepin (Oral Pill)	738156	Doxepin	c97a2f91-fe58-4d78-afc2-1a4ceb1f9344	2015-09-28 00:00:00	\N	\N
1541	Doxepin (Topical)	738156	Doxepin	64311378-2da2-4835-a222-5df5204c59c2	2015-02-13 00:00:00	\N	\N
1542	Doxercalciferol (Oral Pill)	1512446	Doxercalciferol	1bb3ce2f-c77a-436f-980f-a02668f99fed	2014-02-19 00:00:00	\N	\N
1543	Doxorubicin liposome (Injectable)	19051649	doxorubicin liposome	1d5beebf-77f3-47ca-a9a1-5f64f42fed07	2012-05-22 00:00:00	\N	\N
1544	DOXY (Injectable)	1738521	Doxycycline	b0894010-39bd-459f-8563-cf83343105ee	2015-09-10 00:00:00	\N	\N
1545	Doxycycline (Injectable)	1738521	Doxycycline	f9b9ca8a-5cfc-446a-8330-36cf96625a57	2015-09-10 00:00:00	\N	\N
1546	Doxycycline (Oral Pill)	1738521	Doxycycline	1292fa83-e2a1-4fda-b0dd-ccf763265fe1	2015-09-29 00:00:00	\N	\N
1547	Doxylamine (Oral Pill)	738818	Doxylamine	8051a431-94ab-4593-bfca-f28ea988b474	2015-09-14 00:00:00	\N	\N
1548	Doxylamine/Phenylephrine (Oral Pill)	738818	Doxylamine	8f6622e1-b40d-4d1c-9322-463775728a25	2015-02-23 00:00:00	\N	\N
1549	Doxylamine/Pseudoephedrine (Oral Liquid)	738818	Doxylamine	fe74017b-3387-4e72-9e2d-9eb46465c3df	2011-04-04 00:00:00	\N	\N
1550	DR. SCHOLL'S (Topical)	964407	Salicylic Acid	fd446f5f-c086-4b58-b350-a8ff3c92259f	2014-06-12 00:00:00	\N	\N
1551	DR. SCHOLL'S DISCS (Topical)	964407	Salicylic Acid	f5d4c321-dec2-49f1-bfe2-30a053166880	2014-06-27 00:00:00	\N	\N
1552	DR. SMITH'S DIAPER RASH (Topical)	911064	Zinc Oxide	7705b182-acf7-4195-9996-7d9fcdfbf055	2015-08-31 00:00:00	\N	\N
1553	DRAMAMINE (Chewable)	928744	Dimenhydrinate	09936316-8667-4950-b017-19e3a05385a4	2013-01-16 00:00:00	\N	\N
1554	DRAMAMINE (Oral Pill)	928744	Dimenhydrinate	f9302a5a-295a-4501-9332-e3f5eb387362	2012-04-11 00:00:00	\N	\N
1555	DRAMAMINE LESS DROWSY (Oral Pill)	994341	Meclizine	fa6a0969-7427-4b87-bc04-a2792665c218	2011-09-01 00:00:00	\N	\N
1556	DRISDOL (Oral Pill)	19045045	Ergocalciferol	0d501431-82d3-4f8e-94c4-5eabcefc00ad	2012-07-12 00:00:00	\N	\N
1557	DRISTAN 12-HOUR NASAL SPRAY (Nasal)	925636	Oxymetazoline	9ddfb021-fa96-94a6-a413-839ce5a7e744	2013-03-15 00:00:00	\N	\N
1558	DRITHOCREME (Topical)	952538	Anthralin	4d624774-3618-423c-89bd-492f4795ad19	2014-10-24 00:00:00	\N	\N
1559	Dronedarone (Oral Pill)	40163615	dronedarone	236d4549-f44b-4677-b857-acedd10b9920	2011-12-30 00:00:00	\N	\N
1560	Droperidol (Injectable)	739323	Droperidol	7bd2c1cf-31c0-49c7-a856-f238a46f6f1f	2013-11-12 00:00:00	\N	\N
1561	Drospirenone/Estradiol (Oral Pill)	1512674	drospirenone	761834c2-6b61-4583-84c2-f1ca4a97c4f2	2015-07-06 00:00:00	\N	\N
1562	Drospirenone/Ethinyl Estradiol (Oral Pill)	1512674	drospirenone	8edef6f6-c278-4595-a00e-55a773b15733	2015-09-04 00:00:00	\N	\N
1563	Drospirenone/Ethinyl Estradiol/Levomefolic Acid (Oral Pill)	1512674	drospirenone	8132454a-6135-4bac-b206-83a55eb8dbc6	2015-08-03 00:00:00	\N	\N
1564	DROXIA (Oral Pill)	1377141	hydroxyurea	740e054b-faac-7c27-f06d-a56efb699355	2015-08-11 00:00:00	\N	\N
1565	Droxidopa (Oral Pill)	44814542	Droxidopa	2179f02c-48d7-48eb-8007-5ae43d8d16bc	2014-09-02 00:00:00	\N	\N
1566	DUAVEE (Oral Pill)	44506794	bazedoxifene	e1b75458-2e5b-46b9-92c6-fa6daba3770f	2015-10-01 00:00:00	\N	\N
1567	DUEXIS (Oral Pill)	953076	Famotidine	558b9f26-37b2-423b-932d-25a37afe57ec	2015-07-28 00:00:00	\N	\N
1568	DULCOLAX (Oral Pill)	924939	Bisacodyl	8527ae95-fdfd-4b62-9f56-598c2656aeb6	2010-11-24 00:00:00	\N	\N
1569	DULCOLAX (Rectal)	924939	Bisacodyl	1bf775a9-bd9e-41a6-acef-9a3795fbf25c	2015-04-27 00:00:00	\N	\N
1570	DULoxetine (Oral Pill)	715259	duloxetine	752d7078-6cc5-4cb8-b5d2-5fc0851320a4	2015-09-30 00:00:00	\N	\N
1571	DUONEB (Inhalant)	1154343	Albuterol	926d8687-5a1f-4550-b33a-b56f9d015994	2012-06-13 00:00:00	\N	\N
1572	DURACLON (Injectable)	1398937	Clonidine	8c126bb8-732a-4949-8754-2f50b5543638	2013-03-26 00:00:00	\N	\N
1573	DURAMORPH (Injectable)	1110410	Morphine	ebb18761-e5c4-4238-bb84-f9549f500210	2013-11-06 00:00:00	\N	\N
1574	DURAPREP (Topical)	19125582	iodine povacrylex	3a73b934-ea39-43c2-86bf-dfb88353b8bd	2015-09-14 00:00:00	\N	\N
1575	DURICEF (Oral Liquid)	1769535	Cefadroxil	4ad759f3-72dd-412e-9500-055335cda6cf	2007-05-22 00:00:00	\N	\N
1576	DURICEF (Oral Pill)	1769535	Cefadroxil	4ad759f3-72dd-412e-9500-055335cda6cf	2007-05-22 00:00:00	\N	\N
1577	Dutasteride (Oral Pill)	989482	Dutasteride	813507ec-1fc1-420f-ac5c-5c794b1059cd	2011-12-20 00:00:00	\N	\N
1578	Dutasteride/Tamsulosin (Oral Pill)	989482	Dutasteride	f96c6acd-4d02-4ece-bd54-2d5a35aab7f5	2012-05-17 00:00:00	\N	\N
1579	DYAZIDE (Oral Pill)	974166	Hydrochlorothiazide	7330f40d-b269-425b-a4e3-e7263a088fb7	2011-02-11 00:00:00	\N	\N
1580	Dyclonine (Oral Lozenge)	992308	dyclonine	6fde9446-0f8d-4bba-98dc-3e3a1f170488	2012-04-11 00:00:00	\N	\N
1581	DYNA-HEX (Topical)	1790812	Chlorhexidine	6cc89ac1-baef-40bb-85a3-d9ae9e3e7a63	2014-01-27 00:00:00	\N	\N
1582	DYNACIN (Oral Pill)	1708880	Minocycline	f174edbd-3ac0-4e27-a116-3b74804721bb	2014-12-18 00:00:00	\N	\N
1583	Dyphylline (Oral Pill)	1140088	Dyphylline	6d7ed7c0-9646-11de-a404-0002a5d5c51b	2015-01-12 00:00:00	\N	\N
1584	Dyphylline/guaiFENesin (Oral Liquid)	1140088	Dyphylline	d35db38b-8b0e-4872-ab18-09795c5e07e9	2011-08-29 00:00:00	\N	\N
1585	DYRENIUM (Oral Pill)	904542	Triamterene	5012f997-9fb2-4c3d-99fd-4f7efd7c39af	2015-04-29 00:00:00	\N	\N
1586	DYSPORT (Injectable)	40165377	abobotulinumtoxinA	71313a04-1349-4c26-b840-a39e4a3ddaed	2015-03-10 00:00:00	\N	\N
1587	Eastern cottonwood pollen extract (Injectable)	40161793	eastern cottonwood pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
1588	Echothiophate (Ophthalmic)	958368	Echothiophate	e4bb53c7-9061-43fc-878f-dc1b19801bfc	2013-12-12 00:00:00	\N	\N
1589	Econazole (Topical)	940864	Econazole	050155b7-e8fe-4eee-9516-716399f559f6	2014-11-18 00:00:00	\N	\N
1590	ECONOCHLOR (Ophthalmic)	990069	Chloramphenicol	29bd93cf-6524-45b9-b4b3-c9665da89e34	2008-03-13 00:00:00	\N	\N
1591	ECONOPRED (Ophthalmic)	1550557	prednisolone	2d6c3ea4-5189-4f6e-bb6a-c9379f441d7a	2008-03-13 00:00:00	\N	\N
1592	ECOTRIN (Oral Pill)	1112807	Aspirin	f950d4eb-39b9-4ef7-b5f3-0cf45d4d6bc0	2012-07-16 00:00:00	\N	\N
1593	ECPIRIN (Oral Pill)	1112807	Aspirin	0ad0996b-31fb-305a-e054-00144ff88e88	2014-12-24 00:00:00	\N	\N
1594	ECZEMIN (Topical)	927478	pramoxine	b108cbf1-55f4-49c8-93d1-13c0326cc487	2011-12-06 00:00:00	\N	\N
1595	ED SPAZ (Oral Disintegrating)	923672	Hyoscyamine	f33a4774-9fbb-4782-a7e1-068e83b7504d	2010-07-20 00:00:00	\N	\N
1596	EDARBI (Oral Pill)	40235485	azilsartan	75b16bfc-38c1-4133-bd7d-13258d54edec	2015-08-24 00:00:00	\N	\N
1597	EDARBYCLOR (Oral Pill)	40235485	azilsartan	e60f795b-fce3-4361-aa03-f143451689d1	2015-08-24 00:00:00	\N	\N
1598	EDECRIN (Oral Pill)	987406	Ethacrynate	d65ed93d-77c8-45d1-af3d-06e9e5d65930	2013-01-11 00:00:00	\N	\N
1599	EDECRIN SODIUM (Injectable)	987406	Ethacrynate	9e6e2048-0d65-4c23-8324-95767cbf86f1	2012-08-15 00:00:00	\N	\N
1600	Edetate Calcium (Injectable)	43013616	Edetate Calcium	f960dbfa-b00c-4f3e-ad32-ed6a5deea831	2015-04-13 00:00:00	\N	\N
1601	Edetic Acid (Injectable)	1741008	Edetic Acid	290c3e9c-c0c6-440a-1a9c-46e3e2b07a77	2007-03-01 00:00:00	\N	\N
1602	EDLUAR (Sublingual)	744740	zolpidem	a32884d0-85b5-11de-8a39-0800200c9a66	2014-11-07 00:00:00	\N	\N
1603	Edrophonium (Injectable)	740924	Edrophonium	98a5a2f6-3194-4202-963f-0fcd28ecadbc	2013-04-23 00:00:00	\N	\N
1604	EESCULA (Ophthalmic)	915829	isopropyl unoprostone	53d05ced-51dd-11de-8a39-0800200c9a66	2013-01-10 00:00:00	\N	\N
1605	Efavirenz (Oral Pill)	1738135	efavirenz	04b5c345-c446-43a4-83f0-509bc287e10b	2013-03-01 00:00:00	\N	\N
1606	Efavirenz/Emtricitabine/Tenofovir disoproxil (Oral Pill)	1738135	efavirenz	5c6c7ba4-6d42-4e07-a127-b3cf72c866ad	2014-11-03 00:00:00	\N	\N
1607	EFFACLAR DUO (Topical)	918172	Benzoyl Peroxide	6cdd0ab1-d30f-40d3-bf3a-5d7d178b1d31	2013-01-24 00:00:00	\N	\N
1608	EFFIENT (Oral Pill)	40163718	prasugrel	cb684ad9-0b72-406f-8a07-a419254ccd36	2015-08-19 00:00:00	\N	\N
1609	Eflornithine (Topical)	978236	Eflornithine	e872db73-7cd7-4886-9b0f-6710700e3765	2013-09-10 00:00:00	\N	\N
1610	EFUDEX (Topical)	955632	Fluorouracil	35de1c1c-bef5-46c5-b6f8-ea032147411c	2014-05-06 00:00:00	\N	\N
1611	EGG YOLK PHOSPHOLIPIDS/Glycerin/Soybean Oil (Injectable)	19013789	EGG YOLK PHOSPHOLIPIDS	dd269651-30e8-43f0-880f-484346eaafeb	2015-07-28 00:00:00	\N	\N
1612	EGRIFTA (Injectable)	40231628	tesamorelin	3de31cec-31dc-4ac4-9717-367a687d22f2	2013-03-11 00:00:00	\N	\N
1613	ELDEPRYL (Oral Pill)	766209	Selegiline	106429ad-859a-4b29-babf-42cb85f7236e	2012-07-23 00:00:00	\N	\N
1614	ELELYSO (Injectable)	42800246	taliglucerase alfa	fa3cbd5d-677c-4b19-9032-d9182cb69a83	2014-10-22 00:00:00	\N	\N
1615	ELESTAT (Ophthalmic)	943634	epinastine	a9628ec7-bbeb-4cfa-932f-645a8aca8987	2012-01-19 00:00:00	\N	\N
1616	ELESTRIN (Topical)	1548195	Estradiol	8e1a3641-25ca-41bd-a940-51ae0ec64ed9	2012-07-13 00:00:00	\N	\N
1617	Eletriptan (Oral Pill)	1189697	eletriptan	523b947a-4e92-42ff-886c-4317af8d7b56	2014-03-18 00:00:00	\N	\N
1618	ELIDEL (Topical)	915935	Pimecrolimus	e4027e5a-0f9b-4070-b196-f60172f45c4c	2014-12-15 00:00:00	\N	\N
1619	Eliglustat (Oral Pill)	45775782	eliglustat	819f828a-b888-4e46-83fc-94d774a28a83	2014-09-03 00:00:00	\N	\N
1620	ELIMITE (Topical)	922868	Permethrin	4de55a80-67d6-42c0-a6fc-57b89400c5b3	2012-11-27 00:00:00	\N	\N
1621	ELIPHOS (Oral Pill)	951469	calcium acetate	9fc1ada4-9ef4-48e9-8203-32aa857d0429	2015-09-10 00:00:00	\N	\N
1622	ELIQUIS (Oral Pill)	43013024	apixaban	a454cd24-0c6d-46e8-b1e4-197388606175	2015-09-22 00:00:00	\N	\N
1623	ELIXOPHYLLIN (Oral Liquid)	1237049	Theophylline	2676f761-4fe5-40a9-a07d-ed2542847883	2014-03-13 00:00:00	\N	\N
1624	ELLA (Oral Pill)	40225722	ulipristal	052bfe45-c485-49e5-8fc4-51990b2efba4	2014-07-02 00:00:00	\N	\N
1625	ELMIRON (Oral Pill)	924151	Pentosan Polysulfate	3b172ad2-074f-4534-af1f-89d951647ee9	2014-07-03 00:00:00	\N	\N
1626	ELOCON (Topical)	905233	Mometasone	aa905762-80be-45be-89d5-b32564e82f92	2015-04-15 00:00:00	\N	\N
1627	ELOCTATE (Injectable)	45776421	factor VIII (b-domain deleted recombinant) FC fusion protein	bec39fa0-1524-4e6b-897f-db0ef093085e	2014-07-14 00:00:00	\N	\N
1628	ELOXATIN (Injectable)	1318011	oxaliplatin	3c740b43-f396-4998-bc66-6964a21f7161	2014-03-05 00:00:00	\N	\N
1629	ELTA SEAL MOISTURE BARRIER (Topical)	911064	Zinc Oxide	9ebe3684-d591-464f-9828-379a8b627728	2014-08-15 00:00:00	\N	\N
1630	Elvitegravir (Oral Pill)	42874212	elvitegravir	be87c3bc-97bb-49cb-8053-9b0c756a1965	2015-08-07 00:00:00	\N	\N
1631	EMADINE (Ophthalmic)	903893	emedastine	98a010d5-4905-4abf-a9d2-c85a07daa23b	2011-07-13 00:00:00	\N	\N
1632	EMBEDA XR (Oral Pill)	1110410	Morphine	dfe97a3d-247d-4dda-a641-1a95196cd8d8	2010-03-04 00:00:00	\N	\N
1633	EMCYT (Oral Pill)	1349025	Estramustine	a9b01bc6-95ac-46f9-befa-d845a74d53c1	2014-06-23 00:00:00	\N	\N
1634	Emedastine (Ophthalmic)	903893	emedastine	98a010d5-4905-4abf-a9d2-c85a07daa23b	2011-07-13 00:00:00	\N	\N
1635	EMEND (Oral Pill)	936748	aprepitant	ec44482e-6194-4829-a3f7-ebe8d48a41a5	2012-04-20 00:00:00	\N	\N
1636	EMETROL (Oral Liquid)	956691	Fructose	d0ce87b8-d484-4307-95a9-05705a6caf85	2012-04-27 00:00:00	\N	\N
1637	EMLA (Topical)	989878	Lidocaine	b466c7eb-bca3-4686-ada6-325103ab06f3	2015-03-02 00:00:00	\N	\N
1638	Empagliflozin (Oral Pill)	45774751	empagliflozin	faf3dd6a-9cd0-39c2-0d2e-232cb3f67565	2015-07-09 00:00:00	\N	\N
1639	Emtricitabine (Oral Liquid)	1703069	emtricitabine	d6599395-3944-44f9-97f2-e0424c6b6a1f	2012-11-13 00:00:00	\N	\N
1640	Emtricitabine (Oral Pill)	1703069	emtricitabine	d6599395-3944-44f9-97f2-e0424c6b6a1f	2012-11-13 00:00:00	\N	\N
1641	Emtricitabine/Rilpivirine/Tenofovir disoproxil (Oral Pill)	1703069	emtricitabine	54c8bec2-d565-489c-8d7c-afd3cdf78df5	2013-03-21 00:00:00	\N	\N
1642	Emtricitabine/Tenofovir disoproxil (Oral Pill)	1703069	emtricitabine	8bd3debe-d414-450f-b8d9-a70fb1dd5341	2015-05-29 00:00:00	\N	\N
1643	EMTRIVA (Oral Liquid)	1703069	emtricitabine	d6599395-3944-44f9-97f2-e0424c6b6a1f	2012-11-13 00:00:00	\N	\N
1644	EMTRIVA (Oral Pill)	1703069	emtricitabine	d6599395-3944-44f9-97f2-e0424c6b6a1f	2012-11-13 00:00:00	\N	\N
1645	Enalapril (Oral Liquid)	1341927	Enalapril	94c9a9d6-957f-4667-8f09-509e99bac777	2015-01-20 00:00:00	\N	\N
1646	Enalapril (Oral Pill)	1341927	Enalapril	5cc4f6f0-8925-81e1-b210-b5a4509a25a9	2015-10-05 00:00:00	\N	\N
1647	Enalapril/Hydrochlorothiazide (Oral Pill)	1341927	Enalapril	7cb92cf2-46f2-4379-937c-168d230e43a4	2015-06-24 00:00:00	\N	\N
1648	Enalaprilat (Injectable)	1342001	Enalaprilat	d3d573a7-50d5-46a8-9f92-baad3ae0831e	2014-08-25 00:00:00	\N	\N
1649	ENDODAN REFORMULATED MAY 2009 (Oral Pill)	1112807	Aspirin	23a60947-6058-4bf7-a3ee-ae396e55d939	2011-06-01 00:00:00	\N	\N
1650	ENDRATE (Injectable)	1741008	Edetic Acid	290c3e9c-c0c6-440a-1a9c-46e3e2b07a77	2007-03-01 00:00:00	\N	\N
1651	ENEMEEZ (Rectal)	941258	Docusate	0b06445d-0839-497e-bdff-e0fe224a7738	2012-08-17 00:00:00	\N	\N
1652	ENEMEEZ PLUS (Rectal)	917006	Benzocaine	1670ca59-7275-4ac6-bef4-674a7b24c7b3	2012-08-17 00:00:00	\N	\N
1653	English plantain pollen extract (Injectable)	40160939	English plantain pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
1654	ENJUVIA (Oral Pill)	1586808	"synthetic conjugated estrogens, B"	b7aba0b2-72d1-4429-bb64-98b92e9d9433	2015-07-17 00:00:00	\N	\N
1655	ENLON (Injectable)	740924	Edrophonium	98a5a2f6-3194-4202-963f-0fcd28ecadbc	2013-04-23 00:00:00	\N	\N
1656	ENLON-PLUS (Injectable)	914335	Atropine	bdeb47eb-e538-498d-ae98-14d5db29eab0	2013-12-20 00:00:00	\N	\N
1657	Enoxaparin (Injectable)	1301025	Enoxaparin	2cc08d08-555a-4135-b6da-9f8cf7b11ad7	2015-03-16 00:00:00	\N	\N
1658	Entacapone (Oral Pill)	782211	entacapone	01ea62f4-bfac-485a-bb4b-a9abb345749f	2015-06-24 00:00:00	\N	\N
1659	Entecavir (Oral Pill)	1711246	entecavir	e527b81a-5e15-4b58-91ed-3df45f3ac589	2015-08-27 00:00:00	\N	\N
1660	ENTEREG (Oral Pill)	19059654	alvimopan	77a67dc6-35d3-48ff-9d18-292d4d442f70	2015-08-31 00:00:00	\N	\N
1661	ENTEX LQ (Oral Liquid)	1163944	Guaifenesin	0accdd47-9712-4faa-aae4-ad1e641b26a1	2011-04-19 00:00:00	\N	\N
1662	ENTOCORT (Oral Pill)	939259	Budesonide	98a4eca1-904c-4355-957a-b5a141573cc2	2012-11-30 00:00:00	\N	\N
1663	ENTYVIO (Injectable)	45774639	vedolizumab	6e94621c-1a95-4af9-98d1-52b9e6f1949c	2014-05-23 00:00:00	\N	\N
1664	ENULOSE (Oral Liquid)	987245	Lactulose	a9b8bc93-af0f-44e6-a5f2-ff001542a81f	2014-02-10 00:00:00	\N	\N
1665	Enzalutamide (Oral Pill)	42900250	enzalutamide	b129fdc9-1d8e-425c-a5a9-8a2ed36dfbdf	2015-10-09 00:00:00	\N	\N
1666	EPANED (Oral Liquid)	1341927	Enalapril	94c9a9d6-957f-4667-8f09-509e99bac777	2015-01-20 00:00:00	\N	\N
1667	ePHEDrine (Injectable)	1143374	Ephedrine	16f212c3-d504-4d3c-813e-cc23a04aaa88	2015-09-08 00:00:00	\N	\N
1668	ePHEDrine (Oral Pill)	1143374	Ephedrine	b63d6ef1-ccce-4cd7-80f7-6d674dbf432f	2010-10-09 00:00:00	\N	\N
1669	ePHEDrine/guaiFENesin (Oral Pill)	1143374	Ephedrine	699e7629-5e8a-4dac-b494-fe42698ee460	2015-06-18 00:00:00	\N	\N
1670	Epicoccum nigrum extract (Injectable)	40162020	Epicoccum nigrum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
1671	EPIDUO (Topical)	981774	adapalene	67002593-3bd3-4e91-a48f-9f7483e579a0	2012-02-15 00:00:00	\N	\N
1672	EPIFOAM (Topical)	975125	Hydrocortisone	b22b8b41-2f1e-11e4-8c21-0800200c9a66	2014-09-04 00:00:00	\N	\N
1673	Epinastine (Ophthalmic)	943634	epinastine	df001833-f478-ee51-325a-9e1b56199567	2015-05-05 00:00:00	\N	\N
1674	EPINEPHrine (Injectable)	1343916	Epinephrine	3ed35d7d-616c-43cd-9776-705821afc1f0	2015-10-01 00:00:00	\N	\N
1675	EPINEPHrine/Lidocaine (Injectable)	1343916	Epinephrine	169e2102-199a-46b6-80ae-8bb5ff2a5c69	2015-09-14 00:00:00	\N	\N
1676	EPINEPHrine/Lidocaine (Transdermal)	1343916	Epinephrine	82b5bf2c-7dc9-40bd-9fb4-b5b1b5be0470	2007-09-14 00:00:00	\N	\N
1677	Epirubicin (Injectable)	1344354	Epirubicin	bc0a3a39-4ac3-47de-a388-9c3672e3e130	2015-03-09 00:00:00	\N	\N
1678	EPIVIR (Oral Pill)	1704183	Lamivudine	3b1f8ee3-d582-4faa-a7f2-0fbc45721298	2011-09-30 00:00:00	\N	\N
1679	EPIVIR HBV (Oral Pill)	1704183	Lamivudine	83009c27-f54b-47df-b8b2-e2e4e0b8f4e8	2014-10-07 00:00:00	\N	\N
1680	Eplerenone (Oral Pill)	1309799	eplerenone	c7bc9486-8e61-4ba1-827f-2cd8c304b454	2013-08-09 00:00:00	\N	\N
1681	Epoetin Alfa (Injectable)	1301125	Epoetin Alfa	9bbe9a5b-ad1d-41a4-9699-ff6dc776bce1	2013-01-18 00:00:00	\N	\N
1682	Epoprostenol (Injectable)	1354118	Epoprostenol	d669ff68-ddcf-42f6-913c-d8f1aedbd9c4	2012-12-20 00:00:00	\N	\N
1683	Eprosartan/Hydrochlorothiazide (Oral Pill)	1346686	eprosartan	b1dfcac3-ef66-4d3e-9d58-37d3f516eb31	2012-01-04 00:00:00	\N	\N
1684	EPZICOM (Oral Pill)	1736971	abacavir	080e3423-5962-4465-8e78-cd8793699336	2010-09-01 00:00:00	\N	\N
1685	EQUAGESIC (Oral Pill)	1112807	Aspirin	941e1ec2-1f14-4153-a5ea-cf7669d5efd1	2008-01-25 00:00:00	\N	\N
1686	Ergocalciferol (Oral Liquid)	19045045	Ergocalciferol	7dec2cd0-b4cf-45b7-924c-cbb003f5f8f8	2015-09-09 00:00:00	\N	\N
1687	Ergocalciferol (Oral Pill)	19045045	Ergocalciferol	88218156-081a-4809-8143-f97bdab194ba	2015-08-06 00:00:00	\N	\N
1688	"Ergoloid mesylates, USP (Oral Pill)"	745268	"ergoloid mesylates, USP"	1344cf98-7d79-4ab4-9a63-2e632d9afbd4	2014-08-15 00:00:00	\N	\N
1689	ERGOMAR (Sublingual)	1145379	Ergotamine	1bfd4827-5123-4dbb-8f94-7b097f5bfd5c	2012-09-14 00:00:00	\N	\N
1690	Ergotamine (Inhalant)	1145379	Ergotamine	e713859d-f454-4f7e-a535-868b8d5f2c88	2006-09-01 00:00:00	\N	\N
1691	Ergotamine (Sublingual)	1145379	Ergotamine	1bfd4827-5123-4dbb-8f94-7b097f5bfd5c	2012-09-14 00:00:00	\N	\N
1692	ERIVEDGE (Oral Pill)	42709321	vismodegib	eb368bb6-80e3-4df9-8a85-91df0a2ada6a	2015-06-05 00:00:00	\N	\N
1693	Erlotinib (Oral Pill)	1325363	erlotinib	5783976b-0862-44e5-9b19-0f41d236d5c3	2012-01-30 00:00:00	\N	\N
1694	ERTACZO (Topical)	939134	sertaconazole	821073f7-33f6-464d-baed-f66d97987d6d	2014-12-08 00:00:00	\N	\N
1695	ERY (Topical)	1746940	Erythromycin	9a63da11-01be-4c63-a260-e6bdbb4a7a69	2011-11-10 00:00:00	\N	\N
1696	ERY-TAB (Oral Pill)	1746940	Erythromycin	e7dd481b-5c2a-412e-86df-dfe1376ce38c	2015-04-13 00:00:00	\N	\N
1697	ERYC (Oral Pill)	1746940	Erythromycin	c3f7cd94-d842-4f6b-a582-a38c751a790a	2008-12-19 00:00:00	\N	\N
1698	ERYGEL (Topical)	1746940	Erythromycin	26eb3e52-e857-4ab6-841e-fd47a838e4f4	2014-01-28 00:00:00	\N	\N
1699	ERYPED (Oral Liquid)	1746940	Erythromycin	04775721-ab87-4b66-808c-d67a21032385	2013-08-16 00:00:00	\N	\N
1700	ERYTHROCIN STEARATE (Oral Pill)	1746940	Erythromycin	81698259-aab4-42ec-a549-b32e9c9565d0	2015-08-03 00:00:00	\N	\N
1701	Erythromycin (Ophthalmic)	1746940	Erythromycin	dc3ee55d-114e-44f2-adb2-fb0c24eba732	2015-08-11 00:00:00	\N	\N
1702	Erythromycin (Oral Pill)	1746940	Erythromycin	83b88647-1b7c-444f-ab20-cdb5afd265bf	2015-09-08 00:00:00	\N	\N
1703	Erythromycin (Topical)	1746940	Erythromycin	aa993373-f75f-440f-bdae-59892557ba2c	2015-07-01 00:00:00	\N	\N
1704	Erythromycin Ethylsuccinate (Oral Liquid)	1746940	Erythromycin	04775721-ab87-4b66-808c-d67a21032385	2013-08-16 00:00:00	\N	\N
1705	Erythromycin Ethylsuccinate (Oral Pill)	1746940	Erythromycin	6d8c343b-30d9-4cdb-8f55-2a20983a71c1	2014-05-09 00:00:00	\N	\N
1706	Erythromycin Ethylsuccinate/SulfiSOXAZOLE (Oral Liquid)	1746940	Erythromycin	eb6ea746-3228-4969-8a26-653288662fd7	2010-08-09 00:00:00	\N	\N
1707	Erythromycin stearate (Oral Pill)	1746940	Erythromycin	26f2704c-92ae-41c5-badc-dbebfb2eed35	2015-08-03 00:00:00	\N	\N
1708	Escitalopram (Oral Liquid)	715939	Escitalopram	82d793ee-4039-45fc-ac83-4bd5235f00aa	2015-08-13 00:00:00	\N	\N
1709	Escitalopram (Oral Pill)	715939	Escitalopram	83b762b9-bb12-43fe-bdc4-00d5c4fd98ce	2015-10-01 00:00:00	\N	\N
1710	ESGIC (Oral Pill)	1125315	Acetaminophen	8aa576ac-c870-4ac0-a9a5-5539b38f653d	2013-11-25 00:00:00	\N	\N
1711	Eslicarbazepine (Oral Pill)	44507780	eslicarbazepine	3d0c9554-eaeb-4694-8089-00133fcadce3	2015-09-08 00:00:00	\N	\N
1712	Esmolol (Injectable)	19063575	esmolol	94f069f9-dd52-4a69-a103-ebdb4294f088	2015-10-01 00:00:00	\N	\N
1713	Esomeprazole (Injectable)	904453	Esomeprazole	dce12085-d6c4-48a5-959b-e771c413c9c5	2015-02-09 00:00:00	\N	\N
1714	Esomeprazole (Oral Pill)	904453	Esomeprazole	ea79f802-e9ac-480b-91e6-1e3900b11803	2015-09-29 00:00:00	\N	\N
1715	Esomeprazole/Naproxen (Oral Pill)	904453	Esomeprazole	baa47781-7151-4c75-a9a2-d2eac0a7d55e	2015-06-26 00:00:00	\N	\N
1716	ESOTERICA (Topical)	976778	hydroquinone	0de38654-f598-4cca-9e1e-47af1f21d21c	2011-10-04 00:00:00	\N	\N
1717	Estazolam (Oral Pill)	748010	Estazolam	50914a46-eab6-4c83-97cf-6ab0234c8126	2012-08-01 00:00:00	\N	\N
1718	ESTRACE (Oral Pill)	1548195	Estradiol	a3803ba3-4eee-4e2e-ac8c-821a4e6720cc	2013-09-26 00:00:00	\N	\N
1719	ESTRACE (Vaginal)	1548195	Estradiol	dfc41fcd-c5ba-4b25-b647-cf04d3988b3e	2013-10-18 00:00:00	\N	\N
1720	Estradiol (Injectable)	1548195	Estradiol	c5f32941-3427-4a38-bc3d-38337b41d9d3	2014-10-27 00:00:00	\N	\N
1721	Estradiol (Oral Pill)	1548195	Estradiol	a3803ba3-4eee-4e2e-ac8c-821a4e6720cc	2015-09-15 00:00:00	\N	\N
1722	Estradiol (Topical)	1548195	Estradiol	9a0aa631-133d-406b-9d32-8a1a99af4e50	2015-06-24 00:00:00	\N	\N
1723	Estradiol (Vaginal)	1548195	Estradiol	dfc41fcd-c5ba-4b25-b647-cf04d3988b3e	2013-10-18 00:00:00	\N	\N
1724	Estradiol/Norethindrone (Oral Pill)	1548195	Estradiol	b85df980-7df1-4973-bee3-ae51274b588f	2014-10-07 00:00:00	\N	\N
1725	Estramustine (Oral Pill)	1349025	Estramustine	a9b01bc6-95ac-46f9-befa-d845a74d53c1	2014-06-23 00:00:00	\N	\N
1726	"Estrogens, Conjugated (USP) (Oral Pill)"	1549080	"Estrogens, Conjugated (USP)"	55495ca7-54a3-4f52-935d-63432d14db4d	2014-05-15 00:00:00	\N	\N
1727	"Estrogens, Conjugated (USP)/MedroxyPROGESTERone (Oral Pill)"	1549080	"Estrogens, Conjugated (USP)"	198d547d-c985-46bc-a66f-e3182a294cb5	2013-03-15 00:00:00	\N	\N
1728	"Estrogens, Esterified (USP) (Oral Pill)"	1551673	"Estrogens, Esterified (USP)"	efb195b9-b995-48f3-a4cb-b7e09d56350e	2011-01-10 00:00:00	\N	\N
1729	"Estrogens, Esterified (USP)/MethylTESTOSTERone (Oral Pill)"	1551673	"Estrogens, Esterified (USP)"	316650b7-5770-4f1a-867d-68a72c60c8f2	2013-05-07 00:00:00	\N	\N
1730	Estropipate (Vaginal)	1525278	estropipate	ea3d70e5-dccd-4302-964b-b5cb1394b514	2006-09-28 00:00:00	\N	\N
1731	Eszopiclone (Oral Pill)	757352	Eszopiclone	e711e994-a489-d14b-9a50-60557b9ed137	2015-09-25 00:00:00	\N	\N
1732	Ethacrynate (Injectable)	987406	Ethacrynate	9e6e2048-0d65-4c23-8324-95767cbf86f1	2015-08-04 00:00:00	\N	\N
1733	Ethacrynate (Oral Pill)	987406	Ethacrynate	d65ed93d-77c8-45d1-af3d-06e9e5d65930	2013-01-11 00:00:00	\N	\N
1734	Ethambutol (Oral Pill)	1749301	Ethambutol	b2f95b0b-9de3-4c0b-a46e-a7eee6428b4b	2015-06-29 00:00:00	\N	\N
1735	ETHAMOLIN (Injectable)	19095285	ethanolamine oleate	a9c1d8c5-443e-400e-a42c-16a25fb47231	2013-04-23 00:00:00	\N	\N
1736	Ethanol (Injectable)	955372	Ethanol	6361091f-c341-4bc7-a2a5-bd6ea73cc028	2015-08-26 00:00:00	\N	\N
1737	Ethanol (Soap)	955372	Ethanol	44f4034a-0e13-49ae-98e6-1fb627a0e930	2014-10-23 00:00:00	\N	\N
1738	Ethanol (Topical)	955372	Ethanol	7aebcd0c-1b86-4c82-b7cb-e0e02648b9a0	2015-10-02 00:00:00	\N	\N
1739	Ethanol/Glucose (Injectable)	955372	Ethanol	14a2b1ab-f94b-45f1-b5c3-dce751648e93	2006-11-09 00:00:00	\N	\N
1740	Ethanolamine oleate (Injectable)	19095285	ethanolamine oleate	a9c1d8c5-443e-400e-a42c-16a25fb47231	2013-04-23 00:00:00	\N	\N
1741	Ethinyl Estradiol (Oral Pill)	1549786	Ethinyl Estradiol	2b8b5145-77ad-4817-8f9e-77fd7938242e	2015-06-29 00:00:00	\N	\N
1742	Ethinyl Estradiol/Ethynodiol (Oral Pill)	1549786	Ethinyl Estradiol	ae3c20e4-8850-4559-9ca3-06a98b3dabab	2013-10-24 00:00:00	\N	\N
1743	Ethinyl Estradiol/Levonorgestrel (Oral Pill)	1549786	Ethinyl Estradiol	709031e4-4c20-4ea7-beff-6c459709a433	2015-09-02 00:00:00	\N	\N
1744	Ethinyl Estradiol/Norethindrone (Chewable)	1549786	Ethinyl Estradiol	51267e7f-2ff6-482d-bb68-04f75a6999d9	2015-07-17 00:00:00	\N	\N
1745	Ethinyl Estradiol/Norethindrone (Oral Pill)	1549786	Ethinyl Estradiol	0beef9d3-8326-48cf-b89a-fa794902c6c1	2015-09-30 00:00:00	\N	\N
1746	Ethinyl Estradiol/Norgestimate (Oral Pill)	1549786	Ethinyl Estradiol	7841b848-ba6b-41b8-8c32-fde3eda6e8e6	2015-08-13 00:00:00	\N	\N
1747	Ethinyl Estradiol/Norgestrel (Oral Pill)	1549786	Ethinyl Estradiol	aa7f4a83-71cf-4306-b0a1-01784f67bae2	2014-06-06 00:00:00	\N	\N
1748	Ethosuximide (Oral Liquid)	750119	Ethosuximide	8a5cc930-0b36-48a8-9ad0-de633b208742	2015-03-26 00:00:00	\N	\N
1749	Ethosuximide (Oral Pill)	750119	Ethosuximide	cb5577e2-e906-438f-b13d-e55709a0e7fd	2015-06-11 00:00:00	\N	\N
1750	Etidronate (Oral Pill)	1552929	Etidronate	fa07734d-b381-4f33-a555-53b6614f4b08	2015-04-22 00:00:00	\N	\N
1751	Etodolac (Oral Pill)	1195492	Etodolac	4d682f98-1e8a-4c2b-6df3-169d2ed10dc1	2015-09-17 00:00:00	\N	\N
1752	ETOPOFOS (Injectable)	1350504	Etoposide	e28c05f0-081f-406d-8bfb-9160a6908307	2015-08-11 00:00:00	\N	\N
1753	Etoposide (Injectable)	1350504	Etoposide	4f850eb2-3542-43a0-90e8-bb37fa05cf15	2015-08-11 00:00:00	\N	\N
1754	Etoposide (Oral Pill)	1350504	Etoposide	508a418e-985f-4208-9324-2230655bb5c2	2013-07-19 00:00:00	\N	\N
1755	Etravirine (Oral Pill)	1758536	etravirine	73667241-b95a-49b0-9c51-a4289f20d5c2	2013-03-19 00:00:00	\N	\N
1756	Eucalyptol/Menthol/Methyl salicylate/Thymol (Mouthwash)	19050346	Eucalyptol	0c3ee0f2-6637-42fd-9f72-01ec4de3c7ba	2015-09-14 00:00:00	\N	\N
1757	EURAX (Topical)	969276	crotamiton	56465446-7f78-4ad1-acb3-08a4d60e5715	2015-02-02 00:00:00	\N	\N
1758	European house dust mite extract/White oak pollen extract (Injectable)	40242103	European house dust mite extract	3bfb5be4-542a-4b86-beac-688a07fc830c	2010-10-14 00:00:00	\N	\N
1759	European olive pollen extract (Injectable)	40161710	european olive pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
1760	EVAMIST (Topical)	1548195	Estradiol	d8c4a929-c039-4c7d-a3bc-986ae31fc8a6	2015-06-24 00:00:00	\N	\N
1761	EVOCLIN (Topical)	997881	Clindamycin	daa3d9d1-c906-41f3-83a2-c47f2283da48	2014-10-14 00:00:00	\N	\N
1762	EVOXAC (Oral Pill)	954819	cevimeline	bf6bebde-81ef-4a49-bd8b-2b7444f7adbf	2012-03-12 00:00:00	\N	\N
1763	EX-LAX MAXIMUM RELIEF FORMULA (Oral Pill)	938268	"sennosides, USP"	800366b2-e974-4791-9a0d-c341c80ac859	2013-03-25 00:00:00	\N	\N
1764	EXAPRIN (Oral Pill)	1125315	Acetaminophen	9fe82229-cc3e-4d79-a448-014fe3d0055b	2012-11-14 00:00:00	\N	\N
1765	EXCEDRIN (Oral Pill)	1125315	Acetaminophen	58375804-3c14-4af9-805b-68458e2fed8c	2015-09-01 00:00:00	\N	\N
1766	EXCEDRIN BACK & BODY (Oral Pill)	1125315	Acetaminophen	4b77be54-e962-4e6b-a244-e3d53a8fecd9	2010-10-09 00:00:00	\N	\N
1767	EXCEDRIN PM (Oral Pill)	1125315	Acetaminophen	375ba5bf-16c1-4912-9aa1-a8e7196aed31	2010-10-09 00:00:00	\N	\N
1768	EXCEDRIN PM TRIPLE ACTION (Oral Pill)	1125315	Acetaminophen	b3812d27-40af-40d7-864a-dfa4ae34cb9e	2014-11-03 00:00:00	\N	\N
1769	EXCEDRIN TENSION HEADACHE (Oral Pill)	1125315	Acetaminophen	cc17ee50-1401-4b31-8c01-e153b4291c7a	2015-05-22 00:00:00	\N	\N
1770	EXELDERM (Topical)	940535	sulconazole	9b963f0d-b041-43be-9434-7161eab49adb	2015-09-28 00:00:00	\N	\N
1771	Exemestane (Oral Pill)	1398399	exemestane	61d86c55-9946-273f-4f22-42d3fc33d143	2014-08-01 00:00:00	\N	\N
1772	EXFORGE (Oral Pill)	1332418	Amlodipine	15ba7c1c-dd10-4d09-b6e2-284c1b67f4da	2012-01-12 00:00:00	\N	\N
1773	EXFORGE HCT (Oral Pill)	1332418	Amlodipine	782bcaf4-0aa4-4527-b36f-d350ceb95637	2014-04-24 00:00:00	\N	\N
1774	EXPAREL (Injectable)	40244151	Bupivacaine liposome	bb5a9e59-0f51-11df-8a39-0800200c9a66	2015-04-24 00:00:00	\N	\N
1775	EXUBERA (Inhalant)	1588986	"insulin human, rDNA origin"	4e25a881-dfc3-44a2-9ede-49f7443776d8	2008-04-18 00:00:00	\N	\N
1776	EYE STREAM (Ophthalmic)	19010309	Water	ff9560df-d834-57a8-37b0-3f10e82f5a5d	2014-09-24 00:00:00	\N	\N
1777	EZ-OX (Inhalant)	19025274	Oxygen	cc02c6b7-c397-4929-9322-bef702c9255c	2015-02-20 00:00:00	\N	\N
1778	Ezetimibe (Oral Pill)	1526475	ezetimibe	cb18564f-663f-4da2-9dd9-700ea9bdd398	2015-06-29 00:00:00	\N	\N
1779	Ezetimibe/Simvastatin (Oral Pill)	1526475	ezetimibe	65e1c3ae-a462-4345-8a28-c7d2c0388af8	2012-09-07 00:00:00	\N	\N
1780	Factor VIII (b-domain deleted recombinant) FC fusion protein (Injectable)	45776421	factor VIII (b-domain deleted recombinant) FC fusion protein	bec39fa0-1524-4e6b-897f-db0ef093085e	2014-07-14 00:00:00	\N	\N
1781	Factor VIII (Injectable)	1352213	Factor VIII	80fa03d2-cd4c-4155-9b57-1396c4fa42da	2015-10-06 00:00:00	\N	\N
1782	Factor XIII (Injectable)	19106100	factor XIII	8664978e-1814-4930-aca5-97a24455f6df	2014-09-22 00:00:00	\N	\N
1783	FALLBACK SOLO (Oral Pill)	1589505	Levonorgestrel	38c26cb9-052e-426f-9916-c13e7a5e62d0	2014-07-23 00:00:00	\N	\N
1784	False ragweed pollen extract (Injectable)	40161714	false ragweed pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
1785	Famciclovir (Oral Pill)	1703603	famciclovir	eeeee9c4-8566-4100-8ca4-3df936a3365d	2015-09-21 00:00:00	\N	\N
1786	Famotidine (Injectable)	953076	Famotidine	e3b13e23-122b-4bd4-95cf-b5a14b7afc05	2015-08-07 00:00:00	\N	\N
1787	Famotidine (Oral Disintegrating)	953076	Famotidine	adb54fe50fcc4a01afc64aa3d3db45bb	2006-12-01 00:00:00	\N	\N
1788	Famotidine (Oral Liquid)	953076	Famotidine	a8010e10-68fd-455f-968f-d62a1c3e0ffd	2013-01-08 00:00:00	\N	\N
1789	Famotidine (Oral Pill)	953076	Famotidine	387088a6-8eaa-fc49-8050-a546d0f0fd32	2015-09-23 00:00:00	\N	\N
1790	Famotidine/Ibuprofen (Oral Pill)	953076	Famotidine	558b9f26-37b2-423b-932d-25a37afe57ec	2015-07-28 00:00:00	\N	\N
1791	FANAPT (Oral Pill)	19017241	iloperidone	43452bf8-76e7-47a9-a5d8-41fe84d061f0	2014-04-29 00:00:00	\N	\N
1792	FARESTON (Oral Pill)	1342346	Toremifene	2cab8dd1-3a10-48e6-86ce-0e5275ed49e5	2012-11-29 00:00:00	\N	\N
1793	FARXIGA (Oral Pill)	44785829	dapagliflozin	fc6ae30e-868b-4ac9-b69d-900922503998	2015-01-28 00:00:00	\N	\N
1794	FASPRIN (Oral Disintegrating)	1112807	Aspirin	73859ea9-01a0-4c3d-97d4-17b9d3378899	2010-12-01 00:00:00	\N	\N
1795	FAST FREEZE (Topical)	938205	Camphor	60c94da8-6c00-4544-a9a6-a3e87ebabd68	2011-11-22 00:00:00	\N	\N
1796	Febuxostat (Oral Pill)	19017742	febuxostat	ae1e0d8a-03fc-419b-9d44-afa68fbd5681	2011-01-04 00:00:00	\N	\N
1797	Felbamate (Oral Liquid)	795661	felbamate	2e325d79-d0a4-4af7-b09b-96ee5a5b2a37	2015-02-23 00:00:00	\N	\N
1798	Felbamate (Oral Pill)	795661	felbamate	ce919497-c2f3-4362-bfb7-cf4e82e10a5c	2015-09-14 00:00:00	\N	\N
1799	FELBATOL (Oral Liquid)	795661	felbamate	2f522701-397a-11de-8a39-0800200c9a66	2011-11-18 00:00:00	\N	\N
1800	FELBATOL (Oral Pill)	795661	felbamate	2f522701-397a-11de-8a39-0800200c9a66	2011-11-18 00:00:00	\N	\N
1801	FELDENE (Oral Pill)	1146810	Piroxicam	9d3e528b-a748-4bc5-b604-e7e9c5ab9183	2012-12-21 00:00:00	\N	\N
1802	FEM PH (Vaginal)	929549	Acetic Acid	77237c50-aeb5-44a0-a1e6-ce1551b49f75	2013-05-22 00:00:00	\N	\N
1803	Fenofibrate (Oral Pill)	1551803	Fenofibrate	194cd14a-d952-4507-91be-3f1d5371d3b8	2015-08-14 00:00:00	\N	\N
1804	FENOGLIDE (Oral Pill)	1551803	Fenofibrate	35e89d4e-45cf-4374-bf93-fca8d40d783b	2013-11-04 00:00:00	\N	\N
1805	Fenoprofen (Oral Pill)	1153928	Fenoprofen	ef59e72f-6218-4f42-8f00-d10a6a14223a	2015-08-13 00:00:00	\N	\N
1806	fentaNYL (Buccal)	1154029	Fentanyl	ad7ac196-4c6e-4aab-8742-bdb9f38f4be6	2011-01-24 00:00:00	\N	\N
1807	fentaNYL (Injectable)	1154029	Fentanyl	73cede3f-aff0-40b8-8a58-f5fc269d1b8d	2014-08-21 00:00:00	\N	\N
1808	fentaNYL (Oral Lozenge)	1154029	Fentanyl	8c3a8b2e-3ec2-4fad-bb9f-838822d97e6f	2014-04-14 00:00:00	\N	\N
1809	fentaNYL (Sublingual)	1154029	Fentanyl	f969e2bc-6297-4e29-89d3-a3685a2c7c6b	2015-01-14 00:00:00	\N	\N
1810	FERRALET 90 (Oral Pill)	19011773	Ascorbic Acid	2c9fd33d-4b38-42be-ad36-b1521ded47e1	2011-05-12 00:00:00	\N	\N
1811	Ferric carboxymaltose (Injectable)	43560392	ferric carboxymaltose	517b4a19-45b3-4286-9f6a-ced4e10447de	2013-08-12 00:00:00	\N	\N
1812	Ferric citrate (Oral Pill)	45776202	ferric citrate	aadd18e0-3752-11e4-8510-0800200c9a66	2015-08-17 00:00:00	\N	\N
1813	"Ferric oxide, saccharated (Injectable)"	1395773	"ferric oxide, saccharated"	f1ab1a22-2b99-4d27-8b5a-9c3bcd5e3040	2014-01-07 00:00:00	\N	\N
1814	Ferric subsulfate solution (Topical)	19095786	ferric subsulfate solution	e93bce8b-de3b-4477-be41-d361e68849c6	2014-11-20 00:00:00	\N	\N
1815	FERRIPROX (Oral Pill)	19011091	deferiprone	dc8cbc3d-026c-0db5-42e8-8e93d374dd23	2015-04-02 00:00:00	\N	\N
1816	FERRLECIT (Injectable)	1399177	Sodium ferric gluconate complex	b25b34ab-9cf1-4a2b-bdf2-5eaf66625999	2015-04-24 00:00:00	\N	\N
1817	Ferrous fumarate (Chewable)	1595799	Ferrous fumarate	5bdeee62-962f-4466-a1f4-ba0713d45478	2015-07-17 00:00:00	\N	\N
1818	Ferrous fumarate (Oral Pill)	1595799	Ferrous fumarate	4cafa90a-9903-40d0-b8be-6ad78018b4b6	2015-09-30 00:00:00	\N	\N
1819	Ferrous fumarate/Folic Acid (Oral Pill)	1595799	Ferrous fumarate	30138a3b-2759-48ee-afac-70eb294292f7	2014-10-10 00:00:00	\N	\N
1820	Ferrous gluconate (Oral Pill)	1396012	ferrous gluconate	304fdee6-0290-4717-be3d-b367bec7e411	2012-09-19 00:00:00	\N	\N
1821	Ferrous sulfate (Oral Liquid)	1396131	ferrous sulfate	a017eb78-8c70-4b59-b7c0-22ec6945c1a1	2013-08-21 00:00:00	\N	\N
1822	Ferrous sulfate (Oral Pill)	1396131	ferrous sulfate	91ff2cb4-1fb9-4125-9435-c9d008161203	2014-11-20 00:00:00	\N	\N
1823	FEVERALL (Rectal)	1125315	Acetaminophen	3ade895b-5dca-4d81-9415-8091923162ff	2014-09-29 00:00:00	\N	\N
1824	FEXMID (Oral Pill)	778711	cyclobenzaprine	615f1e2f-63ec-4e20-bb74-293b5baf1d43	2011-10-24 00:00:00	\N	\N
1825	Fexofenadine (Oral Disintegrating)	1153428	fexofenadine	06115cea-5a44-409d-85ed-bb71743491c1	2015-08-20 00:00:00	\N	\N
1826	Fexofenadine (Oral Liquid)	1153428	fexofenadine	c5f2ac86-b6be-486d-b1d3-7704f56c3245	2015-08-24 00:00:00	\N	\N
1827	Fexofenadine (Oral Pill)	1153428	fexofenadine	d1d8d0ec-2bdd-fb07-a051-d6353e3c240c	2015-10-05 00:00:00	\N	\N
1828	FIBER TAB (Oral Pill)	940426	calcium polycarbophil	bee100da-b9c9-4261-b6e6-7b3db5715625	2012-09-19 00:00:00	\N	\N
1829	FIBERCON (Oral Pill)	940426	calcium polycarbophil	80e507f2-d9bd-bc7b-2249-f5bfc8ac1845	2013-02-22 00:00:00	\N	\N
1830	FIBRICOR (Oral Pill)	1551803	Fenofibrate	b3149443-4baf-429b-a751-4a34a27f0249	2015-07-31 00:00:00	\N	\N
1831	Fibrinogen concentrate (human) (Injectable)	19044986	fibrinogen concentrate (human)	903dc8d0-39da-462c-9dac-004e0c7a26cc	2012-02-01 00:00:00	\N	\N
1832	Fibrinogen/Thrombin (Transdermal)	19054702	Fibrinogen	5918e503-b457-48ab-b68b-243e29651d06	2015-07-28 00:00:00	\N	\N
1833	Fidaxomicin (Oral Pill)	40239985	fidaxomicin	dd966338-c820-4270-b704-09ef75fa3ceb	2014-05-30 00:00:00	\N	\N
1834	FINACEA (Topical)	986790	Azelate	6c5e836c-2851-4524-b91d-12ffadffd9ba	2013-05-07 00:00:00	\N	\N
1835	Finasteride (Oral Pill)	996416	Finasteride	c59f8018-fff8-4884-a3c8-bc306e2c8f64	2015-08-25 00:00:00	\N	\N
1836	FIORICET (Oral Pill)	1125315	Acetaminophen	5d248332-87ff-45c2-be92-e9e8386a4749	2015-01-20 00:00:00	\N	\N
1837	FIORICET WITH CODEINE (Oral Pill)	1125315	Acetaminophen	df9801fc-03fe-41da-a6b3-0f76788217c9	2014-12-19 00:00:00	\N	\N
1838	FIORINAL (Oral Pill)	1112807	Aspirin	a00c6776-e9ef-411b-9396-915c3787559a	2015-03-16 00:00:00	\N	\N
1839	FLANAX ANTACID (Oral Liquid)	985247	Aluminum Hydroxide	8d2e51f6-4b70-4b3d-856b-072fc5af2f72	2014-10-15 00:00:00	\N	\N
1840	flavoxATE (Oral Pill)	954853	Flavoxate	22a99f74-2718-48b3-b686-caf102d3071c	2014-10-03 00:00:00	\N	\N
1841	Flecainide (Oral Pill)	1354860	Flecainide	b764c8b8-7e23-4016-830f-68312d84f3d3	2015-09-08 00:00:00	\N	\N
1842	FLEET ENEMA (Rectal)	991710	"Sodium Phosphate, Dibasic"	0a201d6d-0e45-43ca-8e09-e8b0e10ed2f4	2015-05-05 00:00:00	\N	\N
1843	FLEET GLYCERIN SUPPOSITORIES ADULT (Rectal)	961145	Glycerin	28ebc9ae-0ffa-4bc7-859d-e084505917cf	2012-11-21 00:00:00	\N	\N
1844	FLEET MINERAL OIL (Rectal)	908523	Mineral Oil	2528cb5e-437e-41f0-9c34-e9ce57404d8b	2013-02-14 00:00:00	\N	\N
1845	FLEET SOF-LAX (Oral Pill)	941258	Docusate	be5f87ac-044f-4b38-95c2-140bb60e1ba0	2014-07-08 00:00:00	\N	\N
1846	FLEXALL (Topical)	901656	Menthol	9361fcaa-ccf8-43ec-9c1e-2294377d19db	2011-06-23 00:00:00	\N	\N
1847	FLEXBUMIN (Injectable)	1344143	"Albumin Human, USP"	98b96ee2-86d2-4056-bdda-4d75d72d891f	2014-10-31 00:00:00	\N	\N
1848	FLO-PRED (Oral Liquid)	1550557	prednisolone	980b3c11-a502-4235-bbff-af83a17ebcdf	2012-01-23 00:00:00	\N	\N
1849	FLOMAX (Oral Pill)	924566	tamsulosin	0bef87bd-42fc-428f-b683-e0538b78f8d0	2012-03-13 00:00:00	\N	\N
1850	Fluconazole (Injectable)	1754994	Fluconazole	d3ca59bd-ae00-48ab-89aa-87c7f56e9989	2015-06-19 00:00:00	\N	\N
1851	Fluconazole (Oral Liquid)	1754994	Fluconazole	29bd0efa-fb16-4e69-bb96-8f6bcf80b9f7	2015-01-15 00:00:00	\N	\N
1852	Fluconazole (Oral Pill)	1754994	Fluconazole	82af879c-9ecf-4f9a-b00f-779ab4104a2f	2015-09-30 00:00:00	\N	\N
1853	Flucytosine (Oral Pill)	1755112	Flucytosine	58189ec7-118b-458a-8e4f-7867a97cfcbd	2013-11-06 00:00:00	\N	\N
1854	Fludarabine (Injectable)	1395557	fludarabine	763d6c6d-cfed-4813-8cc5-41e78d357845	2015-05-12 00:00:00	\N	\N
1855	Fludrocortisone (Oral Pill)	1555120	Fludrocortisone	bf927cd9-1891-4de4-b4be-743a26363a64	2015-04-23 00:00:00	\N	\N
1856	FLUMADINE (Oral Liquid)	1763339	Rimantadine	9c7bb7e7-a775-4f93-bd77-d08c48a86f7c	2007-07-19 00:00:00	\N	\N
1857	FLUMADINE (Oral Pill)	1763339	Rimantadine	9c7bb7e7-a775-4f93-bd77-d08c48a86f7c	2010-11-29 00:00:00	\N	\N
1858	Flumazenil (Injectable)	19055153	Flumazenil	e6237019-490f-4162-bfe0-6e2d08c0a1be	2013-08-26 00:00:00	\N	\N
1859	Fluocinolone (Implant)	996541	fluocinolone	4400e471-7402-11df-93f2-0800200c9a66	2014-12-08 00:00:00	\N	\N
1860	Fluocinolone (Otic)	996541	fluocinolone	d2ffb64b-1614-4e2f-8125-9660ea3754f2	2015-09-09 00:00:00	\N	\N
1861	Fluocinolone (Shampoo)	996541	fluocinolone	a52763d0-7024-48a8-9cca-3127333dfb01	2010-11-02 00:00:00	\N	\N
1862	Fluocinolone (Topical)	996541	fluocinolone	8d55d846-c833-4040-b02d-ac7783311dd6	2015-10-06 00:00:00	\N	\N
1863	Fluocinolone/Hydroquinone/Tretinoin (Topical)	996541	fluocinolone	a35fa709-5eb5-4429-b38f-f1e0019bf0ee	2014-04-15 00:00:00	\N	\N
1864	Fluocinolone/Neomycin (Topical)	996541	fluocinolone	e96ae9cf-e829-466f-b66d-ede83b4d8b3d	2014-07-15 00:00:00	\N	\N
1865	Fluocinonide (Topical)	955252	Fluocinonide	edb61362-d48f-487a-b15f-5ea3089d2f30	2015-06-09 00:00:00	\N	\N
1866	FLUOR A DAY (Oral Liquid)	19069022	Sodium Fluoride	4c854364-e732-4dec-b1d1-b8a97e4e1176	2010-08-24 00:00:00	\N	\N
1867	FLUOR A DAY CHEWABLE (Chewable)	19069022	Sodium Fluoride	4c854364-e732-4dec-b1d1-b8a97e4e1176	2010-08-24 00:00:00	\N	\N
1868	FLUOR-OP (Ophthalmic)	955583	Fluorometholone	545776fe-63df-44ab-ace3-f3d73d2e0092	2006-08-07 00:00:00	\N	\N
1869	Fluorescein/Proparacaine (Ophthalmic)	996625	Fluorescein	dae037ad-dcb8-42e6-8996-e575922d7631	2015-01-05 00:00:00	\N	\N
1870	FLUORIDEX (Toothpaste)	19069022	Sodium Fluoride	d05f94c8-3020-4f7c-877a-d64d6841a122	2015-05-26 00:00:00	\N	\N
1871	FLUORIDEX DAILY DEFENSE SENSITIVITY (Toothpaste)	927322	potassium nitrate	fed4c40e-e9ce-4e99-8223-325af383eaa8	2015-05-26 00:00:00	\N	\N
1872	FLUORITAB (Chewable)	19069022	Sodium Fluoride	cd18915a-0b63-4fed-aebe-0c2fe60d8505	2012-10-31 00:00:00	\N	\N
1873	Fluorometholone (Ophthalmic)	955583	Fluorometholone	b810b4c3-ac7a-4ba5-85bf-ebfaf3b1dabf	2013-02-25 00:00:00	\N	\N
1874	Fluorometholone/Tobramycin (Ophthalmic)	955583	Fluorometholone	cbdf11f4-d84c-4c4a-aac2-f8c23304fb02	2008-03-13 00:00:00	\N	\N
1875	FLUOROPLEX (Topical)	955632	Fluorouracil	258bb79a-56b3-4f46-ade6-7331ec031074	2012-11-16 00:00:00	\N	\N
1876	Fluorouracil (Injectable)	955632	Fluorouracil	beb8c6c5-4b6e-4770-b6d4-718e33c7a2ff	2014-10-01 00:00:00	\N	\N
1877	Fluorouracil (Topical)	955632	Fluorouracil	58fa81e2-9dbc-4cef-82d4-e5dc4aec5b26	2015-04-30 00:00:00	\N	\N
1878	FLUoxetine (Oral Liquid)	755695	Fluoxetine	142f9b27-65a7-4add-bdcc-2468695fedff	2015-03-12 00:00:00	\N	\N
1879	FLUoxetine (Oral Pill)	755695	Fluoxetine	23899405-007b-48d9-82a9-a530b8e90784	2015-08-14 00:00:00	\N	\N
1880	FLUoxetine/OLANZapine (Oral Pill)	755695	Fluoxetine	2f6ceda3-3edc-4427-98a6-23e3c930c44d	2013-03-12 00:00:00	\N	\N
1881	Fluoxymesterone (Oral Pill)	1555887	Fluoxymesterone	5328c194-5650-4d1f-9e28-8cea038cce81	2014-10-08 00:00:00	\N	\N
1882	fluPHENAZine (Injectable)	756018	Fluphenazine	2a8ef5f7-c806-470d-96ff-3b3827dc8938	2014-12-18 00:00:00	\N	\N
1883	fluPHENAZine (Oral Liquid)	756018	Fluphenazine	0860b3f3-3116-40f8-bcb0-e5c47731bdc8	2010-12-22 00:00:00	\N	\N
1884	fluPHENAZine (Oral Pill)	756018	Fluphenazine	33bffb02-f1cc-4554-a3b7-9f2291feb4ac	2015-09-18 00:00:00	\N	\N
1885	FLURA-DROPS (Oral Liquid)	19069022	Sodium Fluoride	ddb4c0d6-6739-2a4b-8a90-1c8aec94f4ab	2014-05-12 00:00:00	\N	\N
1886	Flurandrenolide (Topical)	956266	Flurandrenolide	a0949773-c75f-4ef0-a69c-1abd978340d0	2014-06-06 00:00:00	\N	\N
1887	Flurazepam (Oral Pill)	756349	Flurazepam	2f2db2f5-49d3-4d47-a08a-628df49d2120	2015-01-29 00:00:00	\N	\N
1888	Flurbiprofen (Ophthalmic)	1156378	Flurbiprofen	5a4d5684-b20a-4fde-a808-404c7b9d25b3	2015-08-10 00:00:00	\N	\N
1889	Flurbiprofen (Oral Pill)	1156378	Flurbiprofen	c9449292-e81e-486a-84e1-bb9dd0f612c5	2012-06-21 00:00:00	\N	\N
1890	Flutamide (Oral Pill)	1356461	Flutamide	bae781d4-7101-4008-9af2-6e76b5e1c408	2012-09-04 00:00:00	\N	\N
1891	Fluticasone (Topical)	1149380	fluticasone	0e20d1cc-5c7a-4e0d-810b-b94c4d6dd1c0	2015-05-07 00:00:00	\N	\N
1892	Fluvastatin (Oral Pill)	1549686	fluvastatin	e38126a5-9d6a-422f-812c-a01610108162	2014-08-28 00:00:00	\N	\N
1893	fluvoxaMINE (Oral Pill)	751412	Fluvoxamine	727a5eb4-ac82-444d-8381-44c34ee3b895	2015-09-23 00:00:00	\N	\N
1894	FLUXID (Oral Disintegrating)	953076	Famotidine	adb54fe50fcc4a01afc64aa3d3db45bb	2006-12-01 00:00:00	\N	\N
1895	FML (Ophthalmic)	955583	Fluorometholone	c374d65a-35b5-4c9e-9069-5148875dc4df	2013-02-15 00:00:00	\N	\N
1896	FML FORTE LIQUIFILM (Ophthalmic)	955583	Fluorometholone	b810b4c3-ac7a-4ba5-85bf-ebfaf3b1dabf	2013-02-25 00:00:00	\N	\N
1897	FML-S (Ophthalmic)	955583	Fluorometholone	9d71d7fd-2b25-4163-922f-018ed8c5171f	2007-02-23 00:00:00	\N	\N
1898	FOILLE (Topical)	917006	Benzocaine	e2eca808-e97b-43e0-aa51-7025cc61c7a8	2013-03-08 00:00:00	\N	\N
1899	FOLBIC (Oral Pill)	19111620	Folic Acid	99121923-2b2d-427a-865a-e8b7dd052569	2010-12-13 00:00:00	\N	\N
1900	FOLCAPS (Oral Pill)	19111620	Folic Acid	47d368ab-5165-4ce3-b993-f5d72bb5b238	2010-07-20 00:00:00	\N	\N
1901	Folic Acid (Injectable)	19111620	Folic Acid	e215318c-4f8b-4711-ae76-f370d1da0f3b	2011-09-01 00:00:00	\N	\N
1902	Folic Acid (Oral Pill)	19111620	Folic Acid	f2c543b3-1b17-4072-8b86-ddecaf3445d6	2015-06-15 00:00:00	\N	\N
1903	Folic Acid/Heme iron polypeptide/Polysaccharide iron complex/Vitamin B 12 (Oral Pill)	19111620	Folic Acid	a7c1400a-d230-45db-afff-d5f70b091ee9	2015-07-17 00:00:00	\N	\N
1904	Folic Acid/Polysaccharide iron complex/Vitamin B 12 (Oral Pill)	19111620	Folic Acid	ed2308e3-5310-41bd-9333-615c26183493	2014-03-07 00:00:00	\N	\N
1905	Folic Acid/Vitamin B 12/Vitamin B6 (Oral Pill)	19111620	Folic Acid	8751d1f4-7ed7-40ce-bc4d-bde94d96a859	2015-02-25 00:00:00	\N	\N
1906	Follitropin Alfa (Injectable)	1542948	Follitropin Alfa	ae85b9c3-e7eb-4981-a5d9-346050e8f189	2013-05-01 00:00:00	\N	\N
1907	FOLTABS (Oral Pill)	19111620	Folic Acid	a0c87255-6105-4ae6-a698-dae0115265ab	2010-07-20 00:00:00	\N	\N
1908	Fomepizole (Injectable)	19022479	fomepizole	a306cd11-9acf-45f1-91ec-9fef2b08fdb1	2013-08-01 00:00:00	\N	\N
1909	FORADIL (Inhalant)	1196677	formoterol	04212000-ec03-42a3-8b9e-3a28237f415e	2012-03-05 00:00:00	\N	\N
1910	FORANE (Inhalant)	782043	Isoflurane	3d30eb8d-a62e-475f-926b-78ba63bee9c8	2011-12-29 00:00:00	\N	\N
1911	FORMA-RAY (Topical)	1756524	Formaldehyde	74a85045-d668-4c98-8302-099a063cca3a	2010-10-08 00:00:00	\N	\N
1912	FORMADON (Topical)	1756524	Formaldehyde	36b221c6-4318-4e2a-8cd0-d5558b04cdc6	2010-10-07 00:00:00	\N	\N
1913	Formaldehyde (Topical)	1756524	Formaldehyde	74a85045-d668-4c98-8302-099a063cca3a	2010-10-08 00:00:00	\N	\N
1914	Formoterol (Inhalant)	1196677	formoterol	04212000-ec03-42a3-8b9e-3a28237f415e	2012-03-05 00:00:00	\N	\N
1915	FORTICAL (Nasal)	1537655	salmon calcitonin	e662c321-8c1b-4829-b4c9-459284f654c3	2010-09-14 00:00:00	\N	\N
1916	FOSAMAX (Oral Pill)	1557272	Alendronate	e6ffadda-2ace-4e99-8bb4-75631c54f39b	2010-03-10 00:00:00	\N	\N
1917	FOSAMAX PLUS D (Oral Pill)	1557272	Alendronate	d4a71df1-7488-46a2-8ded-dd0db56de618	2011-12-28 00:00:00	\N	\N
1918	Fosamprenavir (Oral Pill)	1736829	fosamprenavir	009575f9-74e8-4a6d-9fa6-3cae72fd01c3	2010-05-26 00:00:00	\N	\N
1919	Foscarnet (Injectable)	1724700	Foscarnet	a09299d5-9c55-4cef-aed0-3a6a45532289	2014-11-18 00:00:00	\N	\N
1920	FOSCAVIR (Injectable)	1724700	Foscarnet	90e3da4e-3b1f-428b-99ca-e4bed1c80028	2014-11-18 00:00:00	\N	\N
1921	Fosinopril (Oral Pill)	1363749	Fosinopril	cfd96e4b-fcf1-4959-aaf4-7aabe0d80ab5	2014-07-17 00:00:00	\N	\N
1922	Fosinopril/Hydrochlorothiazide (Oral Pill)	1363749	Fosinopril	7f60424f-b90c-459c-ae53-b732ee3d67b5	2014-04-29 00:00:00	\N	\N
1923	FOSRENOL (Chewable)	990028	lanthanum carbonate	21bc55ec-5f23-4d0b-9488-d5b08b7c0fc2	2012-04-23 00:00:00	\N	\N
1924	FRAGMIN (Injectable)	1301065	Dalteparin	23527b8b-9b28-4e6d-9751-33b143975ac7	2015-09-08 00:00:00	\N	\N
1925	FRESHKOTE (Ophthalmic)	948856	Polyvinyl Alcohol	6397ebc5-0670-4dc0-8660-6c0f733e6fd1	2014-09-10 00:00:00	\N	\N
1926	FROVA (Oral Pill)	1189458	frovatriptan	8ce8bf0a-8b21-41a5-bbea-71302312c2c5	2014-10-24 00:00:00	\N	\N
1927	Frovatriptan (Oral Pill)	1189458	frovatriptan	35941e47-106d-414d-9529-0a56af7396d5	2014-10-24 00:00:00	\N	\N
1928	Fructose/Glucose/Phosphoric acid (Oral Liquid)	956691	Fructose	24d87e9b-58d5-4753-a123-6e1a5336e4ed	2015-09-29 00:00:00	\N	\N
1929	Fructose/Glucose/Sodium citrate (Oral Liquid)	956691	Fructose	728376f5-6cab-404e-b519-f6c595291d6f	2010-10-09 00:00:00	\N	\N
1930	FUNGI-NAIL (Topical)	914244	Undecylenate	bc737ee2-0651-4f02-8157-bbed81507c35	2015-04-17 00:00:00	\N	\N
1931	FUNGICURE MAXIMUM STRENGTH (Topical)	914244	Undecylenate	0eca7b88-8c23-4fff-a07b-7f850832ff10	2015-08-10 00:00:00	\N	\N
1932	FUNGOID (Topical)	907879	Miconazole	250d0a66-01d1-4aba-8f24-4cb4ca529fda	2014-04-29 00:00:00	\N	\N
1933	Furosemide (Injectable)	956874	Furosemide	71b48f4d-9936-448c-9e3a-33f1182e1039	2015-07-02 00:00:00	\N	\N
1934	Furosemide (Oral Liquid)	956874	Furosemide	9ca6640e-dbfb-4bcd-bf3e-c8c68b7d41a1	2013-04-26 00:00:00	\N	\N
1935	Furosemide (Oral Pill)	956874	Furosemide	ea5805d3-400b-4978-b27d-bd2b5b1cb636	2015-09-22 00:00:00	\N	\N
1936	Fusarium oxysporum vasinfectum extract (Injectable)	40167646	Fusarium oxysporum vasinfectum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
1937	G-ZYNCOF (Oral Liquid)	1119510	Dextromethorphan	c1aa7060-0f32-4ea1-8e2e-1aa131bd55fc	2012-12-03 00:00:00	\N	\N
1938	Gabapentin (Oral Liquid)	797399	gabapentin	3255245c-6ae6-46ab-a1c1-0b8d4d4cdaa2	2015-05-20 00:00:00	\N	\N
1939	Gabapentin (Oral Pill)	797399	gabapentin	9508cb1b-3f9f-48bd-8f34-a6fbb68c9a4a	2015-10-13 00:00:00	\N	\N
1940	GABITRIL (Oral Pill)	715458	tiagabine	175f2d9f-449b-4d95-a4b9-94f891f8e3ae	2011-08-29 00:00:00	\N	\N
1941	Galantamine (Oral Liquid)	757627	Galantamine	d5b0e225-e94d-4324-afb2-b6e51c949dd0	2015-06-02 00:00:00	\N	\N
1942	Galantamine (Oral Pill)	757627	Galantamine	7dc963dd-84d6-45f3-857f-46a44fe9edc8	2015-09-30 00:00:00	\N	\N
1943	Gallium nitrate (Injectable)	19097605	gallium nitrate	8bc2ddf8-d695-46b3-bf76-9f85ce6027e3	2012-03-23 00:00:00	\N	\N
1944	GALZIN (Oral Pill)	979096	Zinc Acetate	a0c72bff-20f3-4241-b966-34a95178d1a3	2012-06-22 00:00:00	\N	\N
1945	Gamma-Aminobutyrate/Melatonin/Valerian root extract (Oral Pill)	19123846	gamma-Aminobutyrate	b450210c-516d-4068-b792-8bed31b26e32	2014-12-03 00:00:00	\N	\N
1946	GAMMAGARD (Injectable)	19117912	Immunoglobulin G	9d42adca-0dd7-4df7-864d-5a7feee52130	2015-03-04 00:00:00	\N	\N
1947	Ganciclovir (Injectable)	1757803	Ganciclovir	35addab5-09db-4f8a-9c69-6fbce33ecc37	2014-04-04 00:00:00	\N	\N
1948	Ganciclovir (Oral Pill)	1757803	Ganciclovir	3406db8a-5ae9-4120-94bd-036701adbeca	2014-07-10 00:00:00	\N	\N
1949	GANITE (Injectable)	19097605	gallium nitrate	8bc2ddf8-d695-46b3-bf76-9f85ce6027e3	2012-03-23 00:00:00	\N	\N
1950	GARAMYCIN (Ophthalmic)	919345	Gentamicin Sulfate (USP)	aa2b006d-f67c-4c71-abce-55d55295b5bb	2014-07-23 00:00:00	\N	\N
1951	Garrys oak pollen extract (Injectable)	40172997	Garrys oak pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
1952	GAS-X (Chewable)	966991	Simethicone	c70b8a69-f853-4981-aff5-389aa58f7169	2012-06-18 00:00:00	\N	\N
1953	GAS-X (Oral Pill)	966991	Simethicone	ee9a8404-0653-433f-90e5-7ac69bdab8df	2013-12-12 00:00:00	\N	\N
1954	GAS-X EXTRA STRENGTH (Oral Pill)	966991	Simethicone	980362cf-1d15-4286-8ab8-bfeac7d34f4a	2014-12-17 00:00:00	\N	\N
1955	GASTROCROM (Oral Liquid)	1152631	Cromolyn	00623958-a8fe-47d1-a0d2-0aa4e2f7966e	2015-06-09 00:00:00	\N	\N
1956	Gatifloxacin (Ophthalmic)	1789276	gatifloxacin	3dd6ac6b-877a-46c7-bbc8-c7119f341abe	2015-04-15 00:00:00	\N	\N
1957	GATTEX (Injectable)	43013171	teduglutide	66b69c1e-b25c-44d3-b5ff-1c1de9a516fa	2013-01-16 00:00:00	\N	\N
1958	GAVILAX (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	19672e23-1606-497e-a112-939af33af195	2015-01-13 00:00:00	\N	\N
1959	GAVILYTE-N (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	27195187-75a3-431f-90d9-84da1b94e849	2009-11-19 00:00:00	\N	\N
1960	GAVISCON (Chewable)	985247	Aluminum Hydroxide	7f367927-c366-465c-a059-e2cfb337d562	2014-09-10 00:00:00	\N	\N
1961	GAVISCON (Oral Liquid)	985247	Aluminum Hydroxide	2d74e5bc-1f10-4fb6-9258-cd906e360013	2014-08-01 00:00:00	\N	\N
1962	GAVISCON CHEWABLE (Chewable)	985247	Aluminum Hydroxide	7f367927-c366-465c-a059-e2cfb337d562	2014-09-10 00:00:00	\N	\N
1963	Gefitinib (Oral Pill)	1319193	gefitinib	827d60e8-7e07-41b7-c28b-49ef1c4a5a41	2015-07-17 00:00:00	\N	\N
1964	GEL-KAM (Oral Gel)	1036094	Stannous Fluoride	8c2c3c5c-ddef-4a4d-8bc3-5a98c577e74c	2015-09-16 00:00:00	\N	\N
1965	GELATO PERIO RINSE (Mouthwash)	1036094	Stannous Fluoride	f8721665-b304-4b1c-9bda-385d7671d099	2013-12-12 00:00:00	\N	\N
1966	GELATO SODIUM FLUORIDE (Oral Foam)	19069022	Sodium Fluoride	bcf97201-341a-4aa5-9aa8-1d73bb55b881	2013-12-12 00:00:00	\N	\N
1967	GELATO SODIUM FLUORIDE (Oral Gel)	19069022	Sodium Fluoride	a857af18-8eb8-47dc-bb26-73a321ed643c	2015-04-30 00:00:00	\N	\N
1968	GELATO SODIUM FLUORIDE (Toothpaste)	19069022	Sodium Fluoride	8b267c4d-4d07-421a-85c6-0451012d7dae	2013-12-12 00:00:00	\N	\N
1969	GELNIQUE (Topical)	918906	oxybutynin	c6754623-b14c-4fc3-8719-48eee3119156	2015-07-27 00:00:00	\N	\N
1970	Gemcitabine (Injectable)	1314924	gemcitabine	6004fba9-49c0-4781-8134-44bf7cf196fd	2015-07-01 00:00:00	\N	\N
1971	Gemfibrozil (Oral Pill)	1558242	Gemfibrozil	22ea8379-50aa-4550-98f0-708d6da97e79	2015-09-23 00:00:00	\N	\N
1972	GENERLAC (Oral Liquid)	987245	Lactulose	2a2eee86-273e-4718-8f78-34f15e193040	2014-01-24 00:00:00	\N	\N
1973	GENTAK (Ophthalmic)	919345	Gentamicin Sulfate (USP)	a357d23d-1f10-44ce-a2fa-a6a5e03e7739	2013-07-01 00:00:00	\N	\N
1974	Gentamicin Sulfate (USP) (Injectable)	919345	Gentamicin Sulfate (USP)	1bf429e3-6e0c-4244-ba1a-af1a3a153c24	2015-10-06 00:00:00	\N	\N
1975	Gentamicin Sulfate (USP) (Ophthalmic)	919345	Gentamicin Sulfate (USP)	c5fac820-18a1-452f-bc2c-58ed73babb0c	2015-09-14 00:00:00	\N	\N
1976	Gentamicin Sulfate (USP) (Topical)	919345	Gentamicin Sulfate (USP)	4cfbe37e-11d6-46fc-b287-0561387b17b7	2014-10-24 00:00:00	\N	\N
1977	GENTEAL (Ophthalmic)	902251	hypromellose	3c4ea323-2407-4f9d-b44f-eebf127924ba	2012-10-11 00:00:00	\N	\N
1978	GENTEAL GEL DROPS (Ophthalmic)	949279	Carboxymethylcellulose	c9dcab71-3ec8-45ff-83f0-132c6c6e63bd	2012-10-23 00:00:00	\N	\N
1979	Gentian Violet (Topical)	959362	Gentian Violet	7b4e6572-cb44-491d-8063-f7519307a8e5	2014-03-11 00:00:00	\N	\N
1980	GENTLELAX (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	0d820dcc-440a-4036-86e9-fdb30cac9573	2015-05-06 00:00:00	\N	\N
1981	GEOCILLIN (Oral Pill)	1740546	Carbenicillin	02010995-9826-4a67-945b-f3022e6081df	2007-09-14 00:00:00	\N	\N
1982	GEODON (Injectable)	712615	ziprasidone	036db1f2-52b3-42a0-acf9-817b7ba8c724	2015-02-13 00:00:00	\N	\N
1983	GEODON (Oral Pill)	712615	ziprasidone	a3aa96bb-2cc1-4316-b94c-61593e927505	2012-07-13 00:00:00	\N	\N
1984	GERI-HYDROLAC (Topical)	19011035	Lactate	5d2efce6-3cb4-4c86-b899-c1611a25384e	2013-06-21 00:00:00	\N	\N
1985	Giant ragweed pollen extract (Injectable)	40161718	giant ragweed pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
1986	Giant ragweed pollen extract/Western ragweed pollen extract (Injectable)	40161718	giant ragweed pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
1987	GIAZO (Oral Pill)	934262	balsalazide	fc5146c6-448b-44c9-bb06-8bdfe484f2f1	2013-05-14 00:00:00	\N	\N
1988	GILOTRIF (Oral Pill)	43533090	Afatinib	fd638e5e-8032-e7ca-0179-95e96ab5d387	2015-09-01 00:00:00	\N	\N
1989	GILPHEX (Oral Pill)	1163944	Guaifenesin	80a33cba-9577-402a-84bc-1507c439c933	2012-04-03 00:00:00	\N	\N
1990	GINGI MED (Mouthwash)	1036094	Stannous Fluoride	e07e291b-2cdd-444a-a510-1e9199323f38	2012-04-20 00:00:00	\N	\N
1991	Glimepiride (Oral Pill)	1597756	glimepiride	1249298e-9d2c-41e6-94ac-95f8e75d6c26	2015-10-01 00:00:00	\N	\N
1992	glipiZIDE (Oral Pill)	1560171	Glipizide	2e51d1ae-a486-4d7a-b5ee-2324c8c42fb2	2015-09-30 00:00:00	\N	\N
1993	GlipiZIDE/metFORMIN (Oral Pill)	1560171	Glipizide	0e7bfe7f-c0c5-4ef1-a7bf-9b01712621f0	2015-05-22 00:00:00	\N	\N
1994	GLUCAGEN (Injectable)	1560278	Glucagon	f09feb8e-6651-4708-a811-bb5264712059	2015-01-06 00:00:00	\N	\N
1995	Glucagon (Injectable)	1560278	Glucagon	ff16e4b1-3668-4cb4-91a4-77ee509cd6f6	2015-05-15 00:00:00	\N	\N
1996	Glucarpidase (Injectable)	42709319	glucarpidase	acaef5a6-b740-40e3-8ffe-74a75c74745c	2013-04-08 00:00:00	\N	\N
1997	GLUCOPHAGE (Oral Pill)	1503297	Metformin	4a0166c7-7097-4e4a-9036-6c9a60d08fc6	2015-06-24 00:00:00	\N	\N
1998	Glucose (Injectable)	1560524	Glucose	c8758d46-17c8-4fcd-9a0f-e73a2dad6860	2015-08-19 00:00:00	\N	\N
1999	Glucose (Oral Gel)	1560524	Glucose	39edd887-b89f-4765-8fac-72df3ba3efc3	2012-09-20 00:00:00	\N	\N
2000	Glucose (Oral Liquid)	1560524	Glucose	fe237543-f1f9-42f9-a262-d34b581cfeb3	2014-12-24 00:00:00	\N	\N
2001	Glucose/Magnesium acetate/Potassium Acetate/Sodium Chloride (Injectable)	1560524	Glucose	85c08b62-8de0-42d2-8cdc-fe42e6b605d7	2015-02-27 00:00:00	\N	\N
2002	Glucose/Potassium Chloride (Injectable)	1560524	Glucose	45de5402-5e61-4bbd-8bbc-5e3392c9920e	2015-08-05 00:00:00	\N	\N
2003	Glucose/Potassium Chloride/Sodium Chloride (Injectable)	1560524	Glucose	01321de3-bf0b-4460-9aee-511406ee101e	2014-07-23 00:00:00	\N	\N
2004	Glucose/Sodium Chloride (Injectable)	1560524	Glucose	7949edf6-3afd-48cb-9f02-5136d69f9e27	2014-12-24 00:00:00	\N	\N
2005	GLUCOTROL (Oral Pill)	1560171	Glipizide	504567d2-e4f1-428d-b524-f29db76e6dfb	2012-01-12 00:00:00	\N	\N
2006	Glutamine (Oral Liquid)	19060985	Glutamine	cd3fb572-c5b1-43da-aea2-31208985f544	2014-07-21 00:00:00	\N	\N
2007	GLUTOSE (Oral Gel)	1560524	Glucose	39edd887-b89f-4765-8fac-72df3ba3efc3	2012-09-20 00:00:00	\N	\N
2008	GLY-OXIDE (Mucosal)	958999	carbamide peroxide	086a0b82-e947-41c9-89e7-ba06483960c9	2012-07-12 00:00:00	\N	\N
2009	glyBURIDE (Oral Pill)	1559684	Glyburide	f26d05c9-d01b-46ab-933d-a01ea488ec9b	2015-09-03 00:00:00	\N	\N
2010	GlyBURIDE/metFORMIN (Oral Pill)	1559684	Glyburide	e57d2503-11d2-44cd-a4a6-6981db0dec34	2015-05-19 00:00:00	\N	\N
2011	Glycerin (Ophthalmic)	961145	Glycerin	00071697-4ac6-4962-8eee-388b8b52bd40	2010-11-23 00:00:00	\N	\N
2012	Glycerin (Oral Gel)	961145	Glycerin	0d371e48-d722-4b77-b354-5a44179247bc	2010-10-09 00:00:00	\N	\N
2013	Glycerin (Rectal)	961145	Glycerin	5dcea9dc-51f7-4de8-ba41-1bebfd2a6671	2014-10-14 00:00:00	\N	\N
2014	Glycerin (Topical)	961145	Glycerin	a6d4c5a0-8276-4d02-9573-b439be2780a4	2015-03-30 00:00:00	\N	\N
2015	Glycerin/Hypromellose/Polyethylene Glycol 400 (Ophthalmic)	961145	Glycerin	ac9fb8ee-d0b9-43dc-900b-1362b56974cc	2015-04-27 00:00:00	\N	\N
2016	Glycerin/Naphazoline (Ophthalmic)	961145	Glycerin	a26ef66e-2def-4c98-9959-d40d4cfe3108	2015-02-18 00:00:00	\N	\N
2017	Glycerin/Naphazoline/Zinc Sulfate (Ophthalmic)	961145	Glycerin	a710be3f-fa5b-46a6-87b5-5a4d1f807e1c	2012-04-12 00:00:00	\N	\N
2018	Glycerin/Petrolatum/Phenylephrine/Pramoxine (Rectal)	961145	Glycerin	fb170371-2e5d-43ca-a259-538a973ee3b8	2015-08-28 00:00:00	\N	\N
2019	Glycerin/Phenol (Mucosal)	961145	Glycerin	882c940c-b3c3-4aa4-8d64-e4260f066ff4	2013-03-05 00:00:00	\N	\N
2020	Glycerin/Propylene glycol (Ophthalmic)	961145	Glycerin	5a435dbc-669f-49c9-abf2-5e35f1e3d578	2014-10-24 00:00:00	\N	\N
2021	Glycine (Irrigation)	962398	Glycine	f4d83550-42de-44c7-b8d5-1d0debc6aec2	2014-10-01 00:00:00	\N	\N
2022	GLYCOLAX (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	5e25cd00-69a8-4d83-b3a4-d97fffeaf893	2012-06-11 00:00:00	\N	\N
2023	Glycopyrrolate (Injectable)	963353	Glycopyrrolate	d5a18d74-0d40-46e2-aa0a-41d18609a536	2015-06-19 00:00:00	\N	\N
2024	Glycopyrrolate (Oral Liquid)	963353	Glycopyrrolate	d200bd44-9856-4104-a29e-a4cca3db6737	2013-06-10 00:00:00	\N	\N
2025	Glycopyrrolate (Oral Pill)	963353	Glycopyrrolate	a9fe52b4-9290-4e26-a142-1506572bc217	2015-10-05 00:00:00	\N	\N
2026	GLYNASE (Oral Pill)	1559684	Glyburide	a7fce80a-2f13-43cc-8e1c-561f7d3ec3d5	2015-06-02 00:00:00	\N	\N
2027	GLYTONE (Topical)	976778	hydroquinone	f1fd0340-7975-435f-9de8-3064c6e2250e	2014-08-11 00:00:00	\N	\N
2028	GOLD BOND ANTI-ITCH INTENSIVE RELIEF (Topical)	916662	dimethicone	7c0f98df-6900-4fe5-abee-8378799ea754	2014-06-19 00:00:00	\N	\N
2029	GOLD BOND BABY CORNSTARCH PLUS (Topical)	40230159	cornstarch	5654facc-ad51-4501-a505-9c0b2035e653	2011-09-08 00:00:00	\N	\N
2030	GOLD BOND BODY POWDER EXTRA STRENGTH (Topical)	901656	Menthol	dd74205d-4520-417e-b43f-6622c35c1971	2012-01-30 00:00:00	\N	\N
2031	GOLD BOND BODY POWDER ORIGINAL STRENGTH (Topical)	901656	Menthol	dd74205d-4520-417e-b43f-6622c35c1971	2012-01-30 00:00:00	\N	\N
2032	GOLD BOND FOOT POWDER MAXIMUM STRENGTH (Topical)	901656	Menthol	9074c659-dea5-4656-8abb-01f0b1a6927e	2015-04-30 00:00:00	\N	\N
2033	GOLD BOND LOTION (Topical)	916662	dimethicone	33cc1470-f0c2-4e25-bc49-ca23e3b195f0	2012-01-30 00:00:00	\N	\N
2034	GOLD BOND ULTIMATE ECZEMA RELIEF (Topical)	986261	Colloidal oatmeal	52744c77-278f-40b1-a356-14ae4366389b	2015-08-31 00:00:00	\N	\N
2035	Golimumab (Injectable)	19041065	golimumab	9e260a47-55af-4c92-8d88-a86ccc767fff	2015-08-10 00:00:00	\N	\N
2036	Gonadorelin (Injectable)	19089810	Gonadorelin	34d9ef24-7c00-4c5a-8851-dc9a9885eb8f	2013-08-06 00:00:00	\N	\N
2037	GONAL F (Injectable)	1542948	Follitropin Alfa	ae85b9c3-e7eb-4981-a5d9-346050e8f189	2013-05-01 00:00:00	\N	\N
2038	GONIOSOFT (Ophthalmic)	902251	hypromellose	b9885de2-bd4c-c5c8-7ce3-c3f1669e74ea	2012-12-28 00:00:00	\N	\N
2039	GONIOVISC (Ophthalmic)	902251	hypromellose	b8b57c41-aae6-4cbd-8fbf-0a1c6fa196d9	2014-04-11 00:00:00	\N	\N
2040	GOODY'S BODY PAIN (Oral Powder)	1125315	Acetaminophen	055d0288-61d4-48bc-b91f-6ecc1969beb8	2013-11-27 00:00:00	\N	\N
2041	GOODY'S EXTRA STRENGTH (Oral Powder)	1125315	Acetaminophen	16d774cc-4247-4bf8-9b5a-c338ffebda3d	2013-11-27 00:00:00	\N	\N
2042	GOODY'S PM (Oral Powder)	1125315	Acetaminophen	db5d6c2b-688e-4e88-a42d-0fa2b0d8140b	2013-12-02 00:00:00	\N	\N
2043	Gramicidin/Neomycin/Polymyxin B (Ophthalmic)	963742	Gramicidin	94e3b620-f9b2-4c8b-9ee8-8b27207a2cab	2015-08-17 00:00:00	\N	\N
2044	Granisetron (Injectable)	1000772	Granisetron	af68579f-c863-4535-94af-a4126b43c182	2015-07-21 00:00:00	\N	\N
2045	Granisetron (Oral Pill)	1000772	Granisetron	02dc4c34-04e8-4f16-8109-b04d600a9c61	2015-03-25 00:00:00	\N	\N
2046	GRASTEK (Sublingual)	40161488	Timothy grass pollen extract	1d7f3e56-c233-47a4-9bcd-80098ffff47d	2015-02-27 00:00:00	\N	\N
2047	Green ash pollen extract/White ash pollen extract (Injectable)	40161734	green ash pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2048	GRIS-PEG (Oral Pill)	1763779	Griseofulvin	20aa6571-ee10-4dc1-9be9-018aa0a680fc	2010-11-05 00:00:00	\N	\N
2049	Griseofulvin (Oral Liquid)	1763779	Griseofulvin	82f52d21-eacd-4edf-8ad5-a8ef090ffa2a	2015-04-22 00:00:00	\N	\N
2050	Griseofulvin (Oral Pill)	1763779	Griseofulvin	993f0609-0f63-4bd5-b383-a19a00945c7e	2014-01-27 00:00:00	\N	\N
2051	Groundsel pollen extract (Injectable)	40172352	groundsel pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2052	guaiFENesin (Oral Granules)	1163944	Guaifenesin	fd8a69aa-eb75-4e7a-8b6e-3361f810c578	2012-06-20 00:00:00	\N	\N
2053	guaiFENesin (Oral Liquid)	1163944	Guaifenesin	60e25a79-ec9a-4266-9f95-6f2848ce69cd	2015-10-02 00:00:00	\N	\N
2054	guaiFENesin (Oral Pill)	1163944	Guaifenesin	43829ee3-23a7-4430-8a08-a5df09fc564d	2015-10-13 00:00:00	\N	\N
2055	guaiFENesin/HYDROcodone (Oral Liquid)	1163944	Guaifenesin	1d0c2c03-ca11-30b1-e054-00144ff8d46c	2015-08-18 00:00:00	\N	\N
2056	guaiFENesin/Phenylephrine (Oral Liquid)	1163944	Guaifenesin	9ebee4c3-c0fb-417e-901f-eaaf678654f9	2015-08-11 00:00:00	\N	\N
2057	guaiFENesin/Phenylephrine (Oral Pill)	1163944	Guaifenesin	ae9f4939-6a79-4f68-a58e-89246e36e158	2015-09-23 00:00:00	\N	\N
2058	guaiFENesin/Pseudoephedrine (Oral Pill)	1163944	Guaifenesin	383281d7-0d25-4423-ace2-d2985f2c37d0	2015-09-01 00:00:00	\N	\N
2059	guanFACINE (Oral Pill)	1344965	Guanfacine	c6e30fc7-5ad3-41c1-a673-b4db53f2b98f	2015-04-24 00:00:00	\N	\N
2060	Guanidine (Oral Pill)	766337	Guanidine	903fbd33-e5d9-41fb-9414-7bd6f42a8593	2012-08-02 00:00:00	\N	\N
2061	GYNE-LOTRIMIN (Vaginal)	1000632	Clotrimazole	79ee7b42-9934-472c-8e08-cda31be9e72d	2012-03-29 00:00:00	\N	\N
2062	GYNOL II (Vaginal)	969444	Nonoxynol-9	eaf86a36-0573-4c39-9324-88919c4d009b	2013-12-19 00:00:00	\N	\N
2063	"Haemophilus influenzae type b, capsular polysaccharide inactivated tetanus toxoid conjugate vaccine (Injectable)"	529118	"Haemophilus influenzae type b, capsular polysaccharide inactivated tetanus toxoid conjugate vaccine"	8143d01c-4911-40db-95b2-47f3ebea2a7d	2015-08-07 00:00:00	\N	\N
2064	Halcinonide (Topical)	966468	Halcinonide	e60d0691-0628-4c98-9a17-f4a89822baf2	2014-01-08 00:00:00	\N	\N
2065	HALDOL (Injectable)	766529	Haloperidol	27cfe684-7d11-4f37-9c8b-b2bdd6b5348e	2015-06-16 00:00:00	\N	\N
2066	HALLS (Oral Lozenge)	901656	Menthol	5f4af8e8-8550-45c7-a199-694efac9e7be	2014-04-08 00:00:00	\N	\N
2067	Halobetasol (Topical)	949759	halobetasol	c420da92-a3e3-4760-8cad-e50cbacebfeb	2014-10-09 00:00:00	\N	\N
2068	HALOG (Topical)	966468	Halcinonide	e60d0691-0628-4c98-9a17-f4a89822baf2	2014-01-08 00:00:00	\N	\N
2069	Haloperidol (Injectable)	766529	Haloperidol	7b01bd62-d0fa-4229-9a09-f90893dd6dbd	2015-08-18 00:00:00	\N	\N
2070	Haloperidol (Oral Liquid)	766529	Haloperidol	2d848e8c-de42-4a09-96f1-a2d250af059d	2015-08-31 00:00:00	\N	\N
2071	Haloperidol (Oral Pill)	766529	Haloperidol	0027b8a3-73bf-4005-a7e3-b035f451a861	2015-07-06 00:00:00	\N	\N
2072	HALOTESTIN (Oral Pill)	1555887	Fluoxymesterone	09bafc2d-1893-4618-86dc-e9403407cd41	2006-08-21 00:00:00	\N	\N
2073	Hard maple pollen extract (Injectable)	40161785	hard maple pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
2074	Hard maple pollen extract/Red maple pollen extract/Silver maple pollen extract (Injectable)	40161785	hard maple pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2075	HARVONI (Oral Pill)	45775020	ledipasvir	1a1c555d-2fdf-4150-8ace-dbc770c226bf	2014-12-05 00:00:00	\N	\N
2076	Hazelnut pollen extract (Injectable)	40161789	hazelnut pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
2077	HEAD & SHOULDERS (Shampoo)	944360	zinc pyrithione	83f0f5e0-2883-4c68-a6bc-f22f6c9d9f80	2015-10-02 00:00:00	\N	\N
2078	HEALTHYLAX (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	9b14e26f-17cb-4890-bb47-9db79f352bd2	2015-10-02 00:00:00	\N	\N
2079	Heavy mineral oil (Oral Liquid)	998394	Heavy mineral oil	9f943fdf-5058-4e18-ba96-6be112bf72ca	2014-03-13 00:00:00	\N	\N
2080	HECORIA (Oral Pill)	950637	Tacrolimus	95b03516-34b0-4438-a05c-918d80f70091	2013-12-05 00:00:00	\N	\N
2081	HECTOROL (Oral Pill)	1512446	Doxercalciferol	dc676bc5-f3f7-4755-92e1-1814498c1f4f	2013-01-29 00:00:00	\N	\N
2082	Helium (Inhalant)	19067073	Helium	e1d2805c-1ede-4de5-b06e-f5cffc3ffd3c	2015-07-15 00:00:00	\N	\N
2083	Helium/Oxygen (Inhalant)	19067073	Helium	3d03af31-bb94-4dd5-bccd-9592cd0bc74c	2014-08-26 00:00:00	\N	\N
2084	HEMANGEOL (Oral Liquid)	1353766	Propranolol	b6f9dd2a-632b-87eb-70f0-b2064d7ed48a	2015-05-14 00:00:00	\N	\N
2085	HEMOBAN (Mucosal)	957393	aluminum chloride	7054c4ea-fee2-4627-aff2-e99ceb1080c7	2015-05-28 00:00:00	\N	\N
2086	HEMOCYTE (Oral Pill)	1595799	Ferrous fumarate	b8ea96eb-099a-41c0-b894-dd4fc9428863	2014-10-10 00:00:00	\N	\N
2087	HEMOCYTE-F (Oral Pill)	1595799	Ferrous fumarate	c484c59d-4178-4283-8e6c-e3a4567a78f1	2014-10-10 00:00:00	\N	\N
2088	HEMOFIL (Injectable)	1352213	Factor VIII	b8953ff7-3bba-4a0b-a486-f26fb81f05d9	2014-09-22 00:00:00	\N	\N
2089	"Heparin, porcine (Injectable)"	19055137	"heparin, porcine"	7014808d-cec9-4b2c-8eb5-940493e356ab	2015-08-13 00:00:00	\N	\N
2090	HEPSERA (Oral Pill)	1729323	adefovir	80595d45-2224-47d1-bd5c-4b11a824e5bd	2010-06-24 00:00:00	\N	\N
2091	HERCEPTIN (Injectable)	1387104	trastuzumab	492dbdb2-077e-4064-bff3-372d6af0a7a2	2015-05-07 00:00:00	\N	\N
2092	HESPAN (Injectable)	19077117	Hetastarch	6d1c2560-f289-49a9-9471-71199492fd8e	2014-02-11 00:00:00	\N	\N
2093	Hetastarch (Injectable)	19077117	Hetastarch	6d1c2560-f289-49a9-9471-71199492fd8e	2015-07-07 00:00:00	\N	\N
2094	HETLIOZ (Oral Pill)	44814600	tasimelteon	ca4a9b63-708e-49e9-8f9b-010625443b90	2014-12-19 00:00:00	\N	\N
2095	Hexachlorophene (Soap)	1768734	Hexachlorophene	41ee3eb5-c3b6-4b50-87c6-04a723ca4c35	2013-07-08 00:00:00	\N	\N
2096	HEXALEN (Oral Pill)	1368823	Altretamine	90a5e59a-bee8-404a-ad69-fabddeaf27f9	2007-01-11 00:00:00	\N	\N
2097	Hexylresorcinol (Oral Lozenge)	969004	Hexylresorcinol	e282ba65-b674-45d5-82c2-ab4e4a95243b	2011-11-14 00:00:00	\N	\N
2098	HIBERIX (Injectable)	529118	"Haemophilus influenzae type b, capsular polysaccharide inactivated tetanus toxoid conjugate vaccine"	745ff8df-1618-4b76-9aa1-6f42752c0dda	2015-08-07 00:00:00	\N	\N
2099	HIBICLENS (Soap)	1790812	Chlorhexidine	910c0491-ec27-4164-a7ab-d89e82a2bdb5	2013-10-28 00:00:00	\N	\N
2100	HIBISTAT (Topical)	1790812	Chlorhexidine	c6f941d6-527e-4fb8-9581-8532dd84e7a8	2011-07-01 00:00:00	\N	\N
2101	HIPREX (Oral Pill)	904356	Methenamine	7488ad5c-376d-47a2-8c23-47eff94547fb	2012-03-15 00:00:00	\N	\N
2102	Histamine (Injectable)	19069019	Histamine	1159c24c-d9ce-49a2-b0bd-dc27c710f146	2009-05-20 00:00:00	\N	\N
2103	Histamine (Topical)	19069019	Histamine	3801584a-6212-4ad0-8d6e-ef60e7edae14	2013-06-06 00:00:00	\N	\N
2104	Histamine/Menthol (Topical)	19069019	Histamine	d123deae-d9ef-45ce-81ed-2d79384b1298	2015-04-23 00:00:00	\N	\N
2105	HISTEX PE (Oral Liquid)	1135766	Phenylephrine	26c2117e-804e-4132-8707-fc0302fb9090	2014-03-19 00:00:00	\N	\N
2106	HISTEX SYRUP (Oral Liquid)	1105889	Triprolidine	cc466d33-cf3e-4f1c-a794-6d3d79903adf	2014-03-06 00:00:00	\N	\N
2107	Homatropine (Ophthalmic)	1101703	homatropine	7d64b0e4-10c3-44b6-ac95-ededde5fda71	2015-01-30 00:00:00	\N	\N
2108	Homatropine/HYDROcodone (Oral Liquid)	1101703	homatropine	0184de92-e728-4390-95f6-a463f583416a	2015-01-07 00:00:00	\N	\N
2109	Homatropine/HYDROcodone (Oral Pill)	1101703	homatropine	6c0bba34-07db-42f5-9e5e-ad79b71b4276	2014-10-29 00:00:00	\N	\N
2110	"House dust mite extract, Dermatophagoides farinae (Injectable)"	40161821	"house dust mite extract, Dermatophagoides farinae"	cbe1d24d-df77-4940-baf8-623993fa731b	2015-07-21 00:00:00	\N	\N
2111	"House dust mite extract, Dermatophagoides pteronyssinus (Injectable)"	40161835	"house dust mite extract, Dermatophagoides pteronyssinus"	cbe1d24d-df77-4940-baf8-623993fa731b	2015-07-20 00:00:00	\N	\N
2112	House fly extract (Injectable)	40175853	house fly extract	470d7a58-b8ee-4f97-a5e2-3e8c65096231	2009-12-18 00:00:00	\N	\N
2113	HumaLOG (Injectable)	1550023	Insulin Lispro	c5f75765-86b8-4926-b8c3-b42133ca7ac8	2012-09-28 00:00:00	\N	\N
2114	HUMAN ALBUMIN GRIFOLS (Injectable)	1344143	"Albumin Human, USP"	a43c5ed6-7423-4ee5-8acb-5fccc2d7b6cc	2014-03-25 00:00:00	\N	\N
2115	Human Secretin (Injectable)	19084212	Human Secretin	b4dfe70f-0a86-4488-9ba1-dcd8f86cbfcd	2007-08-15 00:00:00	\N	\N
2116	Humicola grisea extract (Injectable)	40228383	Humicola grisea extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
2117	HUMULIN R (Injectable)	1596977	"Regular Insulin, Human"	9ec3e28a-cea9-4e45-9057-e5bf8e37014c	2011-12-15 00:00:00	\N	\N
2118	HURRICAINE (Mucosal)	917006	Benzocaine	159d412c-6d1a-45d4-88c0-8c93960f946e	2015-08-20 00:00:00	\N	\N
2119	HURRICAINE (Oral Gel)	917006	Benzocaine	1f3d68f6-afd6-42e7-b3e5-210228c8e7de	2015-03-12 00:00:00	\N	\N
2120	Hyaluronate (Injectable)	787787	hyaluronate	f2b381d4-b181-4e88-a543-075917fc34ed	2015-06-02 00:00:00	\N	\N
2121	Hyaluronate/Urea (Topical)	787787	hyaluronate	ce953fdf-a73a-4f7e-8946-959346990626	2011-12-02 00:00:00	\N	\N
2122	Hyaluronidase (Injectable)	19073699	Hyaluronidase	21fbd12e-4a12-4ad1-ad01-964cd5ec9996	2015-01-20 00:00:00	\N	\N
2123	"Hyaluronidase, Human (Injectable)"	19088713	"Hyaluronidase, Human"	1e547159-daa7-4b5d-9ad5-5261ea866e13	2015-06-23 00:00:00	\N	\N
2124	HYBRISIL (Topical)	1506270	Methylprednisolone	f8432414-d8a6-4597-a226-61fd09a80e0c	2011-04-25 00:00:00	\N	\N
2125	HYCET (Oral Liquid)	1125315	Acetaminophen	00ff75bc-aebe-4c55-adea-1c49cf1addb3	2014-12-17 00:00:00	\N	\N
2126	HYCODAN (Oral Liquid)	1101703	homatropine	08bb4884-403b-4163-bee7-5aa40992ac4e	2006-08-21 00:00:00	\N	\N
2127	hydrALAZINE (Injectable)	1373928	Hydralazine	f34904dc-c945-4de4-8594-34e4f4ac1983	2015-09-30 00:00:00	\N	\N
2128	hydrALAZINE (Oral Pill)	1373928	Hydralazine	b96e789d-0f29-42fe-818f-3ff2f579e5fd	2015-05-14 00:00:00	\N	\N
2129	HydrALAZINE/Hydrochlorothiazide/Reserpine (Oral Pill)	1373928	Hydralazine	bdd0658e-38fb-4726-9720-09c502138ab0	2006-08-21 00:00:00	\N	\N
2130	HydrALAZINE/Isosorbide Dinitrate (Oral Pill)	1373928	Hydralazine	e1e63cd5-d1e4-4af5-bad5-1ad41ea46b00	2015-08-21 00:00:00	\N	\N
2131	HYDREA (Oral Pill)	1377141	hydroxyurea	050bd2a2-a125-721a-e366-255c5466f018	2015-08-11 00:00:00	\N	\N
2132	HYDRO (Topical)	906914	Urea	c1fc0ed7-6383-455a-98c3-ef44b312fc0d	2010-07-20 00:00:00	\N	\N
2133	Hydrochlorothiazide (Oral Pill)	974166	Hydrochlorothiazide	f82b7d4f-8cf2-4502-b066-d2d7c3a7a6fe	2015-10-01 00:00:00	\N	\N
2134	Hydrochlorothiazide/Irbesartan (Oral Pill)	974166	Hydrochlorothiazide	72fa8cd4-bc2a-4a7d-8feb-2d60e077d801	2015-09-24 00:00:00	\N	\N
2135	Hydrochlorothiazide/Lisinopril (Oral Pill)	974166	Hydrochlorothiazide	00f67e1a-6999-4295-9c9f-fcb1ce9711b8	2015-10-06 00:00:00	\N	\N
2136	Hydrochlorothiazide/Losartan (Oral Pill)	974166	Hydrochlorothiazide	90b479ce-1a28-4b14-b33a-7ba374305079	2015-10-01 00:00:00	\N	\N
2137	Hydrochlorothiazide/Methyldopa (Oral Pill)	974166	Hydrochlorothiazide	5bf74178-66b8-44d4-a87d-1fd760b94ad3	2014-06-19 00:00:00	\N	\N
2138	Hydrochlorothiazide/Metoprolol (Oral Pill)	974166	Hydrochlorothiazide	faaf13ce-5d8d-4c57-a49f-a7a73daa41a5	2015-05-08 00:00:00	\N	\N
2139	Hydrochlorothiazide/Moexipril (Oral Pill)	974166	Hydrochlorothiazide	621614de-4a5c-43c8-af77-e98128f01c8b	2013-10-18 00:00:00	\N	\N
2140	Hydrochlorothiazide/Olmesartan (Oral Pill)	974166	Hydrochlorothiazide	91d45442-4232-4111-9dd8-0d787085af6d	2014-12-29 00:00:00	\N	\N
2141	Hydrochlorothiazide/Quinapril (Oral Pill)	974166	Hydrochlorothiazide	ae34a8e0-5f82-4aa8-d71c-b7a3f720925c	2015-04-07 00:00:00	\N	\N
2142	Hydrochlorothiazide/Spironolactone (Oral Pill)	974166	Hydrochlorothiazide	66134130-5718-483b-a076-36ecdb0add34	2015-09-30 00:00:00	\N	\N
2143	Hydrochlorothiazide/Telmisartan (Oral Pill)	974166	Hydrochlorothiazide	b88054b3-fafa-4b4e-acf5-5294e5555720	2015-09-23 00:00:00	\N	\N
2144	Hydrochlorothiazide/Triamterene (Oral Pill)	974166	Hydrochlorothiazide	5171e219-38cb-4f4d-b33b-abbd713bf642	2015-10-01 00:00:00	\N	\N
2145	Hydrochlorothiazide/Valsartan (Oral Pill)	974166	Hydrochlorothiazide	6b6ad6c8-22f8-456b-bc54-a02fb6cbea8c	2015-09-30 00:00:00	\N	\N
2146	HYDROcodone/Ibuprofen (Oral Pill)	1174888	Hydrocodone	d86ced85-6767-4218-bf88-e294b44d1e74	2015-03-27 00:00:00	\N	\N
2147	HYDROcodone/Pseudoephedrine (Oral Liquid)	1174888	Hydrocodone	d8344453-c7c0-4e4b-aab7-8447ef28322a	2014-12-31 00:00:00	\N	\N
2148	Hydrocortisone (Injectable)	975125	Hydrocortisone	b2b4c961-363d-49fe-b354-d59b39fd517a	2012-05-17 00:00:00	\N	\N
2149	Hydrocortisone (Oral Pill)	975125	Hydrocortisone	d4d2912e-d1e8-4b40-af88-59c87fa12318	2015-10-01 00:00:00	\N	\N
2150	Hydrocortisone (Rectal)	975125	Hydrocortisone	a5b47406-b933-4f6b-96dc-db837bcccf77	2015-08-13 00:00:00	\N	\N
2151	Hydrocortisone (Topical)	975125	Hydrocortisone	94a776de-aa08-4274-ab07-48de6e934791	2015-10-13 00:00:00	\N	\N
2152	Hydrocortisone/Iodoquinol (Topical)	975125	Hydrocortisone	3d7278ee-2c8e-4df1-9372-d43403122945	2015-06-05 00:00:00	\N	\N
2153	Hydrocortisone/Lidocaine (Rectal)	975125	Hydrocortisone	0db13203-e001-42fc-b3a2-7f189d171de3	2015-01-26 00:00:00	\N	\N
2154	Hydrocortisone/Neomycin/Polymyxin B (Ophthalmic)	975125	Hydrocortisone	64e4cb91-f5bd-4a2f-b92d-0a1341f40d35	2010-06-14 00:00:00	\N	\N
2155	Hydrocortisone/Neomycin/Polymyxin B (Otic)	975125	Hydrocortisone	f1995e7d-81c0-42c0-89fe-50634b6e2274	2015-08-17 00:00:00	\N	\N
2156	Hydrocortisone/Neomycin/Polymyxin B (Topical)	975125	Hydrocortisone	e492b2b0-ad73-4866-c996-a1fcb12dbcad	2015-04-21 00:00:00	\N	\N
2157	Hydrocortisone/Pramoxine (Rectal)	975125	Hydrocortisone	fecf8380-3bb5-11e5-98c5-0002a5d5c51b	2015-08-12 00:00:00	\N	\N
2158	Hydrocortisone/Pramoxine (Topical)	975125	Hydrocortisone	26beacc7-75b2-4592-a643-3b50ed860f23	2015-08-07 00:00:00	\N	\N
2159	Hydroflumethiazide (Oral Pill)	1376289	Hydroflumethiazide	6153ef9e-77f0-4233-a5bc-3e3d1f732323	2006-10-13 00:00:00	\N	\N
2160	Hydrofluoric Acid/Phosphoric acid/Sodium Fluoride (Oral Gel)	976309	Hydrofluoric Acid	11d08dc0-fa26-4506-830c-d809f50c5411	2012-12-13 00:00:00	\N	\N
2161	Hydrofluoric Acid/Sodium Fluoride (Oral Foam)	976309	Hydrofluoric Acid	8f73af62-6124-4bf6-915d-4b913add7ad1	2011-02-11 00:00:00	\N	\N
2162	Hydrogen Peroxide (Mouthwash)	1776430	Hydrogen Peroxide	b1325ab5-6667-4f22-a625-8e91fe543c11	2015-03-24 00:00:00	\N	\N
2163	Hydrogen Peroxide (Mucosal)	1776430	Hydrogen Peroxide	f82230e0-a6eb-4d1e-8fea-0bf386d97c58	2010-10-09 00:00:00	\N	\N
2164	Hydrogen Peroxide (Topical)	1776430	Hydrogen Peroxide	97fae8f6-bf62-4b4f-8d5c-5a3f6f7bd784	2015-09-30 00:00:00	\N	\N
2165	HYDROMET (Oral Liquid)	1101703	homatropine	a324c912-a3ef-4296-b9a8-b0fec687eb06	2014-10-03 00:00:00	\N	\N
2166	HYDROmorphone (Injectable)	1126658	Hydromorphone	7122ccea-f35c-4816-b90a-6f12fdc808dd	2015-09-10 00:00:00	\N	\N
2167	HYDROmorphone (Oral Liquid)	1126658	Hydromorphone	cc574063-6ede-4da7-82c4-7450c92b229b	2013-07-29 00:00:00	\N	\N
2168	HYDROmorphone (Oral Pill)	1126658	Hydromorphone	d42f2e61-f65a-42f2-bec5-2d248d788e78	2014-09-12 00:00:00	\N	\N
2169	HYDROmorphone (Rectal)	1126658	Hydromorphone	1bfbba46-1979-4797-a29e-d67718131686	2012-09-19 00:00:00	\N	\N
2170	Hydroquinone (Topical)	976778	hydroquinone	50c30793-472a-4196-ba41-5074686f7edc	2015-09-15 00:00:00	\N	\N
2171	HYDROSKIN (Topical)	975125	Hydrocortisone	5d96dccc-5117-4a47-b0af-f2a2c09a0c8f	2015-09-17 00:00:00	\N	\N
2172	Hydroxocobalamin (Injectable)	1377023	Hydroxocobalamin	d35ad609-70d3-4eb2-8276-c9631ca815d1	2014-01-02 00:00:00	\N	\N
2173	Hydroxychloroquine (Oral Pill)	1777087	Hydroxychloroquine	1959d645-6b82-4f4d-b1f2-af644dec7c8f	2015-09-24 00:00:00	\N	\N
2174	Hydroxyethyl starch 130-0.4 (Injectable)	43012293	hydroxyethyl starch 130-0.4	be7729c9-f7cf-483b-bafe-0d42d6b62f06	2015-08-10 00:00:00	\N	\N
2175	Hydroxypropylcellulose (Implant)	19002257	hydroxypropylcellulose	cc7a6a52-0b77-4df7-8403-dd21c1334f6c	2015-09-23 00:00:00	\N	\N
2176	Hydroxyurea (Oral Pill)	1377141	hydroxyurea	b9514ae5-79ae-4cc2-9d7f-c8f7806d1694	2015-08-27 00:00:00	\N	\N
2177	hydrOXYzine (Injectable)	777221	Hydroxyzine	7def1daa-c800-4263-9526-eac8d53e4636	2015-09-25 00:00:00	\N	\N
2178	hydrOXYzine (Oral Liquid)	777221	Hydroxyzine	85e3c789-a740-4a09-a810-9808c3d0f7d9	2015-08-20 00:00:00	\N	\N
2179	hydrOXYzine (Oral Pill)	777221	Hydroxyzine	e0f40d4e-4167-4641-a8a4-599bc1877077	2015-09-28 00:00:00	\N	\N
2180	HYLENEX (Injectable)	19088713	"Hyaluronidase, Human"	3023cc56-ed4b-4e87-b3a1-81b20943f658	2015-06-23 00:00:00	\N	\N
2181	HYOPHEN (Oral Pill)	711452	Benzoate	2c1f0f4c-e57b-4df5-9a58-41d39c3d8893	2010-10-25 00:00:00	\N	\N
2182	Hyoscyamine (Injectable)	923672	Hyoscyamine	dd2e786c-29a7-40f8-a5f3-7641413f5036	2010-07-20 00:00:00	\N	\N
2183	Hyoscyamine (Oral Disintegrating)	923672	Hyoscyamine	e5fd8476-418a-4149-a688-205ea943b30c	2013-05-15 00:00:00	\N	\N
2184	Hyoscyamine (Oral Liquid)	923672	Hyoscyamine	6f31e729-e36b-4b6e-98de-88077b29bf2b	2014-12-09 00:00:00	\N	\N
2185	Hyoscyamine (Oral Pill)	923672	Hyoscyamine	480d688d-2103-443c-90cc-feb861bdce13	2015-09-15 00:00:00	\N	\N
2186	Hyoscyamine (Sublingual)	923672	Hyoscyamine	c9623ab9-ead1-4ae5-94d8-e18384b1e30c	2015-09-15 00:00:00	\N	\N
2187	"Hyoscyamine/Methenamine/Methylene blue/Phenyl salicylate/Sodium Phosphate, Monobasic (Oral Pill)"	923672	Hyoscyamine	263ed7eb-a390-4a26-9985-16ac883f4bfc	2015-07-13 00:00:00	\N	\N
2188	"Hyoscyamine/Methenamine/Methylene blue/Sodium Phosphate, Monobasic (Oral Pill)"	923672	Hyoscyamine	f650dd78-615c-42d3-9b2d-3a989039d80c	2015-07-27 00:00:00	\N	\N
2189	Hypochlorite (Topical)	44784806	Hypochlorite	3d72b72c-2949-4eb6-b64c-6c4aef0eddd9	2010-10-09 00:00:00	\N	\N
2190	Hypomyces perniciosus extract (Injectable)	40244381	Hypomyces perniciosus extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
2191	Hypromellose (Ophthalmic)	902251	hypromellose	785199ea-3bd6-48ea-afd0-e0c4cf39652b	2014-09-23 00:00:00	\N	\N
2192	Hypromellose/Naphazoline/Polysorbate 80/Zinc Sulfate (Ophthalmic)	902251	hypromellose	9a1ce5e2-c3da-424d-b754-cf2de8c655e3	2010-10-09 00:00:00	\N	\N
2193	HYZAAR (Oral Pill)	974166	Hydrochlorothiazide	d7d7dcc9-c3e0-45e5-abcd-135a6d8c8dab	2014-06-04 00:00:00	\N	\N
2194	I (Oral Pill)	715997	donepezil	d9d15879-3883-4963-9c93-73d5251484fa	2011-08-29 00:00:00	\N	\N
2195	Ibandronate (Oral Pill)	1512480	Ibandronate	bcac6719-ad8c-e4a5-c32a-af1c0511c591	2015-08-26 00:00:00	\N	\N
2196	Ibrutinib (Oral Pill)	44507848	Ibrutinib	0dfd0279-ff17-4ea9-89be-9803c71bab44	2015-02-17 00:00:00	\N	\N
2197	IBU (Oral Pill)	1177480	Ibuprofen	181e3925-4a81-4012-b2b6-6b247e2eb663	2015-02-20 00:00:00	\N	\N
2198	Ibuprofen (Chewable)	1177480	Ibuprofen	ce54a65b-2913-450f-b7af-b23c54fbb742	2015-10-02 00:00:00	\N	\N
2199	Ibuprofen (Injectable)	1177480	Ibuprofen	1eaa7790-f1a1-4f51-b10a-cbbaf033f684	2014-03-28 00:00:00	\N	\N
2200	Ibuprofen (Oral Liquid)	1177480	Ibuprofen	17bd342d-8eb3-4663-88f5-2e7c90254dc7	2015-10-01 00:00:00	\N	\N
2201	Ibuprofen (Oral Pill)	1177480	Ibuprofen	5715910e-33be-49bd-8a1f-eeb46320e28d	2015-10-13 00:00:00	\N	\N
2202	Ibuprofen/oxyCODONE (Oral Pill)	1177480	Ibuprofen	a95425ac-6ab7-45e4-820d-bddffde30a0f	2013-06-03 00:00:00	\N	\N
2203	Ibuprofen/Phenylephrine (Oral Pill)	1177480	Ibuprofen	525cc513-9945-43fe-af1b-e168d562a1db	2015-07-01 00:00:00	\N	\N
2204	Ibuprofen/Pseudoephedrine (Oral Liquid)	1177480	Ibuprofen	b6c844c4-4ba6-4827-8db8-5f3f5e99b0c2	2011-10-20 00:00:00	\N	\N
2205	Ibuprofen/Pseudoephedrine (Oral Pill)	1177480	Ibuprofen	faa26964-a140-4d30-ab1e-19f49f9458ac	2013-06-06 00:00:00	\N	\N
2206	Ibutilide (Injectable)	19050087	ibutilide	c25d21e7-6136-4a7a-b139-12f53116fc3d	2015-07-31 00:00:00	\N	\N
2207	Ichthammol (Topical)	977949	ichthammol	9698b98c-bca1-4a7e-8a67-05d2a2b770a5	2015-07-28 00:00:00	\N	\N
2208	ICLUSIG (Oral Pill)	43013182	ponatinib	807f988e-117b-4497-934d-73aa78baac71	2014-10-08 00:00:00	\N	\N
2209	ICY HOT (Topical)	901656	Menthol	4ce2b823-7ef5-4cca-a2d8-2fe781bc958e	2012-12-20 00:00:00	\N	\N
2210	ICY HOT (Transdermal)	901656	Menthol	d4e13689-8973-4041-9f33-e710547dcdee	2015-04-03 00:00:00	\N	\N
2211	ICY HOT WITH METHYL SALICYLATE (Topical)	901656	Menthol	40c8c02f-fa5f-4e80-81a0-48271fa6f94b	2011-04-20 00:00:00	\N	\N
2212	IDAMYCIN (Injectable)	19078097	Idarubicin	0a5a6d93-cc1e-4d7f-8da1-446c134503b3	2015-01-07 00:00:00	\N	\N
2213	IDArubicin (Injectable)	19078097	Idarubicin	615d206a-b178-4ff4-b6c1-7e349099f3c7	2015-10-13 00:00:00	\N	\N
2214	Idelalisib (Oral Pill)	45776944	idelalisib	efbdafa9-d18c-4e85-b4a2-1e620fc74e50	2015-09-11 00:00:00	\N	\N
2215	IFEREX (Oral Pill)	1300751	Polysaccharide iron complex	968c74e0-0510-4a0e-add2-37af97fc6928	2010-10-09 00:00:00	\N	\N
2216	IFEX (Injectable)	19078187	Ifosfamide	b7241707-7538-4d1a-91e7-3a25a91e0b9a	2015-02-18 00:00:00	\N	\N
2217	Ifosfamide (Injectable)	19078187	Ifosfamide	f6fef680-884f-46fc-bf81-0ef7c5db6f32	2015-04-29 00:00:00	\N	\N
2218	Iloperidone (Oral Pill)	19017241	iloperidone	43452bf8-76e7-47a9-a5d8-41fe84d061f0	2014-04-29 00:00:00	\N	\N
2219	ILOTYCIN (Ophthalmic)	1746940	Erythromycin	9b1c6c13-4562-4c8e-a8bb-42493dc5cadb	2010-10-15 00:00:00	\N	\N
2220	ILUVIEN (Implant)	996541	fluocinolone	4400e471-7402-11df-93f2-0800200c9a66	2014-12-08 00:00:00	\N	\N
2221	IMBRUVICA (Oral Pill)	44507848	Ibrutinib	0dfd0279-ff17-4ea9-89be-9803c71bab44	2015-02-17 00:00:00	\N	\N
2222	Imiglucerase (Injectable)	1348407	imiglucerase	df60f030-866b-4374-a31f-8ae3f6b45c38	2012-12-17 00:00:00	\N	\N
2223	Imipramine (Oral Pill)	778268	Imipramine	3361779c-095c-45dc-8a85-7626652ff75f	2015-06-05 00:00:00	\N	\N
2224	Imiquimod (Topical)	981691	imiquimod	0c3aed27-7b3f-442e-9f60-f2f5c672c85d	2015-04-15 00:00:00	\N	\N
2225	IMITREX (Oral Pill)	1140643	Sumatriptan	040abcc1-cc1c-4f00-b302-36070611f7b2	2012-10-04 00:00:00	\N	\N
2226	Immunoglobulin G (Injectable)	19117912	Immunoglobulin G	88eac3b8-55a5-4451-9d25-c30e43ab7068	2015-03-04 00:00:00	\N	\N
2227	IMODIUM (Oral Liquid)	991876	Loperamide	76a976d5-8bee-4158-a94d-7fbfc5544fd4	2011-01-28 00:00:00	\N	\N
2228	IMODIUM (Oral Pill)	991876	Loperamide	01da76d0-1979-4c45-9d39-c72ae4e4ffe2	2015-07-13 00:00:00	\N	\N
2229	IMOVAX (Injectable)	544505	"rabies virus vaccine wistar strain PM-1503-3M (Human), Inactivated"	ba8d4e72-f452-4859-ae6f-3644b4b0a78c	2013-09-30 00:00:00	\N	\N
2230	IMPAVIDO (Oral Pill)	44816310	miltefosine	d6658aeb-7bc1-4eef-ad0d-0a873ddbecf5	2014-09-19 00:00:00	\N	\N
2231	INAPSINE (Injectable)	739323	Droperidol	dbc2d9eb-eefe-454d-a8c3-55cec840d54f	2011-12-22 00:00:00	\N	\N
2232	Indapamide (Oral Pill)	978555	Indapamide	a8a4ec2c-9d4b-482b-ad29-88185c96db74	2014-07-07 00:00:00	\N	\N
2233	Indian wormwood sage pollen extract (Injectable)	40224992	Indian wormwood sage pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
2234	Indinavir (Oral Pill)	1711523	Indinavir	01c5574c-1056-49c6-af20-e950db3f4139	2012-06-18 00:00:00	\N	\N
2235	Indomethacin (Injectable)	1178663	Indomethacin	30e38747-c553-4e2d-bc23-634e1dd90b8d	2014-07-03 00:00:00	\N	\N
2236	Indomethacin (Oral Pill)	1178663	Indomethacin	3d5df05a-f4af-48d8-b880-97dfb92e900c	2015-08-07 00:00:00	\N	\N
2237	Indomethacin (Rectal)	1178663	Indomethacin	a8ed14ef-cd4b-3be7-0b5f-b677c72d2e88	2011-09-21 00:00:00	\N	\N
2238	Indomethacin XR (Oral Pill)	1178663	Indomethacin	85014b51-1354-4d16-9995-3ee33a7155fa	2015-08-06 00:00:00	\N	\N
2239	Inert Ingredients (Oral Pill)	19127890	Inert Ingredients	39988aa6-8f68-40e8-9bdd-c40a3bdaad61	2015-09-25 00:00:00	\N	\N
2240	INFASURF (Inhalant)	19089891	calfactant	315c128a-272d-4c57-bfbe-1a8b3402af08	2011-07-22 00:00:00	\N	\N
2241	INFED (Injectable)	1381661	Iron-Dextran Complex	abacb7fa-2fc2-471e-9200-944eeac8ca2a	2014-07-14 00:00:00	\N	\N
2242	INFERGEN (Injectable)	1781314	interferon alfacon-1	a7248eca-45d6-472d-8c2a-d8887c2594d5	2008-04-18 00:00:00	\N	\N
2243	Influenza A-California-7-2009-(H1N1)v-like virus vaccine (Injectable)	40166605	influenza A-California-7-2009-(H1N1)v-like virus vaccine	fc5cfd1c-1ff5-4cfa-b544-db8d7f26d46f	2009-12-04 00:00:00	\N	\N
2244	INFUMORPH (Injectable)	1110410	Morphine	db9ac9e3-d761-4a99-9f34-4946ebe8f255	2012-06-05 00:00:00	\N	\N
2245	INJECTAFER (Injectable)	43560392	ferric carboxymaltose	517b4a19-45b3-4286-9f6a-ced4e10447de	2013-08-12 00:00:00	\N	\N
2246	INLYTA (Oral Pill)	42709322	axitinib	84137882-e000-47da-bd5b-fa76ab3c76f9	2014-08-27 00:00:00	\N	\N
2247	INNOFEM (Oral Pill)	1548195	Estradiol	10e1d3ef-808e-47e4-a050-93a5918b1085	2008-01-31 00:00:00	\N	\N
2248	INNOHEP (Injectable)	1308473	tinzaparin	1513b960-d9d1-11de-8a1e-0002a5d5c51b	2010-10-21 00:00:00	\N	\N
2249	INSPRA (Oral Pill)	1309799	eplerenone	c7bc9486-8e61-4ba1-827f-2cd8c304b454	2011-01-04 00:00:00	\N	\N
2250	INSTA-CHAR (Oral Liquid)	1701928	Activated Charcoal	6285e38c-40bf-415d-bf68-68b38e318ab5	2010-10-09 00:00:00	\N	\N
2251	"Insulin analog, Detemir (Injectable)"	1516976	insulin detemir	2b8d9730-686b-444b-9941-7b5877255924	2011-09-30 00:00:00	\N	\N
2252	"Insulin analog, Glargine (Injectable)"	1502905	Insulin Glargine	13cfe263-6a6a-4b0f-94f4-771ab6a105c0	2013-11-26 00:00:00	\N	\N
2253	"Insulin, human isophane (Injectable)"	1596914	"NPH Insulin, Human"	99c995f1-522e-42aa-b45a-117e0af77d81	2014-09-29 00:00:00	\N	\N
2254	"Insulin, human mixed (Injectable)"	1596914	"NPH Insulin, Human"	0cc57309-01ef-4a02-8d27-b981c768135a	2014-09-29 00:00:00	\N	\N
2255	"Insulin, human regular (Injectable)"	1596977	"Regular Insulin, Human"	9ec3e28a-cea9-4e45-9057-e5bf8e37014c	2014-10-31 00:00:00	\N	\N
2256	"Insulin, human, rDNA origin (Inhalant)"	1588986	"insulin human, rDNA origin"	4e25a881-dfc3-44a2-9ede-49f7443776d8	2008-04-18 00:00:00	\N	\N
2257	INTELENCE (Oral Pill)	1758536	etravirine	1b5a2dc7-0570-4977-876d-88b4176844a1	2013-03-19 00:00:00	\N	\N
2258	Interferon Alfa-2b (Injectable)	1380068	Interferon Alfa-2b	30789790-8317-49f9-b97b-8c5ba17b53d2	2015-06-03 00:00:00	\N	\N
2259	Interferon alfacon-1 (Injectable)	1781314	interferon alfacon-1	a7248eca-45d6-472d-8c2a-d8887c2594d5	2008-04-18 00:00:00	\N	\N
2260	Interferon beta-1a (Injectable)	722424	Interferon beta-1a	0de49d64-3e18-494c-bf14-bc152247c798	2012-10-09 00:00:00	\N	\N
2261	Interferon beta-1b (Injectable)	713196	interferon beta-1b	261fde67-efb2-4bd7-947e-4f68a56e76ff	2013-04-26 00:00:00	\N	\N
2262	Interferon gamma-1b (Injectable)	1380191	Interferon gamma-1b	498b2231-65e8-4b27-947b-8d1f6f91289c	2015-09-09 00:00:00	\N	\N
2263	INTERMEZZO (Sublingual)	744740	zolpidem	913b6cfe-1fb0-44a8-817a-26374bbce995	2015-10-02 00:00:00	\N	\N
2264	INTRALIPID (Injectable)	19013789	EGG YOLK PHOSPHOLIPIDS	55609586-f0b4-42e6-8dd9-cd090afb5dca	2015-07-28 00:00:00	\N	\N
2265	INTRON A (Injectable)	1380068	Interferon Alfa-2b	30789790-8317-49f9-b97b-8c5ba17b53d2	2015-06-03 00:00:00	\N	\N
2266	INVIRASE (Oral Pill)	1746244	Saquinavir	b8b53129-06ab-4143-b9b7-7675e49a52ef	2010-09-22 00:00:00	\N	\N
2267	INVOKAMET (Oral Pill)	43526465	canagliflozin	6868666b-c25e-40d1-9d1f-306bbe9390c1	2015-09-17 00:00:00	\N	\N
2268	INZO (Topical)	907879	Miconazole	3afb78ad-af6e-47f6-b142-6cce45bd5e9e	2012-04-12 00:00:00	\N	\N
2269	Iodine (Topical)	1780601	Iodine	615e3547-4e5e-44fc-8f89-712243d30a1e	2015-09-29 00:00:00	\N	\N
2270	Iodine povacrylex/Isopropyl Alcohol (Topical)	19125582	iodine povacrylex	d35a9f96-a0db-4060-9f9d-ba2117288fd0	2015-09-14 00:00:00	\N	\N
2271	Iodine/Potassium Iodide (Oral Liquid)	1780601	Iodine	cf5b0102-4f76-4f9e-907a-bf9425890aea	2014-11-14 00:00:00	\N	\N
2272	Iodine/Potassium Iodide (Topical)	1780601	Iodine	7d8f4f37-948c-4740-8e23-2f23e47ebd5b	2014-11-25 00:00:00	\N	\N
2273	IOPIDINE (Ophthalmic)	919986	apraclonidine	de798d0d-a93c-40fb-95ea-10a4e6b287b7	2011-07-12 00:00:00	\N	\N
2274	IOSAT (Oral Pill)	19049909	Potassium Iodide	ea98aef8-93b6-4fac-be35-eb17a1a04a92	2014-04-03 00:00:00	\N	\N
2275	Ipratropium (Inhalant)	1112921	Ipratropium	769febba-671d-476b-b0c8-71489a2f9d20	2014-10-08 00:00:00	\N	\N
2276	IQUIX (Ophthalmic)	1742253	Levofloxacin	067ea8ec-99a3-4a0b-9116-4ffd6160b24b	2010-04-29 00:00:00	\N	\N
2277	Irbesartan (Oral Pill)	1347384	irbesartan	bba6b8f0-daf5-4b0b-bd07-4f59aa679077	2015-05-05 00:00:00	\N	\N
2278	IRESSA (Oral Pill)	1319193	gefitinib	827d60e8-7e07-41b7-c28b-49ef1c4a5a41	2015-07-17 00:00:00	\N	\N
2279	Irinotecan (Injectable)	1367268	irinotecan	407e0758-9e2e-4e45-8c1b-10cfd2115b1f	2015-08-24 00:00:00	\N	\N
2280	Iron Carbonyl (Chewable)	1400498	Iron Carbonyl	5c8d104d-feb4-4a1b-aa1c-b2ebbcbc5ccc	2010-07-20 00:00:00	\N	\N
2281	Iron Carbonyl (Oral Liquid)	1400498	Iron Carbonyl	a7cd1b35-93d6-eb31-3924-eda5c7c0b335	2014-10-06 00:00:00	\N	\N
2282	Iron-Dextran Complex (Injectable)	1381661	Iron-Dextran Complex	77f5ae2a-8cd3-4f01-bddd-8158f932c8db	2014-07-14 00:00:00	\N	\N
2283	ISENTRESS (Oral Pill)	1712889	raltegravir	e463b253-ad05-4e5c-8a3b-595d55c56ed7	2013-04-11 00:00:00	\N	\N
2284	ISMO (Oral Pill)	1383815	Isosorbide	ec09ab1c-52fa-4f41-bf65-a632dce8f097	2007-04-26 00:00:00	\N	\N
2285	ISMOTIC PB (Oral Liquid)	1383815	Isosorbide	f305b18b-8506-4414-87a1-10aa3b76a691	2008-03-13 00:00:00	\N	\N
2286	ISOCAINE (Injectable)	702774	Mepivacaine	53eda85c-65cd-4d6c-b4b7-eb3ae2942ed0	2007-04-26 00:00:00	\N	\N
2287	ISOCAINE WITH LEVONORDEFRIN (Injectable)	19015395	Levonordefrin	53eda85c-65cd-4d6c-b4b7-eb3ae2942ed0	2007-04-26 00:00:00	\N	\N
2288	Isocarboxazid (Oral Pill)	781705	Isocarboxazid	ac387aa0-3f04-4865-a913-db6ed6f4fdc5	2012-03-15 00:00:00	\N	\N
2289	Isoflurane (Inhalant)	782043	Isoflurane	d6851c71-0c2f-43f6-883c-a43fe894985d	2015-10-01 00:00:00	\N	\N
2290	ISONARIF (Oral Pill)	1782521	isoniazid	1d3f27ec-1616-40fd-bc4f-91bb1744ceb0	2012-04-30 00:00:00	\N	\N
2291	Isoniazid (Oral Liquid)	1782521	isoniazid	0044ca87-ab7e-4955-a77f-e8fd665ce2ae	2015-06-25 00:00:00	\N	\N
2292	Isoniazid (Oral Pill)	1782521	isoniazid	60a6b514-fa7f-4bc7-85b0-e5a14fa56b59	2015-06-29 00:00:00	\N	\N
2293	Isoniazid/Pyrazinamide/Rifampin (Oral Pill)	1782521	isoniazid	429a2f62-9fe6-4299-b314-92a9d22b1381	2013-04-24 00:00:00	\N	\N
2294	Isoniazid/Rifampin (Oral Pill)	1782521	isoniazid	3cc36609-8e2d-4caa-a8e0-c0367e3e52df	2014-02-14 00:00:00	\N	\N
2295	Isopropyl Alcohol (Otic)	19028106	Isopropyl Alcohol	cb566013-3fc4-4636-b214-3de64ce73b91	2015-01-20 00:00:00	\N	\N
2296	Isopropyl Alcohol (Topical)	19028106	Isopropyl Alcohol	bc1cd6bf-99b6-48d5-ad59-f56bd3026d47	2015-09-25 00:00:00	\N	\N
2297	Isopropyl Alcohol/Povidone-Iodine (Topical)	19028106	Isopropyl Alcohol	76615174-e530-4e88-a02c-2f7d0b5a5b04	2012-05-18 00:00:00	\N	\N
2298	Isopropyl unoprostone (Ophthalmic)	915829	isopropyl unoprostone	53d05ced-51dd-11de-8a39-0800200c9a66	2013-01-10 00:00:00	\N	\N
2299	ISOPTIN XR (Oral Pill)	1307863	Verapamil	6ae13cb4-0316-40d1-9216-c7d5556aaed3	2008-05-22 00:00:00	\N	\N
2300	ISOPTO ALKALINE (Ophthalmic)	902251	hypromellose	f1753a5b-7ba8-103d-6fe4-d93a3fc5f803	2014-09-23 00:00:00	\N	\N
2301	ISOPTO CETAMIDE (Ophthalmic)	1036252	Sulfacetamide	5a5d8fee-b42a-4f0c-a508-75c7c71bedb4	2008-03-13 00:00:00	\N	\N
2302	ISOPTOCARPINE (Ophthalmic)	945286	Pilocarpine	22e4c7f4-bbd0-4e74-85da-bb56fc377568	2012-08-24 00:00:00	\N	\N
2303	ISORDIL (Oral Pill)	1383925	Isosorbide Dinitrate	0e5bc1a3-6e3c-4ab9-856f-fd953eacf867	2015-08-20 00:00:00	\N	\N
2304	Isosorbide (Oral Liquid)	1383815	Isosorbide	f305b18b-8506-4414-87a1-10aa3b76a691	2008-03-13 00:00:00	\N	\N
2305	Isosorbide (Oral Pill)	1383815	Isosorbide	b35a72bb-c06b-4671-8dc2-ce0ccdf45ce9	2015-04-08 00:00:00	\N	\N
2306	Isosorbide Dinitrate (Oral Pill)	1383925	Isosorbide Dinitrate	873add22-4b78-459c-8418-b5392072a2a9	2015-09-15 00:00:00	\N	\N
2307	Isosorbide Dinitrate (Sublingual)	1383925	Isosorbide Dinitrate	8020edd0-b9e6-428c-a534-fb8f780fbdf1	2012-06-26 00:00:00	\N	\N
2308	Isosorbide Dinitrate XR (Oral Pill)	1383925	Isosorbide Dinitrate	bf6d4c62-14a4-423b-bdbf-676375f5cb8d	2014-11-10 00:00:00	\N	\N
2309	ISOtretinoin (Oral Pill)	984232	Isotretinoin	ee862463-77c0-4694-bba8-97274f13963f	2015-09-11 00:00:00	\N	\N
2310	Isoxsuprine (Oral Pill)	1384360	Isoxsuprine	6baec489-724b-4184-9529-7b9ca3573025	2012-12-06 00:00:00	\N	\N
2311	Isradipine (Oral Pill)	1326012	Isradipine	ac51d3e3-ed76-e033-e1d6-1ffbd14d94c2	2015-07-23 00:00:00	\N	\N
2312	ISTALOL (Ophthalmic)	902427	Timolol	80fa20dc-b181-48be-83ce-d66a83753878	2012-03-12 00:00:00	\N	\N
2313	ISTODAX (Injectable)	40168385	romidepsin	6005c345-ccf9-4fff-8660-3fd73485b0d9	2010-01-04 00:00:00	\N	\N
2314	ITCH-X (Topical)	919681	Benzyl Alcohol	03f85dbb-a13a-3126-e054-00144ff8d46c	2014-09-26 00:00:00	\N	\N
2315	Itraconazole (Oral Pill)	1703653	Itraconazole	6242b7ad-eaa0-a524-b6e0-ec33e63407db	2015-07-17 00:00:00	\N	\N
2316	Ivermectin (Topical)	1784444	Ivermectin	4c5557cd-c4cf-11df-851a-0800200c9a66	2012-07-09 00:00:00	\N	\N
2317	IVY BLOCK (Topical)	915518	bentoquatam	d3b3f56d-d1d5-4435-8ac7-a2118f108a9b	2012-05-31 00:00:00	\N	\N
2318	IVY-DRY CREAM (Topical)	919681	Benzyl Alcohol	5fe81556-5b5f-4765-9136-796e4974aed0	2013-03-21 00:00:00	\N	\N
2319	J-COF DHC (Oral Liquid)	1130863	Brompheniramine	4de68448-1f01-4ca1-b002-15589999de0f	2012-02-24 00:00:00	\N	\N
2320	J-MAX (Oral Liquid)	1163944	Guaifenesin	f8376d51-3fa8-4ac5-b074-83e3c81b96ba	2011-10-03 00:00:00	\N	\N
2321	J-MAX DHC (Oral Liquid)	1189596	dihydrocodeine	61e61344-bf91-4742-be57-d74b30cfa4ad	2012-02-24 00:00:00	\N	\N
2322	Jack pine pollen extract (Injectable)	40228279	jack pine pollen extract	3b904f52-6163-4095-a456-11b3018b227a	2009-12-15 00:00:00	\N	\N
2323	JALYN (Oral Pill)	989482	Dutasteride	f96c6acd-4d02-4ece-bd54-2d5a35aab7f5	2012-05-17 00:00:00	\N	\N
2324	JANTOVEN (Oral Pill)	1310149	Warfarin	f11079c4-f085-4558-bee9-c159525b2497	2015-06-02 00:00:00	\N	\N
2325	JANUMET (Oral Pill)	1503297	Metformin	e1af8ccb-ad50-452b-af44-022c9a0cb0ed	2013-06-06 00:00:00	\N	\N
2326	JANUVIA (Oral Pill)	1580747	sitagliptin	29f3dcc4-1ca9-46c5-aa12-9ba76caff326	2015-07-14 00:00:00	\N	\N
2327	Japanese black pine pollen extract (Injectable)	40173046	Japanese black pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2328	JARDIANCE (Oral Pill)	45774751	empagliflozin	faf3dd6a-9cd0-39c2-0d2e-232cb3f67565	2015-07-09 00:00:00	\N	\N
2329	Jerusalem oak pollen extract (Injectable)	40228461	Jerusalem oak pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
2330	JETREA (Injectable)	42904298	ocriplasmin	390682b7-72c4-11e1-b0c4-0800200c9a66	2015-09-30 00:00:00	\N	\N
2331	JINTELI (Oral Pill)	1549786	Ethinyl Estradiol	d667ca75-1a17-43fc-9077-f25ce0908f8d	2015-03-09 00:00:00	\N	\N
2332	Johnson grass smut extract (Injectable)	40161260	Johnson grass smut extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
2333	Jute fiber extract (Injectable)	40161738	jute fiber extract	d71013ab-718c-4cb0-ae1a-31fdd6db8851	2009-12-18 00:00:00	\N	\N
2334	K-PHOS (Oral Liquid)	19027362	potassium phosphate	04557ab3-6d21-49b4-b849-744c75b8a630	2014-10-01 00:00:00	\N	\N
2335	K-PHOS NEUTRAL (Oral Pill)	19027362	potassium phosphate	83376725-ee0f-40ad-bd90-31a61b9445cf	2014-10-07 00:00:00	\N	\N
2336	K-PHOS NO 2 (Oral Pill)	19027362	potassium phosphate	9f446400-c403-4971-879e-1341f7f7d9da	2014-10-07 00:00:00	\N	\N
2337	K-TAB XR (Oral Pill)	19049105	Potassium Chloride	a269accf-8520-48eb-8164-adaa3f462d67	2010-08-04 00:00:00	\N	\N
2338	KADIAN XR (Oral Pill)	1110410	Morphine	58159bbc-d862-4a2a-8486-874e0007487b	2014-07-09 00:00:00	\N	\N
2339	KALETRA (Oral Pill)	1738170	lopinavir	dac2ea61-f5ce-45b8-b4aa-d761c5aecd74	2012-10-11 00:00:00	\N	\N
2340	Kanamycin (Injectable)	1784749	Kanamycin	d4865638-1259-4eef-a73c-fe919af6e850	2012-05-29 00:00:00	\N	\N
2341	KAOPECTATE REFORMULATED AUG 2006 (Oral Liquid)	933794	attapulgite	db9c4b93-d5f2-4237-973e-75535024b9f5	2015-01-09 00:00:00	\N	\N
2342	KAOPECTATE REFORMULATED AUG 2006 (Oral Pill)	933794	attapulgite	9d15ff85-9a7c-42fe-bd85-bcbf7711c277	2014-09-04 00:00:00	\N	\N
2343	KAYEXALATE (Oral Liquid)	19078126	Sodium polystyrene sulfonate	e7808d28-9d96-4dde-81bc-5c8357cba004	2013-09-19 00:00:00	\N	\N
2344	KAZANO (Oral Pill)	43013884	alogliptin	83cb7914-a683-47bb-a713-f2bc6a596bd2	2015-09-22 00:00:00	\N	\N
2345	KEDBUMIN (Injectable)	1344143	"Albumin Human, USP"	57bd6811-8619-11e0-9d78-0800200c9a66	2013-11-14 00:00:00	\N	\N
2346	KEFLEX (Oral Pill)	1786621	Cephalexin	68fba58a-7748-4581-8432-f5286c46d90a	2014-02-11 00:00:00	\N	\N
2347	KEMSTRO (Oral Disintegrating)	715233	Baclofen	f133fe04-1550-4fa4-9dc4-652c27936bf2	2006-09-21 00:00:00	\N	\N
2348	KENALOG (Injectable)	903963	Triamcinolone	7bda15b1-d50d-4b1a-83a2-d9a450961bcf	2015-08-24 00:00:00	\N	\N
2349	KENALOG (Topical)	903963	Triamcinolone	cdf6c80c-ddbd-498f-8897-3c0feebafe31	2013-07-09 00:00:00	\N	\N
2350	Kentucky bluegrass pollen extract (Injectable)	40161228	Kentucky bluegrass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
2351	KEPPRA (Injectable)	711584	Levetiracetam	90b553fe-4e94-4cce-b5df-ea3e6487930d	2011-10-20 00:00:00	\N	\N
2352	KEPPRA (Oral Pill)	711584	Levetiracetam	d317020c-0850-4a5b-b344-74ad10b0b089	2014-05-16 00:00:00	\N	\N
2353	KERALAC (Topical)	906914	Urea	eccfae7f-4b53-4781-b198-f7c18366bfc9	2014-05-12 00:00:00	\N	\N
2354	KERALYT (Shampoo)	964407	Salicylic Acid	26e112b1-a64f-447c-a892-c83155ba1853	2014-12-23 00:00:00	\N	\N
2355	KERALYT 5 (Topical)	964407	Salicylic Acid	f36792ab-d519-41af-a9dc-27e6ef0414ae	2013-11-06 00:00:00	\N	\N
2356	KETALAR (Injectable)	785649	Ketamine	9f675d38-d02f-455c-bc99-bac5924f5054	2012-10-31 00:00:00	\N	\N
2357	Ketamine (Injectable)	785649	Ketamine	57ec7d99-c36d-444e-8a2c-78a3b5798163	2015-06-19 00:00:00	\N	\N
2358	KETEK (Oral Pill)	1702911	telithromycin	ba1cca98-f350-4655-88e3-6ef990779fb9	2015-03-26 00:00:00	\N	\N
2359	Ketoconazole (Oral Pill)	985708	Ketoconazole	72c743b9-cb85-46e8-873a-b84e6d1b5250	2015-06-25 00:00:00	\N	\N
2360	Ketoconazole (Shampoo)	985708	Ketoconazole	efbc6388-90ce-11de-b92c-8b7156d89593	2014-06-17 00:00:00	\N	\N
2361	Ketoconazole (Topical)	985708	Ketoconazole	7a18a4f4-5487-4cf6-a46d-58369dc5833c	2015-10-13 00:00:00	\N	\N
2362	Ketoprofen (Oral Pill)	1185922	Ketoprofen	b3180408-a3c0-4e02-8535-dea390a52277	2015-08-11 00:00:00	\N	\N
2363	Ketorolac (Injectable)	1136980	Ketorolac	62591551-a644-4b2c-a0de-982e906fabc3	2015-09-01 00:00:00	\N	\N
2364	Ketorolac (Ophthalmic)	1136980	Ketorolac	8c90a3ac-ab76-405d-adc2-2f9ea3e3f250	2015-07-07 00:00:00	\N	\N
2365	Ketorolac (Oral Pill)	1136980	Ketorolac	2837a082-3a34-6f81-5e43-45a70295686b	2015-07-22 00:00:00	\N	\N
2366	Ketotifen (Ophthalmic)	986117	Ketotifen	a08f22d5-4486-4bd8-a234-f8ce30e7d708	2015-10-02 00:00:00	\N	\N
2367	KINEVAC (Injectable)	19067803	Sincalide	1408aabb-6982-48e5-ae9f-504ec43b0003	2015-07-15 00:00:00	\N	\N
2368	KLARON (Topical)	1036252	Sulfacetamide	66ab38ea-5cea-47be-97f2-486517999fb0	2014-12-09 00:00:00	\N	\N
2369	KlonoPIN (Oral Pill)	798874	Clonazepam	542f22e8-dad2-47a8-93b6-30936715d73b	2013-12-17 00:00:00	\N	\N
2370	KLOR-CON (Oral Liquid)	19049105	Potassium Chloride	1cd90949-3588-49b4-adf3-b70f2ee8f2ef	2015-07-23 00:00:00	\N	\N
2371	KLOR-CON XR (Oral Pill)	19049105	Potassium Chloride	65a86e85-b4ee-4244-8dfe-c078a9485410	2015-09-15 00:00:00	\N	\N
2372	KLOR-CON/EF (Effervescent)	19027080	potassium bicarbonate	731d4e0d-e73b-41ef-a39f-c356d999734d	2014-09-02 00:00:00	\N	\N
2373	KOGENATE (Injectable)	1352213	Factor VIII	6d2e4c97-0fb1-4ba4-9c58-3de071029e9b	2015-08-25 00:00:00	\N	\N
2374	KOLA-PECTIN (Oral Liquid)	937791	bismuth subsalicylate	5310c125-1b3b-4511-8a71-06aa42891dc1	2012-01-26 00:00:00	\N	\N
2375	KOLORZ (Oral Foam)	19069022	Sodium Fluoride	873dd35e-ed1a-4f2b-bd7d-237f73ed8f8e	2011-03-14 00:00:00	\N	\N
2376	KONSYL (Oral Liquid)	957797	Psyllium	6c876cf1-c2ab-4bdc-bb3e-ac2ce5863649	2014-01-24 00:00:00	\N	\N
2377	KONSYL (Oral Pill)	957797	Psyllium	ab185f98-fe41-41e5-991d-0ea37dfa5958	2014-01-24 00:00:00	\N	\N
2378	KONSYL SENNA PROMPT (Oral Pill)	957797	Psyllium	3b5e5397-fe64-48c5-8607-47c0a0900953	2013-12-04 00:00:00	\N	\N
2379	KORLYM (Oral Pill)	1508439	Mifepristone	542f3fae-8bc8-4f00-9228-e4b66c9ad6a9	2015-06-29 00:00:00	\N	\N
2380	KRISTALOSE (Oral Liquid)	987245	Lactulose	535dd1ea-b567-49f7-9a84-8ea91e78c466	2012-09-26 00:00:00	\N	\N
2381	KRYSTEXXA (Injectable)	40226208	Pegloticase	5f4574d1-401f-4647-83e5-28c0f4a122a7	2013-04-19 00:00:00	\N	\N
2382	Labetalol (Injectable)	1386957	Labetalol	f6e529bf-fe4d-4091-a3c2-774245b5f0a1	2015-10-06 00:00:00	\N	\N
2383	Labetalol (Oral Pill)	1386957	Labetalol	4b0a80fc-51d6-4a70-8ebb-6a403ab91f4f	2015-10-01 00:00:00	\N	\N
2384	LAC-HYDRIN (Topical)	19011035	Lactate	807054c6-2dae-4cc2-b790-674ab66cf79b	2010-02-18 00:00:00	\N	\N
2385	LAC-HYDRIN TEN (Topical)	19011035	Lactate	b73836e9-7ccc-41bb-b4ef-65ad2d865085	2014-02-27 00:00:00	\N	\N
2386	LACRISERT (Implant)	19002257	hydroxypropylcellulose	cc7a6a52-0b77-4df7-8403-dd21c1334f6c	2015-09-23 00:00:00	\N	\N
2387	Lactate (Topical)	19011035	Lactate	736c1976-7448-4d04-8ca7-9455e4db96e8	2014-05-21 00:00:00	\N	\N
2388	Lactulose (Oral Liquid)	987245	Lactulose	8a42c3af-b08d-4fd4-b2f7-4eda676921f2	2015-02-20 00:00:00	\N	\N
2389	LaMICtal (Oral Pill)	705103	lamotrigine	22a9788c-5a9b-411e-844e-4a0b12d1d095	2011-12-22 00:00:00	\N	\N
2390	LamISIL (Topical)	1741309	terbinafine	c7f36b7b-f205-4de5-b083-acea57281871	2015-06-24 00:00:00	\N	\N
2391	LAMISIL DEFENSE (Topical)	902950	Tolnaftate	c0ad1ce5-bdb3-43cc-8d07-84f250eb289f	2014-03-07 00:00:00	\N	\N
2392	lamiVUDine (Oral Pill)	1704183	Lamivudine	bd55dd57-348c-4d78-b322-d1ae10279298	2015-08-04 00:00:00	\N	\N
2393	lamiVUDine/Zidovudine (Oral Pill)	1704183	Lamivudine	16da660b-9981-4d24-a14a-94c7744fce4f	2015-10-13 00:00:00	\N	\N
2394	lamoTRIgine (Chewable)	705103	lamotrigine	a7455849-968d-4d85-8733-1e01701d7942	2015-04-20 00:00:00	\N	\N
2395	lamoTRIgine (Oral Disintegrating)	705103	lamotrigine	380bddae-5b31-4965-96de-97711d859d11	2015-02-10 00:00:00	\N	\N
2396	lamoTRIgine (Oral Pill)	705103	lamotrigine	9b057910-de40-3a17-2d52-8b520d5e0cbc	2015-10-13 00:00:00	\N	\N
2397	LANACANE (Topical)	916802	Benzethonium	4b965cd3-bfe4-4aad-a52c-b747696baa1c	2013-12-27 00:00:00	\N	\N
2398	Lanolin (Topical)	19087317	Lanolin	3c8ac730-3e34-4368-9cb3-7047b7149fe3	2014-10-23 00:00:00	\N	\N
2399	Lanolin/Petrolatum (Topical)	19087317	Lanolin	beed4a17-c617-49c7-9954-470c02cfbbeb	2015-05-28 00:00:00	\N	\N
2400	LANOXIN (Injectable)	1326303	Digoxin	bf0bcd81-38b8-482f-8865-61d8fb9a5c59	2013-01-15 00:00:00	\N	\N
2401	LANOXIN (Oral Pill)	1326303	Digoxin	0b96049b-e6b9-4ebb-bfe9-d5a73ed4f66b	2015-10-01 00:00:00	\N	\N
2402	Lansoprazole (Oral Disintegrating)	929887	lansoprazole	7140f8d9-e478-4f69-a4eb-3fd4c9414576	2015-07-23 00:00:00	\N	\N
2403	Lansoprazole (Oral Pill)	929887	lansoprazole	70bade45-0d35-46db-964e-a8ad9dd91646	2015-09-30 00:00:00	\N	\N
2404	Lanthanum carbonate (Chewable)	990028	lanthanum carbonate	21bc55ec-5f23-4d0b-9488-d5b08b7c0fc2	2012-04-23 00:00:00	\N	\N
2405	LANTISEPTIC (Topical)	19087317	Lanolin	0fb56eed-66b6-4aa8-80b4-67015b99cd08	2013-01-24 00:00:00	\N	\N
2406	LANTISEPTIC MULTI-PURPOSE (Topical)	902616	Calamine	4cc157aa-cdab-4ac2-bec4-647d26a4d7ee	2013-01-25 00:00:00	\N	\N
2407	LANTUS (Injectable)	1502905	Insulin Glargine	13cfe263-6a6a-4b0f-94f4-771ab6a105c0	2013-11-26 00:00:00	\N	\N
2408	LASTACAFT (Ophthalmic)	40224159	alcaftadine	c192fecc-046d-4905-868f-b8200320309c	2015-10-09 00:00:00	\N	\N
2409	Latanoprost (Ophthalmic)	954688	latanoprost	e2e7999b-ea0b-69d0-4ad0-c214601f97a7	2015-08-12 00:00:00	\N	\N
2410	LATRIX (Topical)	906914	Urea	2b7add8d-2a6a-436c-9c1e-f94e67683efb	2010-07-22 00:00:00	\N	\N
2411	LATUDA (Oral Pill)	40230761	lurasidone	88a244d1-eddb-499c-bee2-e1f49056e78f	2010-11-19 00:00:00	\N	\N
2412	LAVIV (Injectable)	40241205	azficel-T	4a41354f-c689-4216-82cc-bfc572f16374	2012-01-31 00:00:00	\N	\N
2413	Ledipasvir/Sofosbuvir (Oral Pill)	45775020	ledipasvir	1a1c555d-2fdf-4150-8ace-dbc770c226bf	2014-12-05 00:00:00	\N	\N
2414	Leflunomide (Oral Pill)	1101898	leflunomide	753453c5-8a7a-878e-3ce7-1d1edce718a9	2015-10-13 00:00:00	\N	\N
2415	LEGATRIN PM (Oral Pill)	1125315	Acetaminophen	c7646e78-e88d-4f61-9075-b912fe5578fc	2014-08-19 00:00:00	\N	\N
2416	LEMTRADA (Injectable)	1312706	alemtuzumab	6236b0bc-82e9-4447-9a78-f57d94770269	2014-11-18 00:00:00	\N	\N
2417	LENZAGEL (Topical)	989878	Lidocaine	f52cc82a-e5fd-494a-942f-372e2eb46fcb	2014-09-09 00:00:00	\N	\N
2418	LENZAPATCH (Transdermal)	989878	Lidocaine	a4ba3e83-ca7c-4ff2-824c-77fe08e1586c	2014-12-17 00:00:00	\N	\N
2419	LESCOL (Oral Pill)	1549686	fluvastatin	e38126a5-9d6a-422f-812c-a01610108162	2011-04-05 00:00:00	\N	\N
2420	Letrozole (Oral Pill)	1315946	letrozole	6cfd29d7-f519-7b8c-4814-07b39f367f0d	2015-09-11 00:00:00	\N	\N
2421	Leucovorin (Injectable)	1388796	Leucovorin	ab691d4e-e0d1-4ba1-9c7a-1cdcfcc3c17c	2015-03-03 00:00:00	\N	\N
2422	Leucovorin (Oral Pill)	1388796	Leucovorin	084227c1-90eb-4653-807a-eb98cb3cefb8	2014-12-08 00:00:00	\N	\N
2423	LEUKERAN (Oral Pill)	1390051	Chlorambucil	967ed3ff-d99b-41e8-b768-dfb586d3d9a6	2012-06-22 00:00:00	\N	\N
2424	LEUKINE (Injectable)	1308432	sargramostim	c96afe62-f0cf-4d4b-b57d-194a8ec12389	2013-08-06 00:00:00	\N	\N
2425	Leuprolide (Injectable)	1351541	Leuprolide	a3b01473-30c7-4945-bd60-2484221aaaad	2015-09-22 00:00:00	\N	\N
2426	Levalbuterol (Inhalant)	1192218	Levalbuterol	0c47c47d-45f7-4eb4-b1f8-7d6c633a1f69	2015-07-17 00:00:00	\N	\N
2427	LEVAQUIN (Oral Pill)	1742253	Levofloxacin	139f86a4-75c5-4304-894c-8f8b8a396c78	2013-07-05 00:00:00	\N	\N
2428	LEVEMIR (Injectable)	1516976	insulin detemir	2b8d9730-686b-444b-9941-7b5877255924	2011-09-30 00:00:00	\N	\N
2429	levETIRAcetam (Injectable)	711584	Levetiracetam	f00d8f59-c333-48ad-aca3-98a49bcd228e	2015-09-01 00:00:00	\N	\N
2430	levETIRAcetam (Oral Liquid)	711584	Levetiracetam	d57044c1-9222-4127-a491-3328324fb4b2	2015-08-10 00:00:00	\N	\N
2431	levETIRAcetam (Oral Pill)	711584	Levetiracetam	a4f7e6ed-992b-4217-82d8-658036d12faa	2015-10-01 00:00:00	\N	\N
2432	LEVITRA (Oral Pill)	1311276	vardenafil	f18a82f7-ce44-4f9c-ae69-d3ad1d375564	2015-09-23 00:00:00	\N	\N
2433	Levobunolol (Ophthalmic)	932815	Levobunolol	5ab1efbe-530b-4787-b40a-c7dbf18161e1	2015-08-12 00:00:00	\N	\N
2434	levOCARNitine (Injectable)	1553610	Levocarnitine	cc4da2c3-f939-444d-9b5b-a57b6051c190	2014-08-04 00:00:00	\N	\N
2435	levOCARNitine (Oral Liquid)	1553610	Levocarnitine	b2cbc620-59fd-47b6-9e4b-7e3e31533a1c	2015-07-06 00:00:00	\N	\N
2436	levOCARNitine (Oral Pill)	1553610	Levocarnitine	479e0e78-9b6e-4991-80f3-e92386722765	2015-08-04 00:00:00	\N	\N
2437	Levocetirizine (Oral Liquid)	1136422	levocetirizine	df2a19c7-f437-425c-8253-a2523122a653	2014-12-22 00:00:00	\N	\N
2438	Levocetirizine (Oral Pill)	1136422	levocetirizine	4f43d057-cba8-4366-86ba-4be361e4c71f	2015-07-06 00:00:00	\N	\N
2439	Levofloxacin (Ophthalmic)	1742253	Levofloxacin	f79d2ae4-ccfb-49ca-bf0e-e505f3477d30	2012-09-07 00:00:00	\N	\N
2440	Levofloxacin (Oral Pill)	1742253	Levofloxacin	814450ae-439e-4a5d-8c60-9b21b6f14be5	2015-09-25 00:00:00	\N	\N
2441	Levoleucovorin (Injectable)	40168303	levoleucovorin	f977c9bb-bef1-4746-9894-4c29a1fdb0d8	2015-04-27 00:00:00	\N	\N
2442	Levomefolic Acid (Oral Pill)	40228423	Levomefolic Acid	8132454a-6135-4bac-b206-83a55eb8dbc6	2015-08-03 00:00:00	\N	\N
2443	Levonorgestrel (Implant)	1589505	Levonorgestrel	9f44ff35-e052-49cd-a1c2-0bfd87d49309	2015-09-03 00:00:00	\N	\N
2444	Levonorgestrel (Oral Pill)	1589505	Levonorgestrel	38c26cb9-052e-426f-9916-c13e7a5e62d0	2015-09-08 00:00:00	\N	\N
2445	LEVOPHED (Injectable)	1321341	Norepinephrine	8c9dc6eb-e53a-4cc0-92c3-7a53d268cf93	2014-04-29 00:00:00	\N	\N
2446	Levorphanol (Oral Pill)	1189766	Levorphanol	77f4a54a-6901-46d9-93db-ad4be7eae6c3	2015-09-17 00:00:00	\N	\N
2447	LEVOTHROID (Oral Pill)	1501700	Thyroxine	101de879-bb0a-4157-9c0d-2c5720dd454e	2012-03-06 00:00:00	\N	\N
2448	Levothyroxine (Injectable)	1501700	Thyroxine	ce990712-49c1-4f66-9ee4-c770e8ec394c	2015-04-24 00:00:00	\N	\N
2449	Levothyroxine (Oral Pill)	1501700	Thyroxine	a0bef5df-f192-4c0b-be61-2f28b982e8fd	2015-09-28 00:00:00	\N	\N
2450	Levothyroxine/Triiodothyronine (Oral Pill)	1501700	Thyroxine	7d028b83-5166-4b2e-b442-ba6cbfefbfd6	2013-05-17 00:00:00	\N	\N
2451	LEVOXYL (Oral Pill)	1501700	Thyroxine	758588c3-c63e-491b-0aa2-4f50d80cb174	2014-10-01 00:00:00	\N	\N
2452	LEVSIN (Injectable)	923672	Hyoscyamine	dd2e786c-29a7-40f8-a5f3-7641413f5036	2010-07-20 00:00:00	\N	\N
2453	LEVSIN (Sublingual)	923672	Hyoscyamine	f38ece41-b890-11e2-9e96-0800200c9a66	2013-05-15 00:00:00	\N	\N
2454	LEVULAN (Topical)	924120	Aminolevulinate	e45cc371-9ebc-4904-12bc-65cb4e2817ad	2012-01-09 00:00:00	\N	\N
2455	LEXAPRO (Oral Pill)	715939	Escitalopram	16c67e3e-9928-4ad8-b850-84ec4d333e9b	2014-04-01 00:00:00	\N	\N
2456	LEXIVA (Oral Pill)	1736829	fosamprenavir	009575f9-74e8-4a6d-9fa6-3cae72fd01c3	2010-05-26 00:00:00	\N	\N
2457	LIALDA (Oral Pill)	968426	mesalamine	07e5ac9c-a5b2-42dc-84fa-963dbc51ba21	2013-12-10 00:00:00	\N	\N
2458	LIBRAX (Oral Pill)	990678	Chlordiazepoxide	f99ebf66-f207-4a97-9666-4da1d72b061c	2015-01-16 00:00:00	\N	\N
2459	LICE MD (Topical)	946340	Piperonyl Butoxide	7509990f-0bc8-44dc-9678-05b27f2c1368	2013-09-13 00:00:00	\N	\N
2460	Lidocaine (Injectable)	989878	Lidocaine	331f6960-a09d-4513-9e6b-a03527d9131e	2015-10-13 00:00:00	\N	\N
2461	Lidocaine (Mucosal)	989878	Lidocaine	8a4c45c0-7eae-4296-ae2e-6d618228dc8b	2015-09-09 00:00:00	\N	\N
2462	Lidocaine (Rectal)	989878	Lidocaine	bf08d3c1-f3ef-4307-ba99-b20e31a3e8f0	2015-09-15 00:00:00	\N	\N
2463	Lidocaine (Topical)	989878	Lidocaine	c913688b-c51d-44c2-8ce6-5200f1ea0bab	2015-09-09 00:00:00	\N	\N
2464	Lidocaine (Transdermal)	989878	Lidocaine	55be87b4-a69b-4bfd-bf92-2949ec5e5dab	2015-08-26 00:00:00	\N	\N
2465	Lidocaine/Menthol (Topical)	989878	Lidocaine	e8aa0e47-68e1-462c-a609-58548448da44	2015-07-13 00:00:00	\N	\N
2466	Lidocaine/Menthol (Transdermal)	989878	Lidocaine	3f541c7c-e6d6-47cb-8406-865bc61f8c5d	2015-10-01 00:00:00	\N	\N
2467	Lidocaine/Prilocaine (Mucosal)	989878	Lidocaine	b501d239-923b-48b2-82ed-6c5c253a67e2	2012-08-23 00:00:00	\N	\N
2468	Lidocaine/Prilocaine (Topical)	989878	Lidocaine	c05f3803-92ae-42b7-8248-933bd92d6116	2015-07-24 00:00:00	\N	\N
2469	Lidocaine/Tetracaine (Transdermal)	989878	Lidocaine	b3eee508-8bf3-4bd3-9a71-47ee6ea87f95	2012-03-05 00:00:00	\N	\N
2470	LIDOCREAM (Topical)	989878	Lidocaine	298401a9-8584-4801-af96-81d464d220bb	2014-07-29 00:00:00	\N	\N
2471	LIDODERM (Transdermal)	989878	Lidocaine	18e420b9-0fd1-48d9-9a23-c1e29a5f629f	2014-09-16 00:00:00	\N	\N
2472	LIDOSITE (Transdermal)	1343916	Epinephrine	82b5bf2c-7dc9-40bd-9fb4-b5b1b5be0470	2007-09-14 00:00:00	\N	\N
2473	LIGNOSPAN (Injectable)	1343916	Epinephrine	82e7d9d8-bad8-4dac-8e2c-29e834fc6dbf	2011-12-19 00:00:00	\N	\N
2474	Linagliptin (Oral Pill)	40239216	Linagliptin	dfe327e8-f6ab-41e5-bdef-d520118cd83a	2014-07-22 00:00:00	\N	\N
2475	Lincomycin (Injectable)	1790692	Lincomycin	0f6a98ff-c908-48a8-ae17-c8b32f4396a3	2015-10-09 00:00:00	\N	\N
2476	Lindane (Shampoo)	916751	Lindane	56158fc4-590f-4e8c-bf94-610a3cfc11c1	2010-07-02 00:00:00	\N	\N
2477	Lindane (Topical)	916751	Lindane	54b9526e-29ab-46b0-ab82-d765fbee5c6f	2012-01-04 00:00:00	\N	\N
2478	Linezolid (Oral Pill)	1736887	linezolid	2a02e028-263f-4673-ae85-19b784bd118c	2015-09-02 00:00:00	\N	\N
2479	LIPITOR (Oral Pill)	1545958	atorvastatin	76a76f8e-d7c6-4621-b0a4-d5db0c24f089	2013-10-18 00:00:00	\N	\N
2480	LIPODOX (Injectable)	19051649	doxorubicin liposome	1d5beebf-77f3-47ca-a9a1-5f64f42fed07	2012-05-22 00:00:00	\N	\N
2481	LIPTRUZET (Oral Pill)	1545958	atorvastatin	c387354c-607b-474d-b2e5-d35c789ce09b	2013-09-09 00:00:00	\N	\N
2482	Lisdexamfetamine (Oral Pill)	709567	Lisdexamfetamine	a310fc51-2743-4755-8398-fed5402283f6	2012-01-18 00:00:00	\N	\N
2483	Lisinopril (Oral Pill)	1308216	Lisinopril	69b41c71-b39e-43cf-94b7-8909ae9fd1fa	2015-10-13 00:00:00	\N	\N
2484	LISTERINE (Mouthwash)	19069022	Sodium Fluoride	283fea4d-a8e5-42fa-8617-da9235b8be85	2014-10-14 00:00:00	\N	\N
2485	LISTERINE ANTISEPTIC (Mouthwash)	19050346	Eucalyptol	d38a273c-3833-4459-9e80-c2b0c779772e	2015-09-02 00:00:00	\N	\N
2486	LISTERINE ESSENTIAL CARE TARTAR CONTROL (Toothpaste)	19068715	monofluorophosphate	84f70fea-d730-49ee-ab74-cd280ed6d506	2015-07-21 00:00:00	\N	\N
2487	LITHANE (Oral Pill)	751246	Lithium Carbonate	42bed965-4b8f-4471-bcc9-091f87238653	2006-07-13 00:00:00	\N	\N
2488	Lithium Carbonate (Oral Pill)	751246	Lithium Carbonate	bc99fa8c-1d8b-4363-b616-548c62594076	2014-10-20 00:00:00	\N	\N
2489	Lithium Carbonate XR (Oral Pill)	751246	Lithium Carbonate	9efc1d04-7aae-4ca9-9af6-ea6f3e095db2	2015-06-09 00:00:00	\N	\N
2490	Lithium citrate (Oral Liquid)	767410	lithium citrate	1a04cc23-61fa-455b-9718-2cdcf54036e0	2014-01-10 00:00:00	\N	\N
2491	LITHOBID XR (Oral Pill)	751246	Lithium Carbonate	ea4ece7f-e81f-48de-b262-577db5b6fe6c	2014-07-03 00:00:00	\N	\N
2492	LITTLE FEVERS (Oral Liquid)	1125315	Acetaminophen	e1e44c85-d10c-4997-8f85-064cda7906eb	2011-08-12 00:00:00	\N	\N
2493	LITTLE OUCHIES (Topical)	917006	Benzocaine	a4b73305-edf6-42cd-994a-0d7e3507a97d	2010-10-09 00:00:00	\N	\N
2494	LITTLE TUMMYS LAXATIVE DROPS (Oral Liquid)	938268	"sennosides, USP"	b2bf2d76-7dc0-4864-bfc2-ef41e155d316	2012-09-27 00:00:00	\N	\N
2495	LIVALO (Oral Pill)	40165636	pitavastatin	44dcbf97-99ec-427c-ba50-207e0069d6d2	2013-10-24 00:00:00	\N	\N
2496	Live oak pollen extract (Injectable)	40167574	live oak pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
2497	LMX (Rectal)	989878	Lidocaine	34f8ed6b-4a52-4a99-9c1b-254196dc29b0	2013-08-27 00:00:00	\N	\N
2498	LMX (Topical)	989878	Lidocaine	f0e7c92f-8b0b-4045-b659-af9f6e81260f	2014-06-24 00:00:00	\N	\N
2499	Loblolly pine pollen extract (Injectable)	40172266	loblolly pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2500	LOCOID (Topical)	975125	Hydrocortisone	c7b4f583-2f79-4242-8ed2-d0e19ce8a510	2014-11-12 00:00:00	\N	\N
2501	Lodgepole pine pollen extract (Injectable)	40172270	lodgepole pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2502	Lodgepole pine pollen extract/Yellow pine pollen extract (Injectable)	40172270	lodgepole pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2503	LODOSYN (Oral Pill)	740560	Carbidopa	79e4ca99-7217-41bb-8ace-d0040b56e859	2014-03-05 00:00:00	\N	\N
2504	Lodoxamide (Ophthalmic)	967496	Lodoxamide	1b97597f-f2e7-4574-81a8-f35b769c957a	2011-08-01 00:00:00	\N	\N
2505	LODRANE D (Oral Pill)	1130863	Brompheniramine	4ae74ab3-c1f7-4347-9833-16553cf9969d	2012-02-06 00:00:00	\N	\N
2506	LOFIBRA (Oral Pill)	1551803	Fenofibrate	680a6740-8ea8-4a06-b659-41c2e5b1a4fd	2012-08-15 00:00:00	\N	\N
2507	Lombard poplar pollen extract/White poplar pollen extract (Injectable)	40161316	Lombard poplar pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2508	LOMOTIL (Oral Pill)	914335	Atropine	d2b171be-ac59-48ec-84da-03d3f2d34ca6	2009-11-13 00:00:00	\N	\N
2509	Lomustine (Oral Pill)	1391846	Lomustine	17893de9-7d54-448c-9fca-d10642046d14	2012-12-07 00:00:00	\N	\N
2510	Loperamide (Oral Liquid)	991876	Loperamide	b5132a26-dc9f-4495-97fa-9225b87e1c8a	2015-10-02 00:00:00	\N	\N
2511	Loperamide (Oral Pill)	991876	Loperamide	ab07bfd1-d2d3-427a-866d-89a10d40a4e9	2015-10-13 00:00:00	\N	\N
2512	Lopinavir/Ritonavir (Oral Pill)	1738170	lopinavir	c7fc2d1e-802e-4da1-9763-3355f8aafe3a	2012-10-11 00:00:00	\N	\N
2513	LOPRESSOR (Oral Pill)	1307046	Metoprolol	bb05420c-fd24-4672-9f62-fdd313819287	2015-08-28 00:00:00	\N	\N
2514	LOPRESSOR HCT (Oral Pill)	974166	Hydrochlorothiazide	d8964894-3cd8-41c1-a844-148d2ef38a88	2012-10-24 00:00:00	\N	\N
2515	LORADAMED (Oral Pill)	1107830	Loratadine	32092beb-c177-4b6b-afa4-b4b5d64621f4	2015-05-21 00:00:00	\N	\N
2516	Loratadine (Oral Disintegrating)	1107830	Loratadine	2f0ef205-49bb-4a74-b000-2f9823ec6179	2015-04-01 00:00:00	\N	\N
2517	Loratadine (Oral Liquid)	1107830	Loratadine	775731a2-9b30-4a0e-82fb-b517b36317c7	2015-09-10 00:00:00	\N	\N
2518	Loratadine (Oral Pill)	1107830	Loratadine	b7c8c727-6498-40f4-942a-5b64f40641af	2015-08-31 00:00:00	\N	\N
2519	LORazepam (Injectable)	791967	Lorazepam	095ab8ff-83c5-4906-ae67-b04f4a58b58d	2012-04-20 00:00:00	\N	\N
2520	LORazepam (Oral Liquid)	791967	Lorazepam	711b60a3-028d-41d4-aa17-8f976e6df23e	2010-12-06 00:00:00	\N	\N
2521	LORazepam (Oral Pill)	791967	Lorazepam	ba6ce50e-c5a9-47ca-9803-a1ed82172b0e	2015-09-01 00:00:00	\N	\N
2522	LORCET (Oral Pill)	1125315	Acetaminophen	7a1411e1-b705-43d9-a305-c020c9e3bf4d	2014-04-01 00:00:00	\N	\N
2523	LORTAB (Oral Liquid)	1125315	Acetaminophen	55386fe7-990a-4596-a109-a6553a57bc7c	2014-05-08 00:00:00	\N	\N
2524	LORTAB (Oral Pill)	1125315	Acetaminophen	6e48680d-b4ea-4eca-86ab-d9eb3434855b	2013-08-12 00:00:00	\N	\N
2525	LORTUSS EX (Oral Liquid)	1201620	Codeine	69ee642b-423c-4a68-8c16-cae09d3ef59d	2014-08-29 00:00:00	\N	\N
2526	LORTUSS LQ (Oral Liquid)	738818	Doxylamine	fe74017b-3387-4e72-9e2d-9eb46465c3df	2011-04-04 00:00:00	\N	\N
2527	LORZONE (Oral Pill)	795113	Chlorzoxazone	bdd61b83-5bcd-4d23-8ef5-aeb9ca2f7c14	2015-06-24 00:00:00	\N	\N
2528	Losartan (Oral Pill)	1367500	Losartan	ab0863e8-cecd-4d66-85f4-72ceb684e97b	2015-09-17 00:00:00	\N	\N
2529	LOTEMAX (Ophthalmic)	967562	loteprednol etabonate	9a666065-d467-42b8-8ecd-0ec1de9986d5	2015-08-12 00:00:00	\N	\N
2530	LOTENSIN (Oral Pill)	1335471	benazepril	4d954024-a191-46e3-ba71-2a7d5b0c65d5	2013-07-15 00:00:00	\N	\N
2531	LOTENSIN HCT (Oral Pill)	1335471	benazepril	94c4536f-e28e-48b1-8336-b3939917e99d	2014-03-24 00:00:00	\N	\N
2532	Loteprednol etabonate (Ophthalmic)	967562	loteprednol etabonate	21c76da0-50a1-41c0-91b8-8cc4dcc27f60	2015-08-12 00:00:00	\N	\N
2533	LOTREL (Oral Pill)	1332418	Amlodipine	4653cabc-f249-4b4e-95b6-5fb4ddc0ad5d	2012-03-06 00:00:00	\N	\N
2534	LOTRIMIN (Topical)	1000632	Clotrimazole	f9536683-3f32-4c71-9b6a-70f8611e3dcf	2015-08-26 00:00:00	\N	\N
2535	LOTRIMIN AF (Topical)	907879	Miconazole	d6eb3b78-405b-43e5-9db5-da671465eda1	2014-05-29 00:00:00	\N	\N
2536	LOTRIMIN ULTRA (Topical)	958396	butenafine	0eadac26-4619-4227-9dda-28e739d77a87	2013-08-30 00:00:00	\N	\N
2537	LOTRONEX (Oral Pill)	948555	alosetron	526ba44c-a476-4675-a63c-4d0a72b723f5	2014-06-16 00:00:00	\N	\N
2538	Lovastatin (Oral Pill)	1592085	Lovastatin	baf283fe-3ab2-460a-a53a-a8ad5d4743b9	2015-09-23 00:00:00	\N	\N
2539	LOVAZA (Oral Pill)	1560305	Omega-3 Acid Ethyl Esters (USP)	fb2141cd-6cff-470c-b776-4482afcebb41	2011-02-17 00:00:00	\N	\N
2540	LOVENOX (Injectable)	1301025	Enoxaparin	53fd1302-9e1b-4e04-b06d-1a706547c388	2013-11-25 00:00:00	\N	\N
2541	Loxapine (Oral Pill)	792263	Loxapine	a61ac8b0-d2eb-4546-a57b-2c296fb12699	2015-05-11 00:00:00	\N	\N
2542	LOZOL (Oral Pill)	978555	Indapamide	289796b5-f95c-4c40-bad7-d6359e0f7840	2008-12-16 00:00:00	\N	\N
2543	Lubiprostone (Oral Pill)	987366	lubiprostone	1b632d92-a05b-42d3-88a6-b3e345d11fe4	2014-08-20 00:00:00	\N	\N
2544	LUBRIFRESH P.M. (Ophthalmic)	908523	Mineral Oil	a9f844af-6887-4496-8c64-721357a4a5bb	2012-04-20 00:00:00	\N	\N
2545	LUCENTIS (Injectable)	19080982	ranibizumab	de4e66cc-ca05-4dc9-8262-e00e9b41c36d	2015-02-26 00:00:00	\N	\N
2546	Lucinactant (Injectable)	42800204	lucinactant	f2ba0c81-ceb0-11e0-9572-0800200c9a66	2014-05-02 00:00:00	\N	\N
2547	LUDEN'S DROPS (Oral Lozenge)	922191	pectin	fada4d58-9506-47f7-907e-bb340828a2e9	2015-01-23 00:00:00	\N	\N
2548	LUDENT (Chewable)	19069022	Sodium Fluoride	029caea5-2b12-4051-b758-22cd7fc1d207	2011-12-29 00:00:00	\N	\N
2549	LUFYLLIN (Oral Pill)	1140088	Dyphylline	6d7ed7c0-9646-11de-a404-0002a5d5c51b	2015-01-12 00:00:00	\N	\N
2550	LUMICAIN (Topical)	957393	aluminum chloride	9fdcce3e-e4d4-41ae-8609-37987c12414e	2011-09-23 00:00:00	\N	\N
2551	LUMIGAN (Ophthalmic)	904525	bimatoprost	ec9097e7-4be4-4e62-99c3-24b48244c9f2	2015-03-16 00:00:00	\N	\N
2552	LUMIZYME (Injectable)	19088328	alglucosidase alfa	d6bfbc45-2d34-439e-8aad-59ee2d53d4df	2015-01-30 00:00:00	\N	\N
2553	LUNESTA (Oral Pill)	757352	Eszopiclone	e711e994-a489-d14b-9a50-60557b9ed137	2014-12-22 00:00:00	\N	\N
2554	LUPRON (Injectable)	1351541	Leuprolide	319f0af7-6cc7-4a91-a28a-9ceea37d0ca8	2008-03-25 00:00:00	\N	\N
2555	Lurasidone (Oral Pill)	40230761	lurasidone	88a244d1-eddb-499c-bee2-e1f49056e78f	2010-11-19 00:00:00	\N	\N
2556	LUSTRA (Topical)	976778	hydroquinone	c1d01301-70c3-484b-8967-2324afa1781e	2012-02-10 00:00:00	\N	\N
2557	LUXIQ (Topical)	920458	Betamethasone	3dab9411-df12-4073-9cc1-3273e2aee7e7	2011-04-04 00:00:00	\N	\N
2558	LUZU (Topical)	44507693	luliconazole	a7016010-ce43-4c09-8d21-aeb697ffed31	2015-01-05 00:00:00	\N	\N
2559	Lymphocyte immune globulin (Injectable)	19061406	Lymphocyte immune globulin	bd545ba1-2366-4df1-bd67-10dfd7632b54	2015-04-14 00:00:00	\N	\N
2560	LYRICA (Oral Pill)	734354	pregabalin	6f51d7bf-aba2-4f10-911a-3cbc4d501a00	2014-12-22 00:00:00	\N	\N
2561	LYSODREN (Oral Pill)	1309161	Mitotane	e9fba7d4-a0ec-4bfa-9b5b-ec97a9710fd3	2014-01-23 00:00:00	\N	\N
2562	LYSTEDA (Oral Pill)	1303425	Tranexamic Acid	49317334-a833-4620-a3b5-f179f8a821e2	2013-11-18 00:00:00	\N	\N
2563	M-CLEAR WC (Oral Liquid)	1201620	Codeine	903fe5b6-6c28-4b92-bdab-32389c10c25a	2014-02-18 00:00:00	\N	\N
2564	M-END MAX D (Oral Liquid)	1201620	Codeine	9f8fc672-3589-498d-82a7-e243f4e0dec0	2011-10-17 00:00:00	\N	\N
2565	M-END PE (Oral Liquid)	1130863	Brompheniramine	fce1a6e4-cda3-462e-a853-049eabe4441e	2014-12-30 00:00:00	\N	\N
2566	M-END WC (Oral Liquid)	1130863	Brompheniramine	f07920ad-7f4b-48d6-8c86-d5a257ff91c6	2014-02-18 00:00:00	\N	\N
2567	MAALOX MAX (Oral Liquid)	985247	Aluminum Hydroxide	ac12f0ae-6f06-4fa4-8265-37d27db8cb5d	2014-03-07 00:00:00	\N	\N
2568	MAALOX PLUS (Oral Liquid)	985247	Aluminum Hydroxide	e2a14762-3860-44c3-a3ea-5dbc45f4b1d5	2014-03-07 00:00:00	\N	\N
2569	Macitentan (Oral Pill)	44507580	Macitentan	1e484a50-55db-4b85-8c57-6cd1b0353abd	2015-05-20 00:00:00	\N	\N
2570	MACROBID (Oral Pill)	920293	Nitrofurantoin	1971e893-5fdb-41e3-a1e9-5e52deed03d1	2009-04-21 00:00:00	\N	\N
2571	MACRODANTIN (Oral Pill)	920293	Nitrofurantoin	ec86b651-d77d-4a42-b493-24244456b3f6	2009-04-21 00:00:00	\N	\N
2572	Mafenide (Topical)	992716	Mafenide	570ce479-d902-4394-bbae-41dfe16c5485	2015-07-17 00:00:00	\N	\N
2573	MAGNEBIND (Oral Pill)	19035704	Calcium Carbonate	af124c72-0a35-4305-abd8-2b0ebf84da08	2014-07-24 00:00:00	\N	\N
2574	MAGNEBIND 400 RX (Oral Pill)	19035704	Calcium Carbonate	e74e25aa-2f4c-4026-bc2b-7bb21aaf6fc5	2014-08-15 00:00:00	\N	\N
2575	Magnesium acetate/Potassium Acetate/Sodium Chloride (Injectable)	19013986	magnesium acetate	94c12711-d672-450d-baae-06e24a72aace	2006-09-28 00:00:00	\N	\N
2576	Magnesium carbonate (Oral Liquid)	908464	magnesium carbonate	163bceeb-ca74-413e-88b9-5c7bc9bbeb0d	2014-03-12 00:00:00	\N	\N
2577	Magnesium Chloride (Injectable)	19092849	Magnesium Chloride	2105d1c1-54ef-4d1a-a63c-b1619e8b50db	2013-03-15 00:00:00	\N	\N
2578	Magnesium citrate (Oral Liquid)	967861	magnesium citrate	511bb6ed-7832-4862-a572-24c37021041a	2015-09-09 00:00:00	\N	\N
2579	Magnesium Hydroxide (Chewable)	992956	Magnesium Hydroxide	0965c4e1-492d-1ffe-e054-00144ff88e88	2014-12-08 00:00:00	\N	\N
2580	Magnesium Hydroxide (Oral Liquid)	992956	Magnesium Hydroxide	3a189feb-0f1d-4695-899f-cbe508b9924d	2015-09-30 00:00:00	\N	\N
2581	Magnesium Hydroxide/Omeprazole/Sodium Bicarbonate (Chewable)	992956	Magnesium Hydroxide	cc8ef530-dd8c-40f5-af7e-4622c9e01d52	2007-03-19 00:00:00	\N	\N
2582	Magnesium Oxide (Oral Pill)	993631	Magnesium Oxide	2585e9da-e2df-40ec-8282-91dbe6476421	2015-09-11 00:00:00	\N	\N
2583	Magnesium Salicylate (Oral Pill)	1168079	Magnesium Salicylate	d98ee9c8-40e2-4abb-b5c1-45e73e7dd23b	2015-10-06 00:00:00	\N	\N
2584	Magnesium Sulfate (Oral Granules)	19093848	Magnesium Sulfate	040fe343-fb47-2226-df5e-d873120e23c5	2015-07-28 00:00:00	\N	\N
2585	MAKENA (Injectable)	19077143	Hydroxyprogesterone	a1998c1d-8337-4f00-8dcb-af3b54d39b77	2015-04-06 00:00:00	\N	\N
2586	Malathion (Topical)	993979	Malathion	e9ea6c59-0a3d-4ce0-96ab-f8e9c38ce9db	2014-03-05 00:00:00	\N	\N
2587	Mannitol (Injectable)	994058	Mannitol	d12cc802-b538-4065-a264-f474ff3b3043	2014-10-27 00:00:00	\N	\N
2588	Mannitol (Irrigation)	994058	Mannitol	be1b2398-892c-4c5d-a045-ce12f03bea8e	2014-04-03 00:00:00	\N	\N
2589	MAPAP (Chewable)	1125315	Acetaminophen	5b3391d9-0d16-4378-b98b-ac13de7d1004	2014-07-08 00:00:00	\N	\N
2590	MAPAP (Oral Disintegrating)	1125315	Acetaminophen	8080296f-44b6-450e-b3d6-bb8415b4e4cc	2015-04-01 00:00:00	\N	\N
2591	MAPAP (Oral Liquid)	1125315	Acetaminophen	dbbeeebc-48c3-42b2-ac08-aadfe43cfede	2015-03-12 00:00:00	\N	\N
2592	MAPAP (Oral Pill)	1125315	Acetaminophen	e27b1cb6-cfa0-47dc-9301-bf68f0695491	2015-09-10 00:00:00	\N	\N
2593	MAPAP PM (Oral Pill)	1125315	Acetaminophen	31a86ae4-cdae-46a5-9df5-d9d8cb9b5090	2011-05-23 00:00:00	\N	\N
2594	MAPAP SINUS CONGESTION AND PAIN (Oral Pill)	1125315	Acetaminophen	0adcc105-107f-4a71-aa89-e5dbc03087a0	2015-02-25 00:00:00	\N	\N
2595	Maple leaf sycamore pollen extract (Injectable)	40172372	maple leaf sycamore pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2596	MAR-COF BP (Oral Liquid)	1130863	Brompheniramine	7bef7c48-f784-49c7-a6e6-93042252d54b	2014-01-24 00:00:00	\N	\N
2597	MAR-COF CG (Oral Liquid)	1201620	Codeine	60a41229-b125-43d8-b2b4-0bf40feed764	2014-01-24 00:00:00	\N	\N
2598	Maraviroc (Oral Pill)	1787101	maraviroc	74fba35e-931e-44d8-97e0-d243bb687a71	2013-02-19 00:00:00	\N	\N
2599	MARCAINE (Injectable)	732893	Bupivacaine	250644e0-94b7-4da2-821a-50f66b54eb35	2015-10-13 00:00:00	\N	\N
2600	MARCAINE WITH EPINEPHRINE (Injectable)	732893	Bupivacaine	6a60cb55-530a-41ee-bc78-971eaf9f0850	2012-03-14 00:00:00	\N	\N
2601	MARGESIC (Oral Pill)	1125315	Acetaminophen	338b9f27-7097-4675-9ec5-e1eea6898cd5	2015-05-12 00:00:00	\N	\N
2602	MARPLAN (Oral Pill)	781705	Isocarboxazid	ac387aa0-3f04-4865-a913-db6ed6f4fdc5	2012-03-15 00:00:00	\N	\N
2603	MARQIBO (Injectable)	42874135	vincristine liposome	a1869e23-b93b-4407-843b-4b830319d82e	2013-01-14 00:00:00	\N	\N
2604	MARTEN-TAB (Oral Pill)	1125315	Acetaminophen	85c7db7a-a99a-43ef-9337-9916762ca087	2015-01-29 00:00:00	\N	\N
2605	MAVIK (Oral Pill)	1342439	trandolapril	bcaffc12-69af-46a8-a092-b3f66a0508d5	2012-02-15 00:00:00	\N	\N
2606	MAXALT (Oral Disintegrating)	1154077	rizatriptan	08d06e6f-a1d8-4bd9-b851-d63858d55f91	2011-08-22 00:00:00	\N	\N
2607	MAXALT (Oral Pill)	1154077	rizatriptan	08d06e6f-a1d8-4bd9-b851-d63858d55f91	2011-08-22 00:00:00	\N	\N
2608	MAXIDEX (Ophthalmic)	1518254	Dexamethasone	a0aa9dc9-265c-4dd6-9b03-276a47217839	2011-08-15 00:00:00	\N	\N
2609	MAXIDONE (Oral Pill)	1125315	Acetaminophen	a2617a15-b333-4ffc-98eb-36d8721aa0d6	2013-04-16 00:00:00	\N	\N
2610	MAXITROL (Ophthalmic)	1518254	Dexamethasone	277ff310-b7dc-43b6-8a16-885b58882bc0	2011-08-18 00:00:00	\N	\N
2611	MAXZIDE (Oral Pill)	974166	Hydrochlorothiazide	e92eda49-861e-4c79-b446-ec1213151d92	2015-09-22 00:00:00	\N	\N
2612	Meadow fescue grass pollen extract (Injectable)	40161861	meadow fescue grass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
2613	Mebendazole (Chewable)	1794280	Mebendazole	c338415f-41e0-071d-8c51-a80a02ebf2cd	2012-10-16 00:00:00	\N	\N
2614	Mecamylamine (Oral Pill)	1394333	Mecamylamine	0774cc48-7287-4093-91d6-9df41a81408a	2015-06-12 00:00:00	\N	\N
2615	Mechlorethamine (Topical)	1394337	Mechlorethamine	706bd420-2f32-11e0-aaee-0002a5d5c51b	2013-10-21 00:00:00	\N	\N
2616	Meclizine (Chewable)	994341	Meclizine	6872c83f-905d-40e6-a451-1d080dd5314c	2015-06-16 00:00:00	\N	\N
2617	Meclizine (Oral Pill)	994341	Meclizine	9350fefc-9c00-182c-c3a9-044d4a40856f	2015-09-21 00:00:00	\N	\N
2618	MEDERMA ADVANCED SCAR (Topical)	966376	Allantoin	7cf1c5a8-d28a-48c2-8cba-a3e18a7d51f9	2013-11-01 00:00:00	\N	\N
2619	MEDERMA PM (Topical)	916662	dimethicone	e1864a26-e8a3-4c9d-a468-ea020fdc30e1	2013-11-15 00:00:00	\N	\N
2620	MEDERMA STRETCH MARK THERAPY (Topical)	916662	dimethicone	6e84c921-03a7-4ec1-bd9b-4986b5559555	2013-12-02 00:00:00	\N	\N
2621	MEDI-DERM WITH LIDOCAINE (Topical)	939881	Capsaicin	8e71c2d3-b1ce-4b22-b39f-7dd7cdf8de04	2013-08-01 00:00:00	\N	\N
2622	MEDICAINE STING (Topical)	917006	Benzocaine	753e6cbe-31e0-4017-93d0-8b4bf5972f37	2011-03-31 00:00:00	\N	\N
2623	MEDIHALER-ERGOTAMINE (Inhalant)	1145379	Ergotamine	e713859d-f454-4f7e-a535-868b8d5f2c88	2006-09-01 00:00:00	\N	\N
2624	MEDIPLAST (Topical)	964407	Salicylic Acid	35bd29f9-cf49-404b-826b-72d1269d4f19	2012-12-04 00:00:00	\N	\N
2625	MEDROL (Oral Pill)	1506270	Methylprednisolone	4c0dd824-b099-47c3-aaf5-f6ddb873b3ee	2014-06-19 00:00:00	\N	\N
2626	MEDROX (Topical)	939881	Capsaicin	cfaf5295-e559-4e27-887d-d590670b4e89	2013-06-10 00:00:00	\N	\N
2627	MEDROX (Transdermal)	939881	Capsaicin	a9343d24-8435-4a51-98a2-b7976cd369ab	2011-12-14 00:00:00	\N	\N
2628	medroxyPROGESTERone (Injectable)	1500211	Medroxyprogesterone	cd0bbdb2-754e-4e66-8f36-985b5819d642	2015-01-05 00:00:00	\N	\N
2629	medroxyPROGESTERone (Oral Pill)	1500211	Medroxyprogesterone	468a972c-cb14-47c3-bdf6-4f7b64509e5c	2015-07-14 00:00:00	\N	\N
2630	Mefenamate (Oral Pill)	1197736	Mefenamate	194031c2-46f6-43b3-bbb4-faffe9b53fa4	2015-09-09 00:00:00	\N	\N
2631	Mefloquine (Oral Pill)	19000498	Mefloquine	1c47fd79-c0ca-42d6-9910-774272b25bc1	2013-07-02 00:00:00	\N	\N
2632	MEGA C ACID PLUS (Injectable)	19011773	Ascorbic Acid	7b65c50d-09d6-4df2-8322-971b100c176d	2013-07-31 00:00:00	\N	\N
2633	MEGACE (Oral Liquid)	1300978	Megestrol	654854bc-f847-4e3b-a0a1-8716553460ac	2015-05-14 00:00:00	\N	\N
2634	Megestrol (Oral Liquid)	1300978	Megestrol	33bc102c-31a3-4fd9-9702-c1193d7699a3	2015-07-29 00:00:00	\N	\N
2635	Megestrol (Oral Pill)	1300978	Megestrol	66573d39-f2a7-49fd-9ed2-97ac8f6e8456	2014-07-03 00:00:00	\N	\N
2636	MELAMIN (Topical)	976778	hydroquinone	30d92f16-1065-4754-88cd-58f9f05761ca	2014-07-11 00:00:00	\N	\N
2637	MELAMIX (Topical)	976778	hydroquinone	9f3a6a77-7e19-43fe-922a-76ed5f25c3f1	2014-10-10 00:00:00	\N	\N
2638	Meloxicam (Oral Liquid)	1150345	meloxicam	c27c35d7-07e1-47d4-97cd-ed1fb17750ce	2015-05-06 00:00:00	\N	\N
2639	Meloxicam (Oral Pill)	1150345	meloxicam	fe8480c4-b176-45ae-b4d6-fa59912fe286	2015-09-28 00:00:00	\N	\N
2640	Melphalan (Injectable)	1301267	Melphalan	9706e9a1-96ab-46b8-8846-32ee9d756b1d	2015-10-13 00:00:00	\N	\N
2641	Melphalan (Oral Pill)	1301267	Melphalan	ff913271-0090-4832-a0fe-5154fe8f97b9	2015-10-09 00:00:00	\N	\N
2642	MELQUIN-3 (Topical)	976778	hydroquinone	6bfcc6a9-899b-4ad7-b4e8-67d95fd04708	2014-11-25 00:00:00	\N	\N
2643	Memantine (Oral Liquid)	701322	Memantine	72973b46-f307-4a9e-8fb1-ad2cbccfd736	2015-07-15 00:00:00	\N	\N
2644	Memantine (Oral Pill)	701322	Memantine	1e3c74c9-0017-4d7a-a716-2b5366286a67	2015-08-26 00:00:00	\N	\N
2645	MEN-PHOR (Topical)	938205	Camphor	1294e5d7-7208-4312-bcc7-e0c093309559	2012-06-05 00:00:00	\N	\N
2646	MENEST (Oral Pill)	1551673	"Estrogens, Esterified (USP)"	efb195b9-b995-48f3-a4cb-b7e09d56350e	2011-01-10 00:00:00	\N	\N
2647	MENTAX (Topical)	958396	butenafine	167ecefd-4553-41b8-8160-81a48dbca076	2015-01-20 00:00:00	\N	\N
2648	Menthol (Oral Lozenge)	901656	Menthol	b640a5d2-a7fe-486d-a65f-e7c993f950d6	2015-09-21 00:00:00	\N	\N
2649	Menthol (Topical)	901656	Menthol	aa6d1beb-f462-4577-a57c-fb0ec12d4ce5	2015-09-14 00:00:00	\N	\N
2650	Menthol (Transdermal)	901656	Menthol	de68eb17-95f1-4c10-a5b1-bb0b64bb441a	2015-09-14 00:00:00	\N	\N
2651	Menthol/Methyl salicylate (Topical)	901656	Menthol	5488358e-2c90-433d-a850-7dcb31ca82d2	2015-07-14 00:00:00	\N	\N
2652	Menthol/Methyl salicylate (Transdermal)	901656	Menthol	2e88c933-89e6-4a48-be7a-dc6a36e5c8f8	2014-09-02 00:00:00	\N	\N
2653	Menthol/Pramoxine (Topical)	901656	Menthol	2c0eb81d-347e-412b-a0fd-727f0eb0ca4b	2015-01-13 00:00:00	\N	\N
2654	Menthol/Zinc Oxide (Topical)	901656	Menthol	ca5582e7-e11e-4353-94ef-086da44d42cd	2015-09-14 00:00:00	\N	\N
2655	MENTHOLATUM (Topical)	938205	Camphor	19e4b812-67c6-49fd-833a-b432100363f5	2015-08-03 00:00:00	\N	\N
2656	Meperidine (Injectable)	1102527	Meperidine	987a91b8-dd9e-47ce-bd43-f8189a54838e	2014-08-15 00:00:00	\N	\N
2657	Meperidine (Oral Liquid)	1102527	Meperidine	9c4f12e5-5e69-44d4-81a5-bd72c375eef5	2012-09-20 00:00:00	\N	\N
2658	Meperidine (Oral Pill)	1102527	Meperidine	6c2b41c3-732c-477f-8790-0eecea43b2da	2015-08-19 00:00:00	\N	\N
2659	Meperidine/Promethazine (Oral Pill)	1102527	Meperidine	dc578720-0447-4e99-ad63-75253a751297	2014-07-09 00:00:00	\N	\N
2660	MEPHYTON (Oral Pill)	19044727	Vitamin K 1	eb8d7fd3-4c7c-43e7-be09-98a446b905ef	2014-07-07 00:00:00	\N	\N
2661	Mepivacaine (Injectable)	702774	Mepivacaine	007fcf17-f78a-40a7-d494-af93bbb40032	2007-03-23 00:00:00	\N	\N
2662	Meprobamate (Oral Pill)	702865	Meprobamate	e9aa3d4c-f2e9-4ca9-b563-85fac4024539	2013-08-14 00:00:00	\N	\N
2663	Mercaptopurine (Oral Pill)	1436650	mercaptopurine	c3b5b8b0-bc5c-4ce9-bbdc-febba60c2658	2015-02-25 00:00:00	\N	\N
2664	MERCUROCLEAR (Topical)	916460	Benzalkonium	e3428aa5-d13a-497c-b21f-4bb30b6154e4	2013-07-01 00:00:00	\N	\N
2665	Meropenem (Injectable)	1709170	meropenem	7a68d899-2678-43a9-a9c1-ef8f916b562f	2015-06-04 00:00:00	\N	\N
2666	Mesalamine (Oral Pill)	968426	mesalamine	07e5ac9c-a5b2-42dc-84fa-963dbc51ba21	2015-07-20 00:00:00	\N	\N
2667	Mesalamine (Rectal)	968426	mesalamine	357e0e6b-cfbd-454c-82d7-cfc460dc0d68	2012-03-23 00:00:00	\N	\N
2668	Mesalamine XR (Oral Pill)	968426	mesalamine	ec53b1d4-b98d-4b4d-acc3-199f98031966	2014-08-20 00:00:00	\N	\N
2669	Mesna (Injectable)	1354698	Mesna	26a12d79-fd1b-4e49-bbf0-0d55784379b8	2015-09-22 00:00:00	\N	\N
2670	MESNEX (Injectable)	1354698	Mesna	49fdfbc3-69f8-4706-9d11-bf60e4e7811b	2015-06-12 00:00:00	\N	\N
2671	MESNEX (Oral Pill)	1354698	Mesna	4a51ffdb-f59f-4e02-b3c4-f3457ab7b514	2015-06-12 00:00:00	\N	\N
2672	Mesquite pollen extract (Injectable)	40161940	mesquite pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
2673	Mestranol/Norethindrone (Oral Pill)	1503184	Mestranol	a2b893ab-8ef1-4742-8026-7dfd69214840	2011-10-13 00:00:00	\N	\N
2674	METAMUCIL (Oral Liquid)	957797	Psyllium	7fb350de-624d-4765-a777-6c7efebd2b28	2015-03-17 00:00:00	\N	\N
2675	Metaproterenol (Oral Liquid)	1123995	metaproterenol	66eb4b4d-2388-49d3-8ffa-0b9bca75a28e	2011-06-29 00:00:00	\N	\N
2676	Metaproterenol (Oral Pill)	1123995	metaproterenol	cf566e38-f6ff-4b86-9537-8684943b36eb	2013-07-25 00:00:00	\N	\N
2677	Metaxalone (Oral Pill)	780369	metaxalone	e8643c67-c531-4a4f-931d-0e3c91cfc0c8	2015-06-24 00:00:00	\N	\N
2678	metFORMIN (Oral Pill)	1503297	Metformin	da99b8c4-f85e-409f-93a8-0e4758d74552	2015-10-13 00:00:00	\N	\N
2679	metFORMIN/Pioglitazone (Oral Pill)	1503297	Metformin	c7dbc36d-3c84-488e-9b72-0593b5ed53a0	2015-07-07 00:00:00	\N	\N
2680	metFORMIN/Repaglinide (Oral Pill)	1503297	Metformin	5be33711-b77d-4a01-87c8-3b2618c16e8f	2012-05-09 00:00:00	\N	\N
2681	metFORMIN/Rosiglitazone (Oral Pill)	1503297	Metformin	e77a8504-b49f-4343-beaf-6e4c2c59ab45	2015-03-27 00:00:00	\N	\N
2682	metFORMIN/sitaGLIPtin (Oral Pill)	1503297	Metformin	e1af8ccb-ad50-452b-af44-022c9a0cb0ed	2013-06-06 00:00:00	\N	\N
2683	Methadone (Injectable)	1103640	Methadone	9bbe219f-3bf1-44f4-a709-cd108c4fa9ef	2013-02-19 00:00:00	\N	\N
2684	Methadone (Oral Liquid)	1103640	Methadone	8c363f90-c378-48ae-abbc-aeb25c9bf5cb	2015-05-11 00:00:00	\N	\N
2685	Methadone (Oral Pill)	1103640	Methadone	0b72a120-ca4e-4b90-7d89-52967a39adb3	2015-05-06 00:00:00	\N	\N
2686	Methamphetamine (Oral Pill)	704053	Methamphetamine	f31f580f-1f08-4a0f-b078-0b9e3308f712	2015-05-19 00:00:00	\N	\N
2687	Methazolamide (Oral Pill)	904250	Methazolamide	7731560b-dbe7-4912-814e-ef60629e5f07	2015-01-27 00:00:00	\N	\N
2688	Methenamine (Oral Pill)	904356	Methenamine	ad741dc5-816c-4ab2-9273-9b1a586149bc	2014-07-07 00:00:00	\N	\N
2689	METHERGINE (Oral Pill)	1305637	Methylergonovine	94c9b1cf-ae12-45f3-8fcb-708a922cbc10	2012-05-07 00:00:00	\N	\N
2690	Methimazole (Oral Pill)	1504620	Methimazole	9e6b80b8-6780-da50-f18f-30e6fe7b01b9	2015-10-02 00:00:00	\N	\N
2691	METHITEST (Oral Pill)	1506602	Methyltestosterone	77bb4ef4-c10e-4acc-8225-651d003f4561	2015-05-04 00:00:00	\N	\N
2692	Methocarbamol (Injectable)	704943	Methocarbamol	8f91e243-7395-4ec9-adf5-37520983daf2	2014-12-09 00:00:00	\N	\N
2693	Methocarbamol (Oral Pill)	704943	Methocarbamol	32863f21-30ff-4a8b-a2e6-8ab14a37af0d	2015-09-23 00:00:00	\N	\N
2694	Methohexital (Injectable)	19005015	Methohexital	eccd8340-ead3-4363-8902-0c19d33aa2ac	2015-06-12 00:00:00	\N	\N
2695	Methotrexate (Injectable)	1305058	Methotrexate	6cf2e15a-6286-41f7-aa7d-3968d735c864	2014-05-16 00:00:00	\N	\N
2696	Methotrexate (Oral Pill)	1305058	Methotrexate	27dd39ca-207e-44db-8da1-a0689f0d6b6f	2015-07-31 00:00:00	\N	\N
2757	MIGERGOT (Rectal)	1134439	Caffeine	3a31ad0c-7bdd-544b-f5df-a99d04cf541c	2015-01-14 00:00:00	\N	\N
2697	Methoxsalen (Injectable)	905223	Methoxsalen	5ad333bd-845f-43f8-9ecf-43491f26c7c7	2015-05-19 00:00:00	\N	\N
2698	Methoxsalen (Oral Pill)	905223	Methoxsalen	ae951dc4-9031-43bf-943c-cb2366951f23	2015-08-17 00:00:00	\N	\N
2699	Methscopolamine (Oral Pill)	1158632	Methscopolamine	5c74bfb0-c80a-4a86-acd1-1e3a1b20255d	2013-10-29 00:00:00	\N	\N
2700	Methyclothiazide (Oral Pill)	905273	Methyclothiazide	4910dad2-c533-4232-85bf-e6b0235379c2	2014-06-19 00:00:00	\N	\N
2701	Methyl salicylate (Topical)	909440	methyl salicylate	17d8e13d-daf8-4bf6-acd8-2ebbd2dd1d22	2015-10-05 00:00:00	\N	\N
2702	Methylcellulose (Oral Liquid)	905371	Methylcellulose	9d5f2244-a610-4d45-b6e8-e79bb17a558f	2015-09-16 00:00:00	\N	\N
2703	Methylcellulose (Oral Pill)	905371	Methylcellulose	8a4f9f08-45bc-4642-a382-bf1c623e2bcc	2015-09-16 00:00:00	\N	\N
2704	Methyldopa (Oral Pill)	1305447	Methyldopa	00206aae-7db1-4ae9-8500-b03fd6788d74	2015-06-22 00:00:00	\N	\N
2705	Methylene blue (Injectable)	905518	Methylene blue	fde64824-2be5-4d85-8d57-5098ca6890bb	2011-12-27 00:00:00	\N	\N
2706	Methylergonovine (Injectable)	1305637	Methylergonovine	a9a3079e-b62b-4858-920e-d8f5cb38481e	2013-02-28 00:00:00	\N	\N
2707	Methylergonovine (Oral Pill)	1305637	Methylergonovine	047d3ab6-1f93-4080-95c1-f938ce8d5532	2013-10-21 00:00:00	\N	\N
2708	Methylphenidate (Chewable)	705944	Methylphenidate	16508cc6-13c7-4088-927a-b7206eb7c633	2015-04-24 00:00:00	\N	\N
2709	Methylphenidate (Oral Liquid)	705944	Methylphenidate	7b372d74-7ba7-437a-be8c-6e8335b78818	2015-08-27 00:00:00	\N	\N
2710	Methylphenidate (Oral Pill)	705944	Methylphenidate	330e620f-4b7f-4101-91dd-feddb7a823ed	2015-07-09 00:00:00	\N	\N
2711	methylPREDNISolone (Injectable)	1506270	Methylprednisolone	9ac89740-8d4f-4d37-be69-df986d9da69f	2015-06-19 00:00:00	\N	\N
2712	methylPREDNISolone (Oral Pill)	1506270	Methylprednisolone	a82cafa3-f540-4c15-a2e0-faafe91d0820	2015-09-04 00:00:00	\N	\N
2713	methylPREDNISolone (Topical)	1506270	Methylprednisolone	f8432414-d8a6-4597-a226-61fd09a80e0c	2011-04-25 00:00:00	\N	\N
2714	methylTESTOSTERone (Oral Pill)	1506602	Methyltestosterone	09db5a9d-9662-4bfb-824c-9c9aaad488dc	2015-04-23 00:00:00	\N	\N
2715	Methysergide (Oral Pill)	1106740	Methysergide	3fae28ee-700e-4d4f-a040-02ef01a2aeb4	2006-08-21 00:00:00	\N	\N
2716	Metipranolol (Ophthalmic)	905531	Metipranolol	699ce415-0798-4244-b5ec-bcdb383b50b3	2011-08-12 00:00:00	\N	\N
2717	Metoclopramide (Injectable)	906780	Metoclopramide	b78499dc-4d24-4226-be97-dc618d9da0cf	2015-08-17 00:00:00	\N	\N
2718	Metoclopramide (Oral Disintegrating)	906780	Metoclopramide	3fb9a45e-48ba-45c5-86a7-03a8744888f6	2014-08-27 00:00:00	\N	\N
2719	Metoclopramide (Oral Liquid)	906780	Metoclopramide	4e12e98a-06fe-4b3c-bb64-f2701e195c74	2015-09-01 00:00:00	\N	\N
2720	Metoclopramide (Oral Pill)	906780	Metoclopramide	c06f0098-193c-48e4-9629-8f4e69171bc6	2015-08-11 00:00:00	\N	\N
2721	Metolazone (Oral Pill)	907013	Metolazone	c893c914-6195-45fa-a2bc-4e8b78004737	2015-05-22 00:00:00	\N	\N
2722	METOPIRONE (Oral Pill)	19007490	Metyrapone	3a27d0ef-83a7-4e1c-9430-46a3326ee8d8	2014-08-19 00:00:00	\N	\N
2723	Metoprolol (Injectable)	1307046	Metoprolol	ffd837ea-551d-4b98-96e1-80c29ac32b20	2015-08-14 00:00:00	\N	\N
2724	Metoprolol (Oral Pill)	1307046	Metoprolol	59019362-b71d-479b-ba90-7c4923a8a044	2015-09-28 00:00:00	\N	\N
2725	Metreleptin (Injectable)	44814585	metreleptin	b6349e72-8bbb-40c6-ab31-89f7b1cce914	2014-07-09 00:00:00	\N	\N
2726	METROCREAM (Topical)	1707164	Metronidazole	43d5e570-f359-564d-9bb4-51784ad97b6f	2011-04-01 00:00:00	\N	\N
2727	METROGEL (Topical)	1707164	Metronidazole	ab3a8a2d-714a-4beb-af8a-99bc3ac3ebbe	2012-10-23 00:00:00	\N	\N
2728	METROGEL (Vaginal)	1707164	Metronidazole	bd3b62b6-4a80-495b-a1d3-d54eb15baf79	2011-04-08 00:00:00	\N	\N
2729	METROLOTION (Topical)	1707164	Metronidazole	c4e07c26-245d-3e51-6a47-fccde22334d2	2011-04-07 00:00:00	\N	\N
2730	metroNIDAZOLE (Injectable)	1707164	Metronidazole	a7276a00-bb2f-4876-b58b-f2e953d716e4	2015-07-28 00:00:00	\N	\N
2731	metroNIDAZOLE (Oral Pill)	1707164	Metronidazole	5911e8f2-1b3a-4222-b997-d2a1c9a9f535	2015-10-01 00:00:00	\N	\N
2732	metroNIDAZOLE (Topical)	1707164	Metronidazole	5f6014f9-4a54-47c6-a290-01472e6c0fe7	2015-07-31 00:00:00	\N	\N
2733	metroNIDAZOLE (Vaginal)	1707164	Metronidazole	526c226a-099b-4eb3-943d-c88b2763b2c1	2015-04-01 00:00:00	\N	\N
2734	Metyrapone (Oral Pill)	19007490	Metyrapone	3a27d0ef-83a7-4e1c-9430-46a3326ee8d8	2014-08-19 00:00:00	\N	\N
2735	Metyrosine (Oral Pill)	1401581	Metyrosine	32fb2f2f-34b5-4cd5-9145-c3ab37c5ca92	2011-03-29 00:00:00	\N	\N
2736	Mexiletine (Oral Pill)	1307542	Mexiletine	25b8c89e-450c-4a1d-9053-1eb97b868a98	2014-08-22 00:00:00	\N	\N
2737	MI-ACID (Oral Liquid)	985247	Aluminum Hydroxide	cd711cb3-293b-42f1-a853-ab02d2054e4e	2014-09-29 00:00:00	\N	\N
2738	MI-ACID GAS RELIEF (Chewable)	966991	Simethicone	f9f2b13c-6965-4971-8f93-fb1cdbaebc42	2012-08-07 00:00:00	\N	\N
2739	MIACALCIN (Injectable)	1537655	salmon calcitonin	f9d5a587-e2bc-4001-987d-9b04731303cb	2015-09-30 00:00:00	\N	\N
2740	MIACALCIN (Nasal)	1537655	salmon calcitonin	e147226d-7bf3-4f72-959b-8abd6464fbcd	2014-03-26 00:00:00	\N	\N
2741	Micafungin (Injectable)	19018013	micafungin	bc234dd7-5221-4a68-b153-aa0393c75bbf	2014-12-01 00:00:00	\N	\N
2742	MICARDIS (Oral Pill)	1317640	telmisartan	3bb7bc69-7752-4c16-9c60-e61eb5355a4d	2012-02-28 00:00:00	\N	\N
2743	MICARDIS-HCT (Oral Pill)	974166	Hydrochlorothiazide	539cdfb4-b920-48fb-8176-fe23841e3d32	2012-02-28 00:00:00	\N	\N
2744	MICATIN (Topical)	907879	Miconazole	96c56ba1-c3a8-48ce-ab58-550959485e3c	2011-01-04 00:00:00	\N	\N
2745	Miconazole (Buccal)	907879	Miconazole	ef3b205e-8526-48a0-afce-ddcef865d907	2015-06-26 00:00:00	\N	\N
2746	Miconazole (Topical)	907879	Miconazole	83c592b4-4b17-4fe1-91ec-778c949e6196	2015-09-21 00:00:00	\N	\N
2747	Miconazole (Vaginal)	907879	Miconazole	79b61ece-7590-4448-86fa-28ab3d3cc074	2015-10-02 00:00:00	\N	\N
2748	Miconazole/Petrolatum/Zinc Oxide (Topical)	907879	Miconazole	8d8aaac5-3203-4ade-ae74-e2ea469dae18	2011-04-28 00:00:00	\N	\N
2749	MICORT-HC (Topical)	975125	Hydrocortisone	a08b5877-e83e-449f-865e-30fcfbde665f	2008-02-08 00:00:00	\N	\N
2750	MICRO-GUARD (Topical)	907879	Miconazole	a43a94d0-fec0-470f-bdb4-535dcce6d1e0	2012-08-13 00:00:00	\N	\N
2751	MICRO-K XR (Oral Pill)	19049105	Potassium Chloride	cb128705-d8c7-4341-a976-d8fd7371df6d	2009-12-22 00:00:00	\N	\N
2752	Midazolam (Injectable)	708298	Midazolam	a91ce254-14a3-4cbf-8ab8-5da252aa3fdc	2015-01-29 00:00:00	\N	\N
2753	Midazolam (Oral Liquid)	708298	Midazolam	a833c24b-6dca-44d7-a0d6-20012fa1ea77	2015-06-08 00:00:00	\N	\N
2754	Midodrine (Oral Pill)	1308368	Midodrine	964e3631-bcd2-49dd-8dbf-9e1de42cebc4	2015-10-01 00:00:00	\N	\N
2755	MIDOL CRAMPS & BODYACHES (Oral Pill)	1177480	Ibuprofen	59257aae-3057-4109-923c-8baf7ea3d07b	2011-10-17 00:00:00	\N	\N
2756	Mifepristone (Oral Pill)	1508439	Mifepristone	542f3fae-8bc8-4f00-9228-e4b66c9ad6a9	2015-06-29 00:00:00	\N	\N
2758	Miglitol (Oral Pill)	1510202	miglitol	192e6ed7-9e8c-4772-9e3b-5912a1c63a31	2015-07-31 00:00:00	\N	\N
2759	Miglustat (Oral Pill)	19045272	Miglustat	817892d1-ee12-4632-85fc-57ccdf16d7b8	2015-07-30 00:00:00	\N	\N
2760	MILLIPRED (Oral Liquid)	1550557	prednisolone	12d46d10-00b9-45d5-81f9-e9b31083ae89	2014-03-12 00:00:00	\N	\N
2761	MILLIPRED (Oral Pill)	1550557	prednisolone	863ad743-eec0-46f0-beba-c1556384c636	2014-03-12 00:00:00	\N	\N
2762	Milnacipran (Oral Pill)	19080226	milnacipran	d4e56a10-3b29-4270-ab42-60dc74049cc5	2013-01-11 00:00:00	\N	\N
2763	Milrinone (Injectable)	1368671	Milrinone	88f78780-399f-4780-be19-205739db1682	2014-10-14 00:00:00	\N	\N
2764	Miltefosine (Oral Pill)	44816310	miltefosine	d6658aeb-7bc1-4eef-ad0d-0a873ddbecf5	2014-09-19 00:00:00	\N	\N
2765	MINERAL ICE (Topical)	901656	Menthol	aa7e4592-76d4-43cd-9e4b-3a112672c305	2011-12-06 00:00:00	\N	\N
2766	Mineral Oil (Oral Liquid)	908523	Mineral Oil	d1228aa1-3c25-4290-abe2-dd2640125280	2015-07-28 00:00:00	\N	\N
2767	Mineral Oil (Rectal)	908523	Mineral Oil	df5976d2-5e06-47f3-9173-66c290d10b3a	2015-07-17 00:00:00	\N	\N
2768	Mineral Oil (Topical)	908523	Mineral Oil	4ecd873b-b915-4132-ae78-b8826293a906	2013-06-28 00:00:00	\N	\N
2769	"Mineral Oil, Light (Oral Liquid)"	978577	"Mineral Oil, Light"	fad02e6f-4735-4e6b-8afd-d61db6533c2a	2015-10-01 00:00:00	\N	\N
2770	Mineral Oil/Petrolatum (Ophthalmic)	908523	Mineral Oil	6a4a2053-f947-4ce3-a885-a1c1465c8b0b	2015-09-22 00:00:00	\N	\N
2771	Mineral Oil/Petrolatum/Phenylephrine (Rectal)	908523	Mineral Oil	edf9f8d5-f55d-4c31-adfb-ba77ca24cc3d	2015-08-21 00:00:00	\N	\N
2772	Mineral Oil/Petrolatum/Phenylephrine/Shark liver oil (Rectal)	908523	Mineral Oil	c249615a-65a3-49bb-a512-445d18ccf125	2012-07-16 00:00:00	\N	\N
2773	Mineral Oil/Pramoxine/Zinc Oxide (Rectal)	908523	Mineral Oil	347ff421-3ad9-409f-8731-af0183682e12	2012-08-08 00:00:00	\N	\N
2774	MINIDROPS (Ophthalmic)	948856	Polyvinyl Alcohol	4c3cfc48-cb7d-4b11-9b3c-11610e82d551	2010-10-09 00:00:00	\N	\N
2775	MINIPRESS (Oral Pill)	1350489	Prazosin	36c4da56-502e-4da1-acf7-8e81ee453dcc	2015-04-22 00:00:00	\N	\N
2776	MINIPRIN (Oral Pill)	1112807	Aspirin	5a38a643-55b0-4a6c-84e1-ee2374435114	2012-05-09 00:00:00	\N	\N
2777	MINIZIDE (Oral Pill)	948787	Polythiazide	17367e1c-a4ad-451b-92c4-95565312e51a	2008-01-25 00:00:00	\N	\N
2778	MINOCIN (Oral Pill)	1708880	Minocycline	b1a6939e-8d77-449d-b55f-0fd9a500352a	2015-06-24 00:00:00	\N	\N
2779	Minocycline (Injectable)	1708880	Minocycline	84acbae4-d385-49d0-9e7b-5ae0e8de3053	2015-04-30 00:00:00	\N	\N
2780	Minocycline (Oral Pill)	1708880	Minocycline	174d642b-70b1-45b0-ad33-a4847feb1a8f	2015-09-28 00:00:00	\N	\N
2781	Minocycline (Oral Powder)	1708880	Minocycline	8515df41-1936-4f3b-86ba-d2bb2a8441fb	2015-09-14 00:00:00	\N	\N
2782	Minoxidil (Oral Pill)	1309068	Minoxidil	02d7399f-94cc-f718-f214-587301edd138	2015-04-29 00:00:00	\N	\N
2783	Minoxidil (Topical)	1309068	Minoxidil	5768ad6b-9ca9-4fa9-9fc9-a703c4bd7718	2015-10-09 00:00:00	\N	\N
2784	MINTOX PLUS (Chewable)	985247	Aluminum Hydroxide	a9d41e6e-2a8c-43aa-8b88-221a8d172d13	2012-08-01 00:00:00	\N	\N
2785	MINTOX PLUS (Oral Liquid)	985247	Aluminum Hydroxide	536b143d-a1d7-4972-a90b-248e41937070	2013-08-15 00:00:00	\N	\N
2786	MIOCHOL (Injectable)	19037624	Acetylcholine	e701ef07-9499-4b56-931f-f4eb3eedbe24	2014-10-09 00:00:00	\N	\N
2787	MIOSTAT (Injectable)	940183	Carbachol	f28d7a56-e079-4a8b-ad81-9a97c780de67	2011-07-18 00:00:00	\N	\N
2788	MIRALAX (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	1771d3bf-954d-49ea-b260-3d356e5dcfa5	2015-08-14 00:00:00	\N	\N
2789	MIRAPEX (Oral Pill)	720810	Pramipexole	3736d691-e8b9-4fdd-aeca-9e96cf907c51	2011-04-08 00:00:00	\N	\N
2790	Mirtazapine (Oral Disintegrating)	725131	Mirtazapine	73b7bbd9-7dba-4559-890f-3f8dd821e215	2015-09-28 00:00:00	\N	\N
2791	Mirtazapine (Oral Pill)	725131	Mirtazapine	ee6c42d0-f92c-4361-8b98-5375b1fbd44c	2015-10-13 00:00:00	\N	\N
2792	Misoprostol (Oral Pill)	1150871	Misoprostol	83554310-3991-4a9d-92f1-d71ccfd0fb3a	2015-02-04 00:00:00	\N	\N
2793	MITIGARE (Oral Pill)	1101554	Colchicine	cb5f9d85-6b81-49f8-bcd6-17b7bfbc10f2	2015-10-05 00:00:00	\N	\N
2794	mitoMYcin (Injectable)	1389036	Mitomycin	d80c6dc0-5f26-4d7a-a0f7-7698ab4f249a	2013-05-06 00:00:00	\N	\N
2795	mitoMYcin (Ophthalmic)	1389036	Mitomycin	244002c6-c61d-43fe-9326-072797113979	2012-07-20 00:00:00	\N	\N
2796	MITOSOL (Ophthalmic)	1389036	Mitomycin	244002c6-c61d-43fe-9326-072797113979	2012-07-20 00:00:00	\N	\N
2797	Mitotane (Oral Pill)	1309161	Mitotane	e9fba7d4-a0ec-4bfa-9b5b-ec97a9710fd3	2014-01-23 00:00:00	\N	\N
2798	mitoXANtrone (Injectable)	1309188	Mitoxantrone	c101cb05-faaa-44cb-9666-c8214628c844	2015-06-17 00:00:00	\N	\N
2799	Mivacurium (Injectable)	19010459	mivacurium	98ca2c17-43e2-49af-abbc-f870877e5786	2009-06-25 00:00:00	\N	\N
2800	MOBIC (Oral Liquid)	1150345	meloxicam	676e73fb-51d2-449a-8749-1a7bcc257b11	2012-03-20 00:00:00	\N	\N
2801	MOBIC (Oral Pill)	1150345	meloxicam	dbbc6373-e9ae-4215-8d08-5f6667a936d1	2012-10-09 00:00:00	\N	\N
2802	MOBISYL (Topical)	943116	trolamine salicylate	4d3e0e75-cd77-4174-9316-163f5fe05349	2015-09-08 00:00:00	\N	\N
2803	Modafinil (Oral Pill)	710650	modafinil	9f3b0bd2-72a3-411f-aeec-b533373f1a97	2015-03-17 00:00:00	\N	\N
2804	Moexipril (Oral Pill)	1310756	moexipril	e16c2ad3-1ce5-48fc-96b2-5d63dc6b68d5	2013-10-18 00:00:00	\N	\N
2805	Molindone (Oral Pill)	709699	Molindone	138e8ca3-9a12-4c48-95c0-85bd01c79b13	2015-09-15 00:00:00	\N	\N
2806	Molybdenum (Injectable)	19009896	Molybdenum	43558add-4c7e-4fe6-ad36-cdceaff99bfb	2011-10-17 00:00:00	\N	\N
2807	Mometasone (Implant)	905233	Mometasone	6befbf16-3f60-4ce8-94ec-5ce6a2b7f4e1	2015-01-02 00:00:00	\N	\N
2808	Mometasone (Topical)	905233	Mometasone	c337bce8-27e9-48fd-85fa-381d0242a36a	2015-06-16 00:00:00	\N	\N
2809	MONISTAT (Topical)	907879	Miconazole	cb161d23-bc41-4cec-9e42-dfeef861d161	2007-05-31 00:00:00	\N	\N
2810	MONISTAT (Vaginal)	907879	Miconazole	a0cb19fd-fd7e-4b19-9b35-092878dd52a7	2014-06-18 00:00:00	\N	\N
2811	MONISTAT SOOTHING CARE (Topical)	916662	dimethicone	07d7c883-1fa3-4786-905c-a1fab649765e	2014-04-09 00:00:00	\N	\N
2812	MONOCLATE-P (Injectable)	1352213	Factor VIII	d9c17023-cbff-4d95-8f44-ef842d59d938	2014-10-15 00:00:00	\N	\N
2813	Monofluorophosphate (Toothpaste)	19068715	monofluorophosphate	5c92500d-d151-44c9-9cea-81e89adae9dd	2015-09-28 00:00:00	\N	\N
2814	MONOKET (Oral Pill)	1383815	Isosorbide	d8f4202c-5103-40dc-9309-dcf72da02d0d	2014-10-07 00:00:00	\N	\N
2815	Montelukast (Chewable)	1154161	montelukast	09692f56-468c-4884-ae95-d2fb9d984e4c	2015-10-02 00:00:00	\N	\N
2816	Montelukast (Oral Granules)	1154161	montelukast	67070e4e-f755-46b3-b900-fcc1993a0546	2015-08-13 00:00:00	\N	\N
2817	Montelukast (Oral Pill)	1154161	montelukast	2f90a573-27fd-cc16-f3d1-8c4d630224a0	2015-10-01 00:00:00	\N	\N
2818	MORGIDOX (Oral Pill)	1738521	Doxycycline	d95bdf63-69a2-47b9-b909-97c74b6d7731	2011-05-19 00:00:00	\N	\N
2819	morphine (Injectable)	1110410	Morphine	ebb18761-e5c4-4238-bb84-f9549f500210	2015-08-17 00:00:00	\N	\N
2820	morphine (Oral Liquid)	1110410	Morphine	9740d1b2-d140-4959-a94b-843d4bf139c2	2014-02-06 00:00:00	\N	\N
2821	morphine (Oral Pill)	1110410	Morphine	67b3273e-af71-4dac-8e49-8bc134d4c591	2014-07-25 00:00:00	\N	\N
2822	morphine (Rectal)	1110410	Morphine	649d731b-962a-45df-b043-7e0781e8a530	2012-10-09 00:00:00	\N	\N
2823	Morphine Liposomal (Injectable)	19112635	Morphine Liposomal	cc8f105c-c8ee-4c57-86ee-ee6bf917cf78	2008-01-31 00:00:00	\N	\N
2824	morphine XR (Oral Pill)	1110410	Morphine	6c826b0a-ac87-48cc-a780-9a4a2118e8a8	2015-09-11 00:00:00	\N	\N
2825	morphine/Naltrexone XR (Oral Pill)	1110410	Morphine	dfe97a3d-247d-4dda-a641-1a95196cd8d8	2010-03-04 00:00:00	\N	\N
2826	MOTRIN (Oral Liquid)	1177480	Ibuprofen	f2609308-17bf-4bcb-84b2-d17f3fd35958	2012-07-11 00:00:00	\N	\N
2827	MOTRIN (Oral Pill)	1177480	Ibuprofen	5715910e-33be-49bd-8a1f-eeb46320e28d	2015-07-28 00:00:00	\N	\N
2828	MOTRIN PM (Oral Pill)	1129625	Diphenhydramine	55403f19-58ae-450b-8a7b-0bc544088f20	2013-12-20 00:00:00	\N	\N
2829	Mountain cedar pollen extract (Injectable)	40161989	mountain cedar pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2830	MOVANTIK (Oral Pill)	45774613	naloxegol	f49c6978-ca7b-4a66-919b-757f8f92ef64	2015-04-17 00:00:00	\N	\N
2831	MOXATAG XR (Oral Pill)	1713332	Amoxicillin	35e9aa4c-fd8d-4444-9d1a-62723ba29491	2015-06-19 00:00:00	\N	\N
2832	Moxifloxacin (Injectable)	1716903	moxifloxacin	a4e28b09-714b-46e7-b4e6-0163cad78fc5	2015-07-07 00:00:00	\N	\N
2833	Moxifloxacin (Ophthalmic)	1716903	moxifloxacin	750fd60e-c0c4-4f32-8301-6baa3516aef2	2014-10-22 00:00:00	\N	\N
2834	Moxifloxacin (Oral Pill)	1716903	moxifloxacin	fe9226f8-64f4-4eff-8339-ed3fce0896f2	2015-09-24 00:00:00	\N	\N
2835	MOZOBIL (Injectable)	19017581	Plerixafor	0ed08d2b-5051-46b2-aa37-1d6275bf9003	2015-08-10 00:00:00	\N	\N
2836	MS CONTIN XR (Oral Pill)	1110410	Morphine	989a17e2-b7fd-478c-a584-327d368247ce	2014-06-19 00:00:00	\N	\N
2837	MUCINEX (Oral Granules)	1163944	Guaifenesin	fd8a69aa-eb75-4e7a-8b6e-3361f810c578	2012-06-20 00:00:00	\N	\N
2838	MUCINEX (Oral Liquid)	1163944	Guaifenesin	99af22e4-35a2-4a98-ab38-22a649d5c356	2014-11-20 00:00:00	\N	\N
2839	MUCINEX CHILDREN'S COUGH (Oral Granules)	1119510	Dextromethorphan	a6617fb9-aee1-4f4b-8888-792338861564	2014-11-24 00:00:00	\N	\N
2840	MUCINEX COUGH (Oral Liquid)	1119510	Dextromethorphan	ce565113-e9e3-46de-84f7-3a432acb0e4b	2014-11-20 00:00:00	\N	\N
2841	MUCINEX NASAL SPRAY (Nasal)	925636	Oxymetazoline	2627d0a0-7382-4e90-ba00-911d3be11195	2012-01-10 00:00:00	\N	\N
2842	MUCINEX STUFFY NOSE & COLD (Oral Liquid)	1163944	Guaifenesin	8d0f2a01-f58b-43c0-b3f6-a88f9eb39c52	2013-10-31 00:00:00	\N	\N
2843	Mucor extract (Injectable)	40161334	Mucor extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
2844	Mulberry pollen extract (Injectable)	40172305	mulberry pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
2845	MULTAQ (Oral Pill)	40163615	dronedarone	236d4549-f44b-4677-b857-acedd10b9920	2011-12-30 00:00:00	\N	\N
2846	MULTITRACE-4 (Injectable)	19049877	chromic chloride	9f5b05b4-194d-4630-9218-3db8543b125b	2014-09-02 00:00:00	\N	\N
2847	Mupirocin (Nasal)	951511	Mupirocin	b5777cde-7cd5-4fc8-a5a1-0ef4ddf6b5b1	2013-03-22 00:00:00	\N	\N
2848	Mupirocin (Topical)	951511	Mupirocin	e2ddaea4-d914-4bc7-8913-351e7bf2e2f7	2015-09-15 00:00:00	\N	\N
2849	MURO 128 (Ophthalmic)	967823	Sodium Chloride	93fafa27-5031-4d95-b4b8-5574b7204ae2	2015-08-17 00:00:00	\N	\N
2850	Muromonab-CD3 (Injectable)	19051865	Muromonab-CD3	2a1f1c18-fa95-45e6-bd00-ac53c73f4747	2011-06-21 00:00:00	\N	\N
2851	MY WAY (Oral Pill)	1589505	Levonorgestrel	c749c15a-2c92-4db9-a6b9-fdf18da5b7da	2014-05-07 00:00:00	\N	\N
2852	MYALEPT (Injectable)	44814585	metreleptin	b6349e72-8bbb-40c6-ab31-89f7b1cce914	2014-07-09 00:00:00	\N	\N
2853	MYAMBUTOL (Oral Pill)	1749301	Ethambutol	92e486cf-3a07-4178-b4df-52226e0401e1	2014-12-09 00:00:00	\N	\N
2854	MYCAMINE (Injectable)	19018013	micafungin	bc234dd7-5221-4a68-b153-aa0393c75bbf	2014-12-01 00:00:00	\N	\N
2855	MYCELEX TROCHES (Oral Lozenge)	1000632	Clotrimazole	7464e883-6286-4f04-ae38-b7ddc3fec754	2006-09-18 00:00:00	\N	\N
2856	Mycophenolate mofetil (Oral Pill)	19003999	mycophenolate mofetil	085fa99c-8795-4abf-83cd-b0864f033d19	2015-10-01 00:00:00	\N	\N
2857	Mycophenolic Acid (Oral Pill)	19012565	Mycophenolic Acid	26b31126-4262-4a15-8a16-234c86763176	2015-03-03 00:00:00	\N	\N
2858	MYDRIACYL (Ophthalmic)	906072	Tropicamide	0d4f4a2e-eb00-4c65-b3fa-baf5738d468d	2011-08-24 00:00:00	\N	\N
2859	MYKROX (Oral Pill)	907013	Metolazone	dffb4544-0e47-40cd-9baa-d622075838cc	2006-08-21 00:00:00	\N	\N
2860	MYLERAN (Oral Pill)	1333357	Busulfan	bf456fc7-3a79-47f7-8acc-600b5e2f0dc2	2012-06-22 00:00:00	\N	\N
2861	MYOCHRYSINE (Injectable)	1152134	Aurothiomalate	a29045b5-ba4f-407a-a0fd-3ef7e1ce64ee	2010-07-20 00:00:00	\N	\N
2862	MYOFLEX (Topical)	943116	trolamine salicylate	94baa7ac-b84b-4ca7-ac4a-c915ad8bf2e3	2014-10-01 00:00:00	\N	\N
2863	MYTAB GAS (Chewable)	966991	Simethicone	7feddfe6-15a2-4049-8635-860e9b0d2f80	2012-12-03 00:00:00	\N	\N
2864	N'ICE (Oral Lozenge)	901656	Menthol	f8abfa42-896b-46c8-9d78-b9730f54d120	2010-10-09 00:00:00	\N	\N
2865	Nabilone (Oral Pill)	913440	nabilone	a7a2a4e1-9ecd-4e59-82b5-2068b5e50164	2015-05-15 00:00:00	\N	\N
2866	Nabumetone (Oral Pill)	1113648	nabumetone	b2ab77f7-4637-4977-8b4b-02ea01fee183	2015-08-31 00:00:00	\N	\N
2867	Nadolol (Oral Pill)	1313200	Nadolol	d208918b-a356-4924-91d9-9593981fe0a6	2015-07-15 00:00:00	\N	\N
2868	Nafcillin (Injectable)	1713930	Nafcillin	90717878-64cb-4ffc-90bc-7b4e81e3d1cd	2015-06-01 00:00:00	\N	\N
2869	Naftifine (Topical)	914053	naftifine	ee46c902-8a59-40f7-ac99-e96a8b981d60	2015-06-01 00:00:00	\N	\N
2870	NAFTIN (Topical)	914053	naftifine	e516fb5a-5c9b-4a74-9beb-423f2b345dde	2013-05-07 00:00:00	\N	\N
2871	NALFON (Oral Pill)	1153928	Fenoprofen	dfc2ab1e-0d75-4eff-9489-2afb51b02702	2012-09-12 00:00:00	\N	\N
2872	Naloxegol (Oral Pill)	45774613	naloxegol	f49c6978-ca7b-4a66-919b-757f8f92ef64	2015-04-17 00:00:00	\N	\N
2873	Naloxone (Injectable)	1114220	Naloxone	3ce7dbb4-3d14-43f0-80d6-0deb79a7aea6	2014-07-10 00:00:00	\N	\N
2874	Naloxone/Pentazocine (Oral Pill)	1114220	Naloxone	05a17f16-c982-4a54-80cd-079959ab49a7	2015-03-12 00:00:00	\N	\N
2875	Naltrexone (Oral Pill)	1714319	Naltrexone	81e25c6a-81b6-4cfb-91bf-be20c3ae546b	2015-08-14 00:00:00	\N	\N
2876	NAMENDA (Oral Liquid)	701322	Memantine	b9f27baf-aa2a-443a-9ef5-e002d23407ba	2013-11-04 00:00:00	\N	\N
2877	NAMENDA (Oral Pill)	701322	Memantine	1e3c74c9-0017-4d7a-a716-2b5366286a67	2015-02-18 00:00:00	\N	\N
2878	Nandrolone (Injectable)	1514412	Nandrolone	a586b484-1b46-40b9-9508-fd28002ad383	2007-02-16 00:00:00	\N	\N
2879	Naphazoline (Nasal)	914533	Naphazoline	ec2bb7d7-d014-46ed-a836-453e921da4c5	2010-10-09 00:00:00	\N	\N
2880	Naphazoline (Ophthalmic)	914533	Naphazoline	0f25812f-96ab-44f4-bacf-2eb012cbddc7	2015-03-20 00:00:00	\N	\N
2881	Naphazoline/Pheniramine (Ophthalmic)	914533	Naphazoline	78c5250c-b27c-4b1d-a4b8-571973ac3ae4	2015-07-17 00:00:00	\N	\N
2882	NAPHCON (Ophthalmic)	914533	Naphazoline	9951c888-4b6a-4c76-a9c1-dc3a0c777191	2008-03-13 00:00:00	\N	\N
2883	NAPHCON A (Ophthalmic)	914533	Naphazoline	b83701b9-9331-484f-8e84-6e241e621ff3	2015-06-22 00:00:00	\N	\N
2884	NAPROSYN (Oral Pill)	1115008	Naproxen	523b3f51-1d52-46ea-85a9-9d01cd29b4f8	2013-06-28 00:00:00	\N	\N
2885	Naproxen (Oral Pill)	1115008	Naproxen	a92bf444-0ae7-4365-831e-9fd37d59d5fa	2015-09-30 00:00:00	\N	\N
2886	Naratriptan (Oral Pill)	1118117	naratriptan	41c29652-32f8-48dc-9038-0e2195aa2084	2015-05-29 00:00:00	\N	\N
2887	NAROPIN (Injectable)	1136487	ropivacaine	56dfabf7-f7a8-4601-b17a-cb16fb995b0f	2014-06-17 00:00:00	\N	\N
2888	NASCOBAL (Nasal)	1308738	Vitamin B 12	ee2b4869-cd13-489b-b12f-1ce4fe081157	2007-05-24 00:00:00	\N	\N
2889	NASOPEN PE (Oral Liquid)	1135766	Phenylephrine	5e133352-255f-41cc-aacc-0508d634368d	2014-04-17 00:00:00	\N	\N
2890	NATACYN (Ophthalmic)	915392	Natamycin	d262661c-860d-482e-aa8d-3cf1f252b32a	2011-07-14 00:00:00	\N	\N
2891	Natamycin (Ophthalmic)	915392	Natamycin	d262661c-860d-482e-aa8d-3cf1f252b32a	2011-07-14 00:00:00	\N	\N
2892	Nateglinide (Oral Pill)	1502826	nateglinide	f7b28951-76d2-cabd-64a1-b74aa225c6e9	2015-06-05 00:00:00	\N	\N
2893	NATRECOR (Injectable)	1338985	Nesiritide	44c45bfe-461f-4398-8f20-ea771b2403ee	2014-02-14 00:00:00	\N	\N
2894	NATROBA (Shampoo)	40172543	spinosad	fa90ccc8-2df0-49f7-8878-2b33e34cd272	2015-05-28 00:00:00	\N	\N
2895	NATURE'S TEARS (Ophthalmic)	902251	hypromellose	3bb70d72-f763-4486-8f6a-d37ece21292b	2011-11-16 00:00:00	\N	\N
2896	NAUZENE (Chewable)	956691	Fructose	a60660b2-c5db-45a0-885f-de93e655380d	2015-06-08 00:00:00	\N	\N
2897	NAUZENE (Oral Liquid)	956691	Fructose	728376f5-6cab-404e-b519-f6c595291d6f	2010-10-09 00:00:00	\N	\N
2898	Nebivolol (Oral Pill)	1314577	nebivolol	673f5ad2-c09b-4a89-9407-efdadd007917	2015-05-04 00:00:00	\N	\N
2899	NEBUPENT (Inhalant)	1730370	Pentamidine	e2ad9d3c-b6c3-4f70-87e0-722a8ff94ccb	2011-02-23 00:00:00	\N	\N
2900	Nedocromil (Ophthalmic)	1114620	Nedocromil	2fe8d7ad-2158-4169-94b0-719ad20242b7	2013-01-18 00:00:00	\N	\N
2901	Nefazodone (Oral Pill)	714684	nefazodone	4afee435-ae60-4260-a1df-e52abf7a043d	2014-06-03 00:00:00	\N	\N
2902	Nelfinavir (Oral Pill)	1715472	Nelfinavir	84948e6a-971f-4e86-928e-7d32a1883a23	2013-03-28 00:00:00	\N	\N
2903	NEMBUTAL SODIUM (Injectable)	730729	Pentobarbital	5c380ab0-4386-48b6-80ab-ca594b23bc74	2012-08-10 00:00:00	\N	\N
2904	NEO-POLYCIN (Ophthalmic)	915175	Bacitracin	cf18b051-b656-4f46-8b69-a1df6f5d8d29	2015-01-09 00:00:00	\N	\N
2905	NEO-SYNALAR (Topical)	996541	fluocinolone	e96ae9cf-e829-466f-b66d-ede83b4d8b3d	2014-07-15 00:00:00	\N	\N
2906	NEO-SYNEPHRINE (Nasal)	1135766	Phenylephrine	03d3ecdf-782a-44d2-bd59-1b010552c4fb	2015-06-18 00:00:00	\N	\N
2907	NEOBENZ MICRO WASH (Soap)	918172	Benzoyl Peroxide	375bf717-5d70-457e-8b74-1f66f4f08b79	2010-07-20 00:00:00	\N	\N
2908	NEOCIDIN OINTMENT (Ophthalmic)	915175	Bacitracin	0ea2cee7-197e-405b-a7d4-f470a69a5178	2010-11-22 00:00:00	\N	\N
2909	NEOCIDIN SOLUTION (Ophthalmic)	963742	Gramicidin	b7aa0bae-255b-4792-a963-6606370a175f	2009-11-30 00:00:00	\N	\N
2910	Neomycin (Oral Liquid)	915981	Neomycin	aea1d3e4-604a-4680-91e2-cce6a128a1b5	2013-04-05 00:00:00	\N	\N
2911	Neomycin (Oral Pill)	915981	Neomycin	777dbfab-f83e-4738-ae1e-78619a9f82a7	2013-10-18 00:00:00	\N	\N
2912	Neomycin/Polymyxin B (Irrigation)	915981	Neomycin	1a9f81d8-277d-4f2c-39b0-412e01954f8a	2015-05-20 00:00:00	\N	\N
2913	Neomycin/Polymyxin B (Ophthalmic)	915981	Neomycin	7218af16-9378-472a-a033-4c9f9d5524db	2008-03-13 00:00:00	\N	\N
2914	Neomycin/Polymyxin B/Pramoxine (Topical)	915981	Neomycin	a325abf1-f239-4824-ba6c-cf1029ae1326	2015-09-25 00:00:00	\N	\N
2915	NEOSPORIN ECZEMA (Topical)	975125	Hydrocortisone	dc9e9509-c2d4-4480-bbaa-009fc5ccf9fc	2011-11-15 00:00:00	\N	\N
2916	NEOSPORIN G. U. IRRIGANT (Irrigation)	915981	Neomycin	1a9f81d8-277d-4f2c-39b0-412e01954f8a	2015-05-20 00:00:00	\N	\N
2917	NEOSPORIN MOISTURIZING (Topical)	986261	Colloidal oatmeal	5173b0c9-25b3-44e0-83a2-83079b5b0c03	2015-05-19 00:00:00	\N	\N
2918	NEOSPORIN NEO TO GO (Topical)	916460	Benzalkonium	a092b2ff-18fb-481a-a17d-984a91cbaec7	2013-07-12 00:00:00	\N	\N
2919	NEOSPORIN OINTMENT (Topical)	915175	Bacitracin	76d1c487-8974-4fe1-a874-d7313c960456	2011-09-09 00:00:00	\N	\N
2920	NEOSPORIN PLUS MAXIMUM STRENGTH (Topical)	915175	Bacitracin	fd3a35c9-428a-4136-9833-531413e9ec35	2012-12-17 00:00:00	\N	\N
2921	NEOSPORIN PLUS MAXIMUM STRENGTH CREAM (Topical)	915981	Neomycin	8398f0d1-cb06-4b69-ba16-b8073faed8e4	2013-07-12 00:00:00	\N	\N
2922	NEOSPORIN SOLUTION (Ophthalmic)	963742	Gramicidin	33e9b6d3-2b2b-4036-dd89-47177e23fcfe	2011-07-21 00:00:00	\N	\N
2923	Neostigmine (Injectable)	717136	Neostigmine	9dde8277-e2e8-4733-b18d-60124cde070e	2015-02-04 00:00:00	\N	\N
2924	NEOVA COMPLEX HQ PLUS (Topical)	976778	hydroquinone	dd3ce6f2-ed6e-448b-9924-bb1632a83c69	2014-01-03 00:00:00	\N	\N
2925	Nepafenac (Ophthalmic)	909795	nepafenac	4c9ae54a-97a0-4613-a092-31e86d9bfc91	2015-10-01 00:00:00	\N	\N
2926	NEPTAZANE (Oral Pill)	904250	Methazolamide	7731560b-dbe7-4912-814e-ef60629e5f07	2015-01-27 00:00:00	\N	\N
2927	NESACAINE (Injectable)	19049410	chloroprocaine	a844e68a-1462-40e4-be5e-f56214906eb9	2014-09-18 00:00:00	\N	\N
2928	NESINA (Oral Pill)	43013884	alogliptin	a3768c7e-aa4c-44d3-bc53-43bb7346c0b0	2015-09-11 00:00:00	\N	\N
2929	Nesiritide (Injectable)	1338985	Nesiritide	44c45bfe-461f-4398-8f20-ea771b2403ee	2014-02-14 00:00:00	\N	\N
2930	NEUAC (Topical)	918172	Benzoyl Peroxide	22109c02-910d-4bec-bd79-50e391634c38	2014-06-16 00:00:00	\N	\N
2931	NEURONTIN (Oral Pill)	797399	gabapentin	ea6016be-2f5d-4bd0-a228-fa8f455abeae	2013-02-01 00:00:00	\N	\N
2932	NEUTRAMAXX (Toothpaste)	19069022	Sodium Fluoride	fcbe6baa-2827-49df-9316-42cc86595203	2012-04-30 00:00:00	\N	\N
2933	NEUTRAPHOR (Topical)	916662	dimethicone	0f3a5ca3-c4bd-4496-bb62-816d1ed9f01f	2011-01-13 00:00:00	\N	\N
2934	NEUTRAPHORUS REX SKIN PROTECTANT (Topical)	916662	dimethicone	b43c4b7a-c176-4c36-a8cf-32cb6e99cc04	2012-12-05 00:00:00	\N	\N
2935	NEUTREXIN (Injectable)	1750928	Trimetrexate	ad0f8925-f817-4460-aa6b-172a043a440b	2006-09-18 00:00:00	\N	\N
2936	NEUTROGENA ACNE WASH OIL FREE (Soap)	964407	Salicylic Acid	cbdd144e-09fa-45e5-beb9-166e0654c013	2015-08-14 00:00:00	\N	\N
2937	NEUTROGENA RAPID CLEAR GEL (Topical)	964407	Salicylic Acid	38005d41-8ed7-4de5-afcb-cce1496c3811	2015-05-12 00:00:00	\N	\N
2938	NEUTROGENA T/GEL EXTRA STRENGTH (Shampoo)	1000995	Coal Tar	615d83a0-52a4-4365-aef3-320480c0b5cd	2012-04-04 00:00:00	\N	\N
2939	NEUTROGENA T/SAL (Shampoo)	964407	Salicylic Acid	c67a7d3f-1aff-4753-a64a-d06618e2ddda	2011-10-17 00:00:00	\N	\N
2940	NEVANAC (Ophthalmic)	909795	nepafenac	3ad48650-75e3-4c74-9302-01b0088f164e	2015-10-01 00:00:00	\N	\N
2941	Nevirapine (Oral Liquid)	1769389	Nevirapine	8dfe86aa-ea5d-48d2-94a8-1a5506055d70	2015-05-15 00:00:00	\N	\N
2942	Nevirapine (Oral Pill)	1769389	Nevirapine	4f065674-4719-4c79-ba0d-549040d77f17	2015-05-19 00:00:00	\N	\N
2943	NexIUM (Injectable)	904453	Esomeprazole	dce12085-d6c4-48a5-959b-e771c413c9c5	2012-04-18 00:00:00	\N	\N
2944	NexIUM (Oral Pill)	904453	Esomeprazole	b533b80b-2e68-4c5c-aaba-159d96a1b2f0	2015-04-30 00:00:00	\N	\N
2945	NEXT CHOICE ONE DOSE (Oral Pill)	1589505	Levonorgestrel	eb8c1837-d5e5-4ba2-a4b5-8c4f4be029cd	2014-05-12 00:00:00	\N	\N
2946	Niacin (Oral Pill)	1517824	Niacin	ce739d68-d89c-437c-90fb-3c0c45140f22	2013-03-18 00:00:00	\N	\N
2947	Niacin XR (Oral Pill)	1517824	Niacin	1bafcb0b-3564-4f3b-8ffb-d916d112fae9	2015-07-29 00:00:00	\N	\N
2948	NIACOR (Oral Pill)	1517824	Niacin	ce739d68-d89c-437c-90fb-3c0c45140f22	2013-03-18 00:00:00	\N	\N
2949	niCARdipine (Injectable)	1318137	Nicardipine	0a7c6372-a22b-4501-a6c6-539457a6cd9d	2015-09-17 00:00:00	\N	\N
2950	niCARdipine (Oral Pill)	1318137	Nicardipine	4a423bba-3bc1-4323-abbb-ef6c5c315784	2015-06-17 00:00:00	\N	\N
2951	NICAZEL (Oral Pill)	986790	Azelate	fc729ca5-3846-48fd-8d8c-d2b6a7563741	2014-10-17 00:00:00	\N	\N
2952	NICOMIDE (Oral Pill)	19073229	Cupric oxide	91d306d7-ef63-4f35-84a4-36e8469eac98	2013-10-18 00:00:00	\N	\N
2953	NICORELIEF (Chewable)	718583	Nicotine	50bdf838-436d-44eb-9fbd-7966ec436f36	2015-01-15 00:00:00	\N	\N
2954	NICORELIEF (Oral Lozenge)	718583	Nicotine	2025c71d-d752-4bea-bc4c-7beff1b63ff9	2012-08-06 00:00:00	\N	\N
2955	NICORETTE (Oral Lozenge)	718583	Nicotine	fdee1637-8049-4bc5-b196-b6d854c9f9f3	2014-11-18 00:00:00	\N	\N
2956	Nicotine (Chewable)	718583	Nicotine	020f4342-c821-4749-83eb-fbf330886acf	2015-09-21 00:00:00	\N	\N
2957	Nicotine (Inhalant)	718583	Nicotine	2d75cdad-0a7b-4297-80aa-7942ecaea30e	2011-08-22 00:00:00	\N	\N
2958	Nicotine (Oral Lozenge)	718583	Nicotine	17cf8f3d-6491-4cd8-a447-3c7533f76daf	2015-08-05 00:00:00	\N	\N
2959	NICOTROL (Inhalant)	718583	Nicotine	a887a129-fcb4-417e-80a5-38eca69dc74d	2011-08-22 00:00:00	\N	\N
2960	NIFEdipine (Oral Pill)	1318853	Nifedipine	776ccac6-471d-4c41-8c52-a8e90bd832c5	2015-08-05 00:00:00	\N	\N
2961	NILANDRON (Oral Pill)	1315286	nilutamide	a682f5ef-c79f-419e-94b6-b1a84b7b6651	2014-07-07 00:00:00	\N	\N
2962	Nilutamide (Oral Pill)	1315286	nilutamide	a682f5ef-c79f-419e-94b6-b1a84b7b6651	2014-07-07 00:00:00	\N	\N
2963	niMODipine (Oral Liquid)	1319133	Nimodipine	9e48dba7-c706-44fc-b04b-0fdcb2d72bc4	2014-05-20 00:00:00	\N	\N
2964	niMODipine (Oral Pill)	1319133	Nimodipine	26730ffb-7c80-4c54-bded-8e519bffe12f	2012-08-16 00:00:00	\N	\N
2965	NINJACOF (Oral Liquid)	1150886	chlophedianol	e2bca40f-9c27-ec8b-2ff0-ef9847ba2037	2014-12-08 00:00:00	\N	\N
2966	Nintedanib (Oral Pill)	45775396	nintedanib	da1c9f37-779e-4682-816f-93d0faa4cfc9	2014-11-05 00:00:00	\N	\N
2967	NIPENT (Injectable)	19031224	Pentostatin	151c6d2e-1af1-4c13-96ec-de3228c6efb3	2015-09-23 00:00:00	\N	\N
2968	NIRAVAM (Oral Disintegrating)	781039	Alprazolam	d956367b-fd7d-46fc-9533-38a6e02b0b59	2013-03-07 00:00:00	\N	\N
2969	Nitazoxanide (Oral Liquid)	1715315	nitazoxanide	56b1575a-dff4-4c5a-a159-2f858e7a0cb8	2013-11-26 00:00:00	\N	\N
2970	Nitazoxanide (Oral Pill)	1715315	nitazoxanide	56b1575a-dff4-4c5a-a159-2f858e7a0cb8	2013-11-26 00:00:00	\N	\N
2971	Nitisinone (Oral Pill)	1586640	nitisinone	5d449b73-d503-4132-b978-d890491975df	2014-06-11 00:00:00	\N	\N
2972	NITRO-BID (Topical)	1361711	Nitroglycerin	30934ddc-0823-4097-8699-d10988011d7c	2014-08-29 00:00:00	\N	\N
2973	Nitrofurantoin (Oral Liquid)	920293	Nitrofurantoin	11dcea9c-0c62-4153-976b-bd1f8ef1f6d9	2015-03-17 00:00:00	\N	\N
2974	Nitrofurantoin (Oral Pill)	920293	Nitrofurantoin	09d16de0-e11e-4ca1-8073-cc0bb0677aa9	2015-09-22 00:00:00	\N	\N
2975	Nitrofurazone (Topical)	920378	Nitrofurazone	2f25d07e-31ca-43a2-a8b6-622c1f122d25	2014-10-22 00:00:00	\N	\N
2976	Nitrogen (Inhalant)	19020477	Nitrogen	273511c2-2b84-4373-a0e5-3961eb19af8c	2015-08-20 00:00:00	\N	\N
2977	Nitrogen/Oxygen (Inhalant)	19020477	Nitrogen	4340fd9c-a7e7-4eb1-bd99-0927faeafe07	2010-07-20 00:00:00	\N	\N
2978	Nitroglycerin (Injectable)	1361711	Nitroglycerin	368a60fa-6cf0-4036-970e-e3a482f244ba	2015-06-22 00:00:00	\N	\N
2979	Nitroglycerin (Mucosal)	1361711	Nitroglycerin	de06a4da-ea70-441e-bba2-e40eb51a8c3a	2015-02-04 00:00:00	\N	\N
2980	Nitroglycerin (Rectal)	1361711	Nitroglycerin	603aa9ed-54c4-4a35-ade4-690fa44850e4	2014-10-23 00:00:00	\N	\N
2981	Nitroglycerin (Sublingual)	1361711	Nitroglycerin	79ba021e-183c-4b4d-822e-4ff5ef54ca61	2015-04-28 00:00:00	\N	\N
2982	Nitroglycerin (Topical)	1361711	Nitroglycerin	e464e9bb-48e8-4b9f-9fff-e220cfbac0c5	2014-08-29 00:00:00	\N	\N
2983	Nitroglycerin XR (Oral Pill)	1361711	Nitroglycerin	04fa3e36-e782-4b33-bc1d-a3ca0990f490	2014-07-08 00:00:00	\N	\N
2984	NITROLINGUAL (Mucosal)	1361711	Nitroglycerin	11cb2671-d3d5-425f-8509-f973b6cac876	2015-02-04 00:00:00	\N	\N
2985	NITROMIST (Mucosal)	1361711	Nitroglycerin	f9eb07a2-5ebc-40ea-9890-1a0b03e859ff	2007-05-17 00:00:00	\N	\N
2986	NITRONAL (Injectable)	1361711	Nitroglycerin	b82a7e93-d697-419a-8b02-dc05c5ab302e	2014-04-07 00:00:00	\N	\N
2987	NITROPRESS (Injectable)	19020994	Nitroprusside	bf27f0a9-e64b-492a-b08f-2448bf097988	2015-08-17 00:00:00	\N	\N
2988	Nitroprusside (Injectable)	19020994	Nitroprusside	6a44bcac-a0e1-4069-5691-db7b83dbb4b7	2015-08-17 00:00:00	\N	\N
2989	NITROSTAT (Sublingual)	1361711	Nitroglycerin	dcb552c1-310a-48af-81ad-a74530531dee	2015-04-28 00:00:00	\N	\N
2990	Nitrous Oxide (Inhalant)	19021129	Nitrous Oxide	571a0c51-076f-48a2-835c-b3ee9c7c98ed	2015-08-26 00:00:00	\N	\N
2991	NIX CREAM RINSE (Topical)	922868	Permethrin	9b44bf94-62c9-49d8-97ec-cf475824eb35	2013-11-15 00:00:00	\N	\N
2992	Nizatidine (Oral Pill)	950696	Nizatidine	9a148542-e478-422a-b8fb-88047c30534b	2015-08-31 00:00:00	\N	\N
2993	NIZORAL (Oral Pill)	985708	Ketoconazole	090660c1-6e6d-457f-adb5-046ddfcd1465	2014-03-11 00:00:00	\N	\N
2994	NIZORAL (Shampoo)	985708	Ketoconazole	efbc6388-90ce-11de-b92c-8b7156d89593	2013-11-12 00:00:00	\N	\N
2995	NO DOZ (Oral Pill)	1134439	Caffeine	7ef8b03c-245a-424f-bf75-438559c4418b	2013-12-13 00:00:00	\N	\N
2996	NODOLOR (Oral Pill)	1125315	Acetaminophen	08442901-bb74-4516-9574-86b3dfeeabb1	2013-05-15 00:00:00	\N	\N
2997	NOLVADEX (Oral Pill)	1436678	Tamoxifen	063fa789-4570-4715-c3bd-1bad0449fb26	2007-03-23 00:00:00	\N	\N
2998	Nonoxynol-9 (Vaginal)	969444	Nonoxynol-9	eaf86a36-0573-4c39-9324-88919c4d009b	2013-12-19 00:00:00	\N	\N
2999	NORCO (Oral Pill)	1125315	Acetaminophen	2f1c9e91-e5e7-4b07-8f56-e3719573ef23	2015-03-19 00:00:00	\N	\N
3000	Norepinephrine (Injectable)	1321341	Norepinephrine	d2b5320e-e6a6-4a43-8f3c-9c21195ceb4a	2015-07-02 00:00:00	\N	\N
3001	Norethindrone (Oral Pill)	1521369	Norethindrone	ac4ab968-c536-45d8-bb85-dc692afd7cee	2015-08-28 00:00:00	\N	\N
3002	NORFLEX (Injectable)	724394	Orphenadrine	8768cd6b-e79d-4b6d-8981-2f01ce28047b	2007-05-24 00:00:00	\N	\N
3003	NORGESIC (Oral Pill)	1112807	Aspirin	a7fa86b5-2154-4b17-9265-8a5411c88d5d	2015-08-17 00:00:00	\N	\N
3004	NORITATE (Topical)	1707164	Metronidazole	1787c491-d92c-4239-9d9f-6a91b629835d	2011-05-11 00:00:00	\N	\N
3005	NORLYROC (Oral Pill)	1521369	Norethindrone	97fcc28a-7e00-4ce4-9976-bcb90e3dba64	2014-04-15 00:00:00	\N	\N
3006	NORPACE (Oral Pill)	1335606	Disopyramide	f5e0c230-db38-4476-8357-9a227ccff1bc	2014-07-07 00:00:00	\N	\N
3007	NORTHERA (Oral Pill)	44814542	Droxidopa	2179f02c-48d7-48eb-8007-5ae43d8d16bc	2014-09-02 00:00:00	\N	\N
3008	Nortriptyline (Oral Liquid)	721724	Nortriptyline	ced93eb0-e8b6-44b8-9d2c-e2afa92500f7	2009-03-20 00:00:00	\N	\N
3009	Nortriptyline (Oral Pill)	721724	Nortriptyline	a203a396-f64b-4e2d-a57e-47ea7e83c3bf	2015-10-05 00:00:00	\N	\N
3010	NORVASC (Oral Pill)	1332418	Amlodipine	fb0bdb7f-1041-4c73-bdf9-02679b32c3ce	2013-03-05 00:00:00	\N	\N
3011	NORVIR (Oral Pill)	1748921	Ritonavir	624120b3-0a32-42a7-abfc-324e6b6c93df	2015-07-30 00:00:00	\N	\N
3012	NOSTRILLA (Nasal)	925636	Oxymetazoline	e16acd65-8163-4410-b645-db9bdee63b2d	2010-10-09 00:00:00	\N	\N
3013	NOTUSS PE (Oral Liquid)	1201620	Codeine	e2d73253-1777-4993-b693-323f0450c1c4	2010-10-09 00:00:00	\N	\N
3014	NOTUSS-NX (Oral Liquid)	990413	chlorcyclizine	3cd16900-fc6d-440a-9060-1f5c92c9fedf	2011-12-22 00:00:00	\N	\N
3015	NOVACORT (Topical)	975125	Hydrocortisone	c5b94bde-6982-48e5-ab68-13bb91d3d112	2015-03-10 00:00:00	\N	\N
3016	NOVAFERRUM IRON (Oral Liquid)	1300751	Polysaccharide iron complex	17cd83ec-8779-45f9-8c8d-0aaa8c7b9b42	2014-01-27 00:00:00	\N	\N
3017	NOVAFERRUM IRON (Oral Pill)	1300751	Polysaccharide iron complex	46abb133-711c-4219-ba6e-42cb64abf451	2013-11-04 00:00:00	\N	\N
3018	NOVOCAINE (Injectable)	751698	Procaine	999625d5-3a6b-4753-059a-4f19d04c85a5	2007-09-14 00:00:00	\N	\N
3019	NovoLIN (Injectable)	1596914	"NPH Insulin, Human"	508a2763-3cb7-4be5-9e53-544e84cd9b1f	2014-09-29 00:00:00	\N	\N
3020	NOVOLIN N (Injectable)	1596914	"NPH Insulin, Human"	99c995f1-522e-42aa-b45a-117e0af77d81	2014-09-29 00:00:00	\N	\N
3021	NOVOLIN R (Injectable)	1596977	"Regular Insulin, Human"	78dadbee-c3b6-4d62-a338-731b24cc7ef0	2014-10-31 00:00:00	\N	\N
3022	NovoLOG (Injectable)	1567198	"Insulin, Aspart, Human"	66472b3d-32c1-4803-aff4-b621aa5430b3	2014-09-29 00:00:00	\N	\N
3023	NOVOTHYROX (Oral Pill)	1501700	Thyroxine	b5c93ab1-317e-4f99-9ec5-e47b30faf650	2009-04-21 00:00:00	\N	\N
3024	NUCORT (Topical)	975125	Hydrocortisone	cc51030b-ece9-4b6e-9bf8-032a1e552711	2013-07-15 00:00:00	\N	\N
3025	NUCYNTA (Oral Liquid)	19026459	tapentadol	e921054f-b3f1-4624-8edd-f6628c6f0fd9	2014-11-26 00:00:00	\N	\N
3026	NUCYNTA (Oral Pill)	19026459	tapentadol	da748c7a-d2ae-1cbc-6f1a-8a6fc0402560	2014-03-14 00:00:00	\N	\N
3027	NULECIT (Injectable)	1399177	Sodium ferric gluconate complex	72153161-a533-4e90-b9b8-54090b8816be	2011-04-15 00:00:00	\N	\N
3028	NULEV (Oral Disintegrating)	923672	Hyoscyamine	ae2a78b2-b811-11e2-9e96-0800200c9a66	2013-05-15 00:00:00	\N	\N
3029	NULL	19018384	4-Aminobenzoic Acid	fe274cab-a945-4379-a92c-c8f18bd63c1e	2015-10-13 00:00:00	\N	\N
3030	NULOJIX (Injectable)	40239665	belatacept	c16ac648-d5d2-9f7d-8637-e2328572754e	2014-10-17 00:00:00	\N	\N
3031	NULYTELY (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	b630fb8f-b6aa-4b94-a93c-d79f1626c05b	2014-03-20 00:00:00	\N	\N
3032	NUPERCAINAL (Rectal)	923840	Dibucaine	bcf33951-d3a4-46c5-b208-56adc0011047	2013-07-01 00:00:00	\N	\N
3033	NUQUIN HP (Topical)	976778	hydroquinone	5d257efa-4287-4957-b409-004ea39ad17b	2014-11-25 00:00:00	\N	\N
3034	NUTRALOX (Chewable)	19035704	Calcium Carbonate	263e20ca-1ca6-4f7c-bae5-525a1184b744	2012-11-14 00:00:00	\N	\N
3035	NUTRESTORE (Oral Liquid)	19060985	Glutamine	cd3fb572-c5b1-43da-aea2-31208985f544	2014-07-21 00:00:00	\N	\N
3036	NUTROPIN (Injectable)	1584910	Somatropin	e6574a25-1ad5-4946-b750-501ce745574f	2012-03-07 00:00:00	\N	\N
3037	NUVIGIL (Oral Pill)	19090984	armodafinil	10f918f7-4782-470e-a50e-35c7c66bfd79	2013-05-02 00:00:00	\N	\N
3038	NYMALIZE (Oral Liquid)	1319133	Nimodipine	9e48dba7-c706-44fc-b04b-0fdcb2d72bc4	2014-05-20 00:00:00	\N	\N
3039	Nystatin (Oral Liquid)	922570	Nystatin	ba531b47-6a96-432b-ae01-6d8e18634463	2015-08-05 00:00:00	\N	\N
3040	Nystatin (Oral Pill)	922570	Nystatin	fc0cc939-3ad1-47f2-87b9-cdd91712e0db	2014-08-28 00:00:00	\N	\N
3041	Nystatin (Topical)	922570	Nystatin	bb68ae89-8a87-4ff7-a71b-f47ed4da1808	2015-09-29 00:00:00	\N	\N
3042	Nystatin/Triamcinolone (Topical)	922570	Nystatin	47b09171-bc17-4f32-a08e-6546bd48f78a	2014-11-26 00:00:00	\N	\N
3043	NYSTOP (Topical)	922570	Nystatin	e1b4622c-0f9f-4c00-b42c-2aa85a5e3d4f	2014-09-19 00:00:00	\N	\N
3044	NYTOL (Oral Pill)	1129625	Diphenhydramine	c81d018a-0170-4396-81e9-2e13a53f868a	2013-02-20 00:00:00	\N	\N
3045	OASIS TEARS (Ophthalmic)	961145	Glycerin	00071697-4ac6-4962-8eee-388b8b52bd40	2010-11-23 00:00:00	\N	\N
3046	Oat loose smut extract (Injectable)	40175872	oat loose smut extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3047	OBIZUR (Injectable)	1352213	Factor VIII	a69ccbb3-7648-4978-8c6d-7ca6b95a9b01	2014-11-05 00:00:00	\N	\N
3048	OC 8 ADULT ACNE (Topical)	918172	Benzoyl Peroxide	9d84b8f4-432b-44fa-9c4d-362615454fe6	2012-08-13 00:00:00	\N	\N
3049	OCTAGAM (Injectable)	19117912	Immunoglobulin G	810c8752-a7cb-0bce-777d-8539429773c2	2014-12-15 00:00:00	\N	\N
3050	Octreotide (Injectable)	1522957	Octreotide	5d3095a8-e5c7-4705-8c4f-9fca8afd5847	2015-06-01 00:00:00	\N	\N
3051	OCUFEN (Ophthalmic)	1156378	Flurbiprofen	5a4d5684-b20a-4fde-a808-404c7b9d25b3	2012-08-02 00:00:00	\N	\N
3052	OCUFLOX (Ophthalmic)	923081	Ofloxacin	7aab4449-3dda-4e2c-8e40-b3244a548bf5	2012-07-31 00:00:00	\N	\N
3053	OCUPRESS (Ophthalmic)	950370	Carteolol	5f82e53e-d6db-432f-af68-9de88d1b1720	2006-10-05 00:00:00	\N	\N
3054	OFEV (Oral Pill)	45775396	nintedanib	da1c9f37-779e-4682-816f-93d0faa4cfc9	2014-11-05 00:00:00	\N	\N
3055	Ofloxacin (Ophthalmic)	923081	Ofloxacin	7882f70e-d228-4c52-9390-0d927c51af1f	2015-08-17 00:00:00	\N	\N
3056	Ofloxacin (Oral Pill)	923081	Ofloxacin	1d19a6db-6da5-e7de-f929-2d18bdfa2cf5	2015-07-29 00:00:00	\N	\N
3057	Ofloxacin (Otic)	923081	Ofloxacin	75d8099b-4e08-43c0-811e-589d4fb52932	2015-09-28 00:00:00	\N	\N
3058	OLANZapine (Injectable)	785788	olanzapine	3b3bc948-161e-49ee-b67f-4bbb63af23d6	2015-10-01 00:00:00	\N	\N
3059	OLANZapine (Oral Disintegrating)	785788	olanzapine	35b52ceb-5c07-49c5-9b1d-4708db66eaff	2015-10-05 00:00:00	\N	\N
3060	OLANZapine (Oral Pill)	785788	olanzapine	3347d1c8-04c9-5ce1-8cda-b38e0412b709	2015-10-01 00:00:00	\N	\N
3061	Olmesartan (Oral Pill)	40226742	olmesartan	ae3e0a4e-3a0c-4589-adb0-8fc3a5510f5b	2014-08-20 00:00:00	\N	\N
3062	Olopatadine (Ophthalmic)	915855	olopatadine	ae8b4a9d-4308-4a3c-8ec9-1e8d9060db68	2015-09-15 00:00:00	\N	\N
3063	Olsalazine (Oral Pill)	916282	olsalazine	75a96561-6f52-4c11-a105-391fbbfe4827	2007-10-10 00:00:00	\N	\N
3064	OLUX (Topical)	998415	Clobetasol	6a53f8c0-458b-4f5d-9679-ccf667461613	2015-09-21 00:00:00	\N	\N
3065	Omacetaxine mepesuccinate (Injectable)	19069046	omacetaxine mepesuccinate	83a504ef-cf92-467d-9ecf-d251194a3484	2014-05-16 00:00:00	\N	\N
3066	Omega-3 Acid Ethyl Esters (USP) (Oral Pill)	1560305	Omega-3 Acid Ethyl Esters (USP)	5fe15bdb-f59f-4b87-8e5d-8a3d5683eb3d	2015-09-02 00:00:00	\N	\N
3067	Omeprazole (Oral Pill)	923645	Omeprazole	54394aec-a36b-427f-9be4-76e3768595c6	2015-10-02 00:00:00	\N	\N
3068	Omeprazole/Sodium Bicarbonate (Oral Pill)	923645	Omeprazole	c43b7c1e-1eb6-48b4-ba73-56e274239ae2	2015-01-06 00:00:00	\N	\N
3069	OMNI GEL (Oral Gel)	1036094	Stannous Fluoride	0f1afc36-f699-4072-b90b-c9f5be989a49	2011-08-18 00:00:00	\N	\N
3070	OMNIPRED (Ophthalmic)	1550557	prednisolone	4bbb4356-b4b3-4497-a3a3-8f4b65d326fe	2011-07-29 00:00:00	\N	\N
3071	OMTRYG (Oral Pill)	1560305	Omega-3 Acid Ethyl Esters (USP)	5fe15bdb-f59f-4b87-8e5d-8a3d5683eb3d	2015-09-01 00:00:00	\N	\N
3072	ONCASPAR (Injectable)	1326481	pegaspargase	d046ec54-9ac8-4c9f-87a7-69e9900d8016	2008-08-08 00:00:00	\N	\N
3073	Ondansetron (Injectable)	1000560	Ondansetron	e0050959-c14c-41b6-9a92-fadc5f6feff3	2015-07-14 00:00:00	\N	\N
3074	Ondansetron (Oral Disintegrating)	1000560	Ondansetron	e5950fac-27c8-49b8-81d5-046ec065621b	2015-09-23 00:00:00	\N	\N
3075	Ondansetron (Oral Liquid)	1000560	Ondansetron	38435346-d505-4bdd-bbc6-a7bcba411033	2015-03-27 00:00:00	\N	\N
3076	Ondansetron (Oral Pill)	1000560	Ondansetron	2c94fed2-f880-44a9-8d10-93fa5713dcb4	2015-09-14 00:00:00	\N	\N
3077	Ondansetron (Oral Strip)	1000560	Ondansetron	ed036bdb-b832-440f-82c7-ade2956b73ee	2015-07-17 00:00:00	\N	\N
3078	ONE TOUCH REFORMULATED APR 2009 (Topical)	917006	Benzocaine	a75b6e20-a180-4a8d-be08-de54812c4f5e	2011-12-01 00:00:00	\N	\N
3079	Oneseed juniper pollen extract (Injectable)	40172384	oneseed juniper pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3080	ONGLYZA (Oral Pill)	40166035	saxagliptin	ba48ac4b-9503-4006-f6e2-3b8a83059c03	2015-09-10 00:00:00	\N	\N
3081	ONMEL (Oral Pill)	1703653	Itraconazole	fb8a2e5b-fd23-4977-81de-a95f4af168e2	2013-01-08 00:00:00	\N	\N
3082	ONTAK (Injectable)	19051642	denileukin diftitox	42dfffb1-d0f3-42d5-944c-64f092fc436e	2013-03-26 00:00:00	\N	\N
3083	OPANA (Oral Pill)	1125765	Oxymorphone	9be700c1-937a-180d-fb38-bc2aa85d20cf	2012-10-18 00:00:00	\N	\N
3084	OPCON-A (Ophthalmic)	914533	Naphazoline	90a05c13-5b87-415b-9892-10d2edbc1943	2015-01-28 00:00:00	\N	\N
3085	Opium (Oral Liquid)	923829	Opium	3ad95865-a77c-41da-b572-e5c0bb404c79	2015-08-12 00:00:00	\N	\N
3086	OPSUMIT (Oral Pill)	44507580	Macitentan	1e484a50-55db-4b85-8c57-6cd1b0353abd	2015-05-20 00:00:00	\N	\N
3087	OPTIVAR (Ophthalmic)	934075	azelastine	f4b9597c-5b50-4889-be41-20bd1f13aaa5	2014-04-28 00:00:00	\N	\N
3088	ORABASE (Oral Paste)	917006	Benzocaine	387f52e1-157a-4b9e-8f98-9001c6880786	2013-02-26 00:00:00	\N	\N
3089	ORACEA (Oral Pill)	1738521	Doxycycline	4e954825-3f60-4dbb-a1be-b146fe1acae4	2010-02-12 00:00:00	\N	\N
3090	ORACIT (Oral Liquid)	950435	Citric Acid	bc26abed-8e6e-475d-8ab3-abf7d0377003	2012-10-02 00:00:00	\N	\N
3091	ORAJEL (Mucosal)	917006	Benzocaine	707d27da-731c-4726-9c77-63fcc071d09d	2013-12-02 00:00:00	\N	\N
3092	ORAJEL (Oral Gel)	917006	Benzocaine	574c7911-e24b-4b52-b01f-df89d58fd505	2012-04-20 00:00:00	\N	\N
3093	ORAJEL (Topical)	917006	Benzocaine	8c2e436a-9d32-4dd5-ba5f-712bc39d36c4	2012-04-20 00:00:00	\N	\N
3094	ORAJEL BLEEDING GUM RINSE (Mucosal)	989301	Cetylpyridinium	48b1f5b8-69b1-4d50-960b-733151beef91	2010-10-09 00:00:00	\N	\N
3095	ORAJEL DRY MOUTH (Oral Gel)	961145	Glycerin	0d371e48-d722-4b77-b354-5a44179247bc	2010-10-09 00:00:00	\N	\N
3096	ORAJEL MOUTH SORE RINSE (Mucosal)	1776430	Hydrogen Peroxide	f82230e0-a6eb-4d1e-8fea-0bf386d97c58	2010-10-09 00:00:00	\N	\N
3097	ORAJEL ULTRA (Oral Gel)	917006	Benzocaine	c7936cbc-b132-4025-8439-8227b928c2fd	2013-07-31 00:00:00	\N	\N
3098	ORAL B ANTI-CAVITY (Mouthwash)	19069022	Sodium Fluoride	d8336ad5-d1fb-4290-9433-d852405d1409	2010-10-09 00:00:00	\N	\N
3099	ORALONE (Oral Paste)	903963	Triamcinolone	ac1e2116-795e-4c20-974d-11fa07cf0fa7	2010-10-15 00:00:00	\N	\N
3100	Orange pollen extract (Injectable)	40172688	orange pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3101	ORAP (Oral Pill)	745790	Pimozide	90c0086a-b62c-4cdd-a6af-2efed69cfd4d	2014-11-03 00:00:00	\N	\N
3102	ORAPRED (Oral Disintegrating)	1550557	prednisolone	1e379543-c4cf-4e72-953b-db15b7f0c2a1	2014-01-22 00:00:00	\N	\N
3103	ORAQIX (Mucosal)	989878	Lidocaine	b501d239-923b-48b2-82ed-6c5c253a67e2	2012-08-23 00:00:00	\N	\N
3104	ORASEP REFORMULATED DEC 2013 (Mucosal)	917006	Benzocaine	ed70911b-9da8-4e1d-97fa-66b18d28516a	2012-04-05 00:00:00	\N	\N
3105	ORAVERSE (Injectable)	1335539	Phentolamine	38be9414-87c4-4a8a-9f17-99be0d0a33fa	2011-06-02 00:00:00	\N	\N
3106	ORAVIG (Buccal)	907879	Miconazole	a1bf6bf0-9197-4fc1-af9f-df7b9a1ad6ce	2015-06-26 00:00:00	\N	\N
3107	ORBACTIV (Injectable)	45776147	oritavancin	085d6d1a-21c2-11e4-8c21-0800200c9a66	2014-09-10 00:00:00	\N	\N
3108	ORBIVAN (Oral Pill)	1125315	Acetaminophen	d3c69436-a681-4e00-8db0-8cbfaac9627e	2010-04-23 00:00:00	\N	\N
3109	Orchard grass pollen extract (Injectable)	40161896	orchard grass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3110	Oregon ash pollen extract (Injectable)	40173249	Oregon ash pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3111	ORFADIN (Oral Pill)	1586640	nitisinone	5d449b73-d503-4132-b978-d890491975df	2014-06-11 00:00:00	\N	\N
3112	ORIS (Mouthwash)	1790812	Chlorhexidine	8d90c38e-e241-4f73-877d-ff314408a510	2015-05-28 00:00:00	\N	\N
3113	Oritavancin (Injectable)	45776147	oritavancin	085d6d1a-21c2-11e4-8c21-0800200c9a66	2014-09-10 00:00:00	\N	\N
3114	Orlistat (Oral Pill)	741530	orlistat	a9c47f08-bd02-4731-aaf7-42173155b2d0	2015-08-21 00:00:00	\N	\N
3115	Orphenadrine (Injectable)	724394	Orphenadrine	8768cd6b-e79d-4b6d-8981-2f01ce28047b	2011-10-03 00:00:00	\N	\N
3116	ORTHO-NESIC (Topical)	938205	Camphor	52db0aec-be7c-4342-a414-60f594f57b3c	2011-03-23 00:00:00	\N	\N
3117	ORTHOCLONE OKT3 (Injectable)	19051865	Muromonab-CD3	2a1f1c18-fa95-45e6-bd00-ac53c73f4747	2011-06-21 00:00:00	\N	\N
3118	ORTHOWASH (Mouthwash)	19069022	Sodium Fluoride	37d407ae-d5b1-4c67-8894-1d419ae36c69	2011-10-11 00:00:00	\N	\N
3119	OSCIMIN (Oral Pill)	923672	Hyoscyamine	8504adad-f6d0-4671-b655-4b62bf29a516	2014-07-25 00:00:00	\N	\N
3120	Oseltamivir (Oral Liquid)	1799139	Oseltamivir	03a2a7f0-406c-4784-84c1-5fd5f5be4773	2012-04-11 00:00:00	\N	\N
3121	Oseltamivir (Oral Pill)	1799139	Oseltamivir	1948cafd-b5b3-4212-9d5d-8c293b1baad5	2013-05-14 00:00:00	\N	\N
3122	OSENI (Oral Pill)	43013884	alogliptin	4c619ed9-fe3e-4158-9938-80c6c3493d55	2015-09-21 00:00:00	\N	\N
3123	OSMITROL (Injectable)	994058	Mannitol	0d914965-7001-45cb-ba51-d7c5964b05bc	2014-10-27 00:00:00	\N	\N
3124	OSMOPREP (Oral Pill)	939871	sodium phosphate	983ce15f-cd37-4f3a-9e51-205860e80976	2010-08-24 00:00:00	\N	\N
3125	OTOZIN (Otic)	1036059	Antipyrine	cd77f88e-8714-45ca-a385-1ca75b8c94bb	2011-05-10 00:00:00	\N	\N
3126	OVACE (Shampoo)	1036252	Sulfacetamide	6a034465-e600-49cb-91bd-7b9ceee6ffc6	2012-10-04 00:00:00	\N	\N
3127	OVACE (Soap)	1036252	Sulfacetamide	a77aed6c-355f-44ed-ae95-78b4d1549c2b	2014-01-31 00:00:00	\N	\N
3128	OVACE (Topical)	1036252	Sulfacetamide	06876575-edf2-4844-8f20-3eb6e74ccc8e	2015-10-02 00:00:00	\N	\N
3129	OVIDE (Topical)	993979	Malathion	2024030e-b00d-4fcc-b51d-45dc86933749	2012-01-11 00:00:00	\N	\N
3130	Oxacillin (Injectable)	1724703	Oxacillin	f3bee4d7-82d8-4e2d-8fc8-4446e6fbf999	2015-03-04 00:00:00	\N	\N
3131	Oxaliplatin (Injectable)	1318011	oxaliplatin	d9400bde-4da8-49c8-a61e-15d2be58e73d	2015-09-28 00:00:00	\N	\N
3132	OXANDRIN (Oral Pill)	1524769	Oxandrolone	f622616e-4c11-4149-bf00-5ea5ce97800b	2007-05-17 00:00:00	\N	\N
3133	Oxandrolone (Oral Pill)	1524769	Oxandrolone	8e6af85f-e44e-4c47-8a1a-7c5cb7893167	2015-09-09 00:00:00	\N	\N
3134	Oxaprozin (Oral Pill)	1118045	oxaprozin	755ca241-0d01-41ba-a735-e37365352a71	2015-03-31 00:00:00	\N	\N
3135	Oxazepam (Oral Pill)	724816	Oxazepam	52488349-1c84-4cdc-89d1-c841a68e904f	2014-06-16 00:00:00	\N	\N
3136	OXcarbazepine (Oral Liquid)	718122	oxcarbazepine	ca6bfbbb-fcca-4c15-a160-ee5791ed2f6e	2015-02-17 00:00:00	\N	\N
3137	OXcarbazepine (Oral Pill)	718122	oxcarbazepine	d9741f36-0abd-49b7-9f43-e9700663122b	2015-09-28 00:00:00	\N	\N
3138	OXECTA (Oral Pill)	1124957	Oxycodone	dd9f9d6d-9a59-4f74-8fe7-685e0c3c5fd4	2014-01-22 00:00:00	\N	\N
3139	Oxiconazole (Topical)	918222	oxiconazole	094d5b1e-ccf6-4384-b208-fd70360ffda2	2009-12-22 00:00:00	\N	\N
3140	OXISTAT (Topical)	918222	oxiconazole	094d5b1e-ccf6-4384-b208-fd70360ffda2	2009-12-22 00:00:00	\N	\N
3141	OXSORALEN-ULTRA (Oral Pill)	905223	Methoxsalen	ae951dc4-9031-43bf-943c-cb2366951f23	2015-03-05 00:00:00	\N	\N
3142	OXY (Topical)	918172	Benzoyl Peroxide	9f408142-dc98-4cd9-9060-64c42984ee9a	2013-01-22 00:00:00	\N	\N
3143	OXY CLEAN (Topical)	964407	Salicylic Acid	c1086120-8eb3-4ba6-ac8e-ae868ddc27a7	2015-09-08 00:00:00	\N	\N
3144	OXY DAILY WASH (Soap)	918172	Benzoyl Peroxide	89cdc287-e374-4254-b867-97e9f9b6bdd1	2015-09-03 00:00:00	\N	\N
3145	OXY FACE SCRUB (Soap)	964407	Salicylic Acid	4cc02e46-bfae-4f53-8aa4-4662a32339f9	2015-09-03 00:00:00	\N	\N
3146	Oxybutynin (Oral Liquid)	918906	oxybutynin	17d61203-a462-4393-b261-72bf48d51942	2015-03-13 00:00:00	\N	\N
3147	Oxybutynin (Oral Pill)	918906	oxybutynin	b15f1a2c-dcae-4c3e-923f-ec81078ba3c4	2015-08-19 00:00:00	\N	\N
3148	Oxybutynin (Topical)	918906	oxybutynin	c6754623-b14c-4fc3-8719-48eee3119156	2015-07-27 00:00:00	\N	\N
3149	oxyCODONE (Oral Liquid)	1124957	Oxycodone	73eb3e1f-7706-4688-9e75-1050b4a8a533	2015-08-31 00:00:00	\N	\N
3150	oxyCODONE (Oral Pill)	1124957	Oxycodone	3efb2cf8-9b0e-4d76-afb1-c4ecd514d534	2015-09-29 00:00:00	\N	\N
3151	Oxygen (Inhalant)	19025274	Oxygen	dfcc57ba-4b9f-458c-9b8a-7ab4f3e68eb2	2015-09-22 00:00:00	\N	\N
3152	Oxymetazoline (Nasal)	925636	Oxymetazoline	46256806-7d8e-4e97-906e-ae5c41b3b7e2	2015-10-01 00:00:00	\N	\N
3153	Oxymetholone (Oral Pill)	1525741	Oxymetholone	4b9c6c34-9cb2-4d70-b70e-c7ce2fda4212	2012-10-16 00:00:00	\N	\N
3154	Oxymorphone (Oral Pill)	1125765	Oxymorphone	2c4b8fab-3112-43a0-994a-591e5089f619	2015-03-20 00:00:00	\N	\N
3155	Oxytetracycline (Oral Pill)	925952	Oxytetracycline	d30ffe60-a418-4425-883e-58d10417b9bf	2014-09-09 00:00:00	\N	\N
3156	Oxytocin (Injectable)	1326115	Oxytocin	c7fd585a-99b7-4309-b003-a6cbef05372c	2015-02-26 00:00:00	\N	\N
3157	P-Aminohippurate (Injectable)	19053177	p-Aminohippurate	a1975215-25f1-4c5a-878d-bcbf5326bb92	2011-01-25 00:00:00	\N	\N
3158	P-Hydroxyamphetamine/Tropicamide (Ophthalmic)	19026274	p-Hydroxyamphetamine	da8a8a19-ac1b-4160-aac4-c4c57598eb5d	2012-08-31 00:00:00	\N	\N
3159	PACERONE (Oral Pill)	1309944	Amiodarone	a13a7632-74ea-4e2f-b791-190a4765c295	2014-05-01 00:00:00	\N	\N
3160	PACNEX (Soap)	918172	Benzoyl Peroxide	764ef37b-7ead-4a64-89eb-67321320138f	2010-07-20 00:00:00	\N	\N
3161	Paecilomyces variotii extract (Injectable)	40175309	Paecilomyces variotii extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3162	Pale dock pollen extract (Injectable)	42709315	pale dock pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
3163	Palonosetron (Oral Pill)	911354	palonosetron	bd06f321-bb42-4748-92f3-d59626b540e0	2014-11-17 00:00:00	\N	\N
3164	Pamabrom (Oral Pill)	1172206	pamabrom	22122002-c367-480b-b9f5-0504f918cc98	2015-08-07 00:00:00	\N	\N
3165	Pamidronate (Injectable)	1511646	pamidronate	ad1b83f9-ddf7-44b7-9234-77d6872e4825	2015-07-10 00:00:00	\N	\N
3166	PAMINE (Oral Pill)	1158632	Methscopolamine	2981e734-2a20-4b45-8521-8c13ff2b6578	2012-09-19 00:00:00	\N	\N
3167	PAMINE FORTE (Oral Pill)	1158632	Methscopolamine	2981e734-2a20-4b45-8521-8c13ff2b6578	2012-09-19 00:00:00	\N	\N
3168	PAMPRIN CRAMP FORMULA (Oral Pill)	1125315	Acetaminophen	5f2e9d2a-4c7b-4339-8be7-3711a73fdbe9	2012-06-26 00:00:00	\N	\N
3169	PAMPRIN MAX FORMULA (Oral Pill)	1125315	Acetaminophen	109f5b3f-689a-4ca4-a621-bf5c2d41d7af	2012-06-26 00:00:00	\N	\N
3170	PAMPRIN MULTI-SYMPTOM (Oral Pill)	1125315	Acetaminophen	169704f1-3953-4857-93d0-ddca3359356d	2012-06-19 00:00:00	\N	\N
3171	PANADOL (Oral Pill)	1125315	Acetaminophen	62920a3f-c662-4db2-a4aa-8170a23ed3b6	2015-07-21 00:00:00	\N	\N
3172	PANCREAZE (Oral Pill)	919204	Amylases	e1431edd-0fc5-4ebc-8c10-53deb0db0d23	2013-12-20 00:00:00	\N	\N
3173	Pancuronium (Injectable)	19026674	Pancuronium	a95893be-9df7-4f3e-ad72-3298dab8b187	2012-10-24 00:00:00	\N	\N
3174	PANDEL (Topical)	975125	Hydrocortisone	361338e6-d719-4bea-aca0-7dd591fcfa08	2015-07-15 00:00:00	\N	\N
3175	PANOXYL (Soap)	918172	Benzoyl Peroxide	41aac3a5-ce01-435f-948a-668e68802bb9	2014-02-05 00:00:00	\N	\N
3176	PANRETIN (Topical)	941052	alitretinoin	9cf04dad-e312-4b8f-a297-1e002d43e151	2006-11-14 00:00:00	\N	\N
3177	Pantoprazole (Injectable)	948078	pantoprazole	5b5ddedd-d429-41a7-8573-10c3e9ad4e52	2015-09-17 00:00:00	\N	\N
3178	Pantoprazole (Oral Granules)	948078	pantoprazole	189b7b6a-9717-44eb-b87b-fd3e985b2268	2015-09-02 00:00:00	\N	\N
3179	Pantoprazole (Oral Pill)	948078	pantoprazole	d132d29d-723e-4357-87f2-0d760afa50a4	2015-09-23 00:00:00	\N	\N
3180	Papaverine (Injectable)	1326901	Papaverine	9e5e2ce4-7a57-4c61-a826-64c8d11d038e	2011-08-30 00:00:00	\N	\N
3181	Paper birch pollen extract (Injectable)	40172798	paper birch pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3182	Para grass pollen extract (Injectable)	40170840	para grass pollen extract	34c8c68c-9a78-42ea-89f8-cac82981881e	2010-01-07 00:00:00	\N	\N
3183	PARAFON FORTE DSC (Oral Pill)	795113	Chlorzoxazone	a8d84a0a-aa31-4ebe-bdf8-5b09b2df69a9	2015-05-20 00:00:00	\N	\N
3184	PARCOPA (Oral Disintegrating)	740560	Carbidopa	dcb0fb25-ad60-4ab6-bc0f-ebc356357d93	2013-02-14 00:00:00	\N	\N
3241	PENNSAID (Topical)	1124300	Diclofenac	4732a181-9fe0-49b4-b486-e2da9ad66e31	2015-01-02 00:00:00	\N	\N
3185	PAREMYD (Ophthalmic)	19026274	p-Hydroxyamphetamine	da8a8a19-ac1b-4160-aac4-c4c57598eb5d	2012-08-31 00:00:00	\N	\N
3186	Paricalcitol (Injectable)	1517740	paricalcitol	b2e4eaa9-bf4d-4fe8-ab2e-d2b1a3a555ca	2015-08-10 00:00:00	\N	\N
3187	Paricalcitol (Oral Pill)	1517740	paricalcitol	ac3028be-d563-4b0c-86d3-5a7e1c92758c	2015-04-06 00:00:00	\N	\N
3188	PARLODEL (Oral Pill)	730548	Bromocriptine	fc2a08dd-4fb6-4ac4-9082-f99552fae25c	2014-06-20 00:00:00	\N	\N
3189	PARNATE (Oral Pill)	703470	Tranylcypromine	2e7350bd-ab32-4619-a3f9-12fdf56fc5e2	2013-01-15 00:00:00	\N	\N
3190	PAROEX (Mouthwash)	1790812	Chlorhexidine	4e137308-6a21-4bf9-802f-23ff78ee6797	2014-10-31 00:00:00	\N	\N
3191	Paromomycin (Oral Pill)	1727443	Paromomycin	cc0f4113-e627-4caf-b2d4-95b4106e57f5	2014-01-17 00:00:00	\N	\N
3192	PARoxetine (Oral Liquid)	722031	Paroxetine	584ace29-6e40-432f-950f-ab7e98653d32	2014-07-29 00:00:00	\N	\N
3193	PARoxetine (Oral Pill)	722031	Paroxetine	fce8fb27-554b-43e2-8ec9-fc4ca0b0ab8b	2015-09-08 00:00:00	\N	\N
3194	PARoxetine XR (Oral Pill)	722031	Paroxetine	21b3b8a2-bfed-4945-954d-6a42ea61888f	2013-10-22 00:00:00	\N	\N
3195	PASER D/R (Oral Granules)	1726228	aminosalicylic acid	6f2753dc-5f0c-4f49-9335-e519afb69ba6	2010-06-18 00:00:00	\N	\N
3196	Pasireotide (Injectable)	43012417	pasireotide	442f0d9d-5c7d-4b81-b329-d71be8cf2be2	2015-03-31 00:00:00	\N	\N
3197	Passalora fulva extract (Injectable)	40176152	Passalora fulva extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3198	PATADAY (Ophthalmic)	915855	olopatadine	ee6e2161-789b-4ba0-b234-d4b36fe41c94	2015-09-15 00:00:00	\N	\N
3199	PATANOL (Ophthalmic)	915855	olopatadine	ae8b4a9d-4308-4a3c-8ec9-1e8d9060db68	2011-09-20 00:00:00	\N	\N
3200	PAXIL (Oral Liquid)	722031	Paroxetine	584ace29-6e40-432f-950f-ab7e98653d32	2014-07-29 00:00:00	\N	\N
3201	PAXIL (Oral Pill)	722031	Paroxetine	584ace29-6e40-432f-950f-ab7e98653d32	2014-07-29 00:00:00	\N	\N
3202	PAXIL XR (Oral Pill)	722031	Paroxetine	a73cf8ee-f99b-4972-8939-0d394a527134	2013-10-22 00:00:00	\N	\N
3203	PAZOL XS (Shampoo)	1000995	Coal Tar	ec7873bb-288a-4671-b649-1d5d5ced6476	2011-07-01 00:00:00	\N	\N
3204	PCE (Oral Pill)	1746940	Erythromycin	28a270f4-f713-4d88-b83a-f5b5e9b26746	2014-01-24 00:00:00	\N	\N
3205	PCXX NEUTRAL FOAM (Oral Foam)	19069022	Sodium Fluoride	9f9f36e7-ec66-473d-af17-09d4b492ded5	2014-06-06 00:00:00	\N	\N
3206	Pecan pollen extract (Injectable)	40161960	pecan pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-11-24 00:00:00	\N	\N
3207	Pecan pollen extract/White hickory pollen extract (Injectable)	40161960	pecan pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3208	Pectin (Oral Lozenge)	922191	pectin	9d04885b-d866-4eb3-8685-420d0464d004	2015-03-19 00:00:00	\N	\N
3209	PEDIA-LAX CHEWABLE (Chewable)	992956	Magnesium Hydroxide	975f24d8-218c-40f4-84a5-558acf34329d	2012-05-09 00:00:00	\N	\N
3210	PEDIA-LAX LIQUID GLYCERIN SUPPOSITORIES (Rectal)	961145	Glycerin	9edbb46d-0b50-42e9-b9bb-c78bb10aaba3	2012-11-21 00:00:00	\N	\N
3211	PEDIACARE CHILDREN'S 24-HR ALLERGY (Oral Liquid)	1149196	Cetirizine	6855116e-ba31-4373-a410-256c38519330	2015-04-24 00:00:00	\N	\N
3212	PEDIACARE CHILDREN'S ALLERGY (Oral Liquid)	1129625	Diphenhydramine	eff380b3-0bbf-431b-bbd1-354c05c6deb2	2011-01-18 00:00:00	\N	\N
3213	PEDIACARE CHILDREN'S ALLERGY & COLD (Oral Liquid)	1129625	Diphenhydramine	e349f954-c331-4493-ae0b-543af66bd1ae	2010-10-09 00:00:00	\N	\N
3214	PEDIACARE CHILDREN'S COUGH AND CONGESTION (Oral Liquid)	1119510	Dextromethorphan	4772d9a5-85f1-4ca9-a240-84d733dcd86e	2010-10-08 00:00:00	\N	\N
3215	PEDIACARE CHILDREN'S FEVER REDUCER PAIN RELIEVER (Oral Liquid)	1125315	Acetaminophen	08eaf987-f6d8-4313-a775-052f9d51327c	2010-10-08 00:00:00	\N	\N
3216	PEDIACARE FEVER (Oral Liquid)	1177480	Ibuprofen	8d904483-5a90-4271-b69f-b33c7e875245	2014-03-12 00:00:00	\N	\N
3217	PEDIACARE INFANT FEVER PAIN RELIEVER (Oral Liquid)	1125315	Acetaminophen	89c78619-2ab0-486a-9f8e-8a17c6362740	2011-11-17 00:00:00	\N	\N
3218	PEDIACARE INFANT FEVER REDUCER (Oral Liquid)	1125315	Acetaminophen	da488d88-ad6c-460f-b030-daf3827753f8	2010-10-08 00:00:00	\N	\N
3219	PEDIACARE INFANT GAS RELIEF (Oral Liquid)	966991	Simethicone	467af525-ea12-4261-a164-b262f1a017b2	2012-07-18 00:00:00	\N	\N
3220	PEDIACARE MULTI SYMPTOM COLD (Oral Liquid)	1119510	Dextromethorphan	cb6fa9c2-0a9f-4955-beb2-02dbf891aa4b	2014-01-30 00:00:00	\N	\N
3221	PEDIACARE NIGHTTIME MULTI-SYMPTOM COLD (Oral Liquid)	1129625	Diphenhydramine	e9432ccf-e0c6-4286-82f2-5a6a10bb5893	2014-05-08 00:00:00	\N	\N
3222	PEDIADERM AF (Topical)	922570	Nystatin	bb68ae89-8a87-4ff7-a71b-f47ed4da1808	2013-10-23 00:00:00	\N	\N
3223	PEDIADERM TA (Topical)	903963	Triamcinolone	df864d69-bd2d-4fe2-8619-f2e93ab767f6	2013-10-22 00:00:00	\N	\N
3224	Pegademase bovine (Injectable)	581480	pegademase bovine	9880b900-ea23-11dc-ad56-0002a5d5c51b	2014-12-08 00:00:00	\N	\N
3225	Pegaspargase (Injectable)	1326481	pegaspargase	d046ec54-9ac8-4c9f-87a7-69e9900d8016	2008-08-08 00:00:00	\N	\N
3226	Peginterferon alfa-2b (Injectable)	1797155	peginterferon alfa-2b	b70816bb-913a-467f-acb8-67ef62cf8dac	2015-09-30 00:00:00	\N	\N
3227	PEGINTRON (Injectable)	1797155	peginterferon alfa-2b	b70816bb-913a-467f-acb8-67ef62cf8dac	2015-09-30 00:00:00	\N	\N
3228	Pegloticase (Injectable)	40226208	Pegloticase	5f4574d1-401f-4647-83e5-28c0f4a122a7	2013-04-19 00:00:00	\N	\N
3229	PEGYLAX (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	bcd57d3c-e1c4-474f-a757-ca89b020278b	2014-02-05 00:00:00	\N	\N
3230	Penciclovir (Topical)	981654	penciclovir	936c7c51-a286-405f-9aa4-ad910f2e8782	2014-08-25 00:00:00	\N	\N
3231	Penicillamine (Oral Pill)	19028050	Penicillamine	80e736d3-2017-4d68-94b4-38255c3c59c6	2012-08-28 00:00:00	\N	\N
3232	Penicillin G benzathine/Penicillin G procaine (Injectable)	1728416	Penicillin G	9a595f58-21e3-4b82-aa4c-8697682bff80	2013-11-06 00:00:00	\N	\N
3233	Penicillin G Potassium (Injectable)	1728416	Penicillin G	d8aaefb6-3f7d-4bc5-b40a-1c58c3054320	2015-10-06 00:00:00	\N	\N
3234	Penicillin G procaine (Injectable)	1728416	Penicillin G	04f90445-9426-41f4-a467-f0e3245740d7	2015-05-22 00:00:00	\N	\N
3235	Penicillin V Potassium (Oral Liquid)	1729720	Penicillin V	2bfee83c-4f38-440e-9061-58036490d009	2015-09-08 00:00:00	\N	\N
3236	Penicillin V Potassium (Oral Pill)	1729720	Penicillin V	e3b6a3b4-a61a-4432-9e90-c1ba9e210939	2015-09-14 00:00:00	\N	\N
3237	Penicillium chrysogenum var. chrysogenum extract (Injectable)	40161349	Penicillium chrysogenum var. chrysogenum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3238	Penicillium expansum extract (Injectable)	40174478	Penicillium expansum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3239	Penicillium italicum extract (Injectable)	40176125	Penicillium italicum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3240	PENLAC NAIL LACQUER (Topical)	950098	ciclopirox	9793245c-c3e0-4351-a2ab-b54b46aecb43	2013-05-03 00:00:00	\N	\N
3242	Pentamidine (Inhalant)	1730370	Pentamidine	e2ad9d3c-b6c3-4f70-87e0-722a8ff94ccb	2011-02-23 00:00:00	\N	\N
3243	PENTASA XR (Oral Pill)	968426	mesalamine	1bdf3222-469c-44b0-bbcd-25faeaeff178	2014-08-20 00:00:00	\N	\N
3244	PENTobarbital (Injectable)	730729	Pentobarbital	5c380ab0-4386-48b6-80ab-ca594b23bc74	2012-08-10 00:00:00	\N	\N
3245	Pentostatin (Injectable)	19031224	Pentostatin	151c6d2e-1af1-4c13-96ec-de3228c6efb3	2015-09-23 00:00:00	\N	\N
3246	Pentoxifylline XR (Oral Pill)	1331247	Pentoxifylline	e09702d1-43d4-47ed-9563-5af3cd667727	2015-09-23 00:00:00	\N	\N
3247	PEP-BACK (Oral Pill)	1134439	Caffeine	f9759c55-5d57-4fc4-9fa4-97fc117ab42e	2010-10-09 00:00:00	\N	\N
3248	PEPCID (Oral Pill)	953076	Famotidine	2854047f-c5c4-43c3-8ef2-5c0a84a307f2	2015-04-28 00:00:00	\N	\N
3249	PEPCID COMPLETE (Chewable)	19035704	Calcium Carbonate	e874118f-b4fe-4c80-aece-99ea20e7e805	2014-11-19 00:00:00	\N	\N
3250	PEPTO-BISMOL (Chewable)	937791	bismuth subsalicylate	a1785301-3d4d-4c47-bfa1-b51f54201c53	2014-12-16 00:00:00	\N	\N
3251	PEPTO-BISMOL (Oral Liquid)	937791	bismuth subsalicylate	f2ed9662-687a-4091-b097-dec865af09aa	2014-12-16 00:00:00	\N	\N
3252	PEPTO-BISMOL (Oral Pill)	937791	bismuth subsalicylate	0f02f1a4-3ea4-43de-bfdb-b9cb7626f92a	2014-12-16 00:00:00	\N	\N
3253	PEPTO-BISMOL CHILDREN'S (Chewable)	19035704	Calcium Carbonate	2231d2e1-db04-4efb-9b68-76cd83df67e8	2012-02-14 00:00:00	\N	\N
3254	PERCOCET (Oral Pill)	1125315	Acetaminophen	db8d5c93-7d59-4995-b388-d55ba90d6acb	2013-08-12 00:00:00	\N	\N
3255	PERCODAN REFORMULATED MAY 2009 (Oral Pill)	1112807	Aspirin	599803dc-7595-482f-aa7e-70d349fbe699	2010-08-06 00:00:00	\N	\N
3256	PERCOGESIC REFORMULATED JAN 2011 (Oral Pill)	1125315	Acetaminophen	85f0a6c8-30c8-4a1f-ac35-542c77a6522a	2010-10-09 00:00:00	\N	\N
3257	PERCY MEDICINE (Oral Liquid)	937791	bismuth subsalicylate	08dd53b7-8345-4849-9155-60429cbe2c51	2013-10-21 00:00:00	\N	\N
3258	PERDIEM OVERNIGHT (Oral Pill)	938268	"sennosides, USP"	7374ae02-74d4-4250-9116-21872e9545ed	2014-09-29 00:00:00	\N	\N
3259	Perennial rye grass pollen extract (Injectable)	40161976	perennial rye grass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3260	PERFECT CHOICE ONE MINUTE (Oral Gel)	976309	Hydrofluoric Acid	2b678081-29cd-4311-a9fa-d884734778e2	2012-12-13 00:00:00	\N	\N
3261	Pergolide (Oral Pill)	732309	Pergolide	a26390e8-eb86-4623-8cdd-45b24b14df74	2011-10-26 00:00:00	\N	\N
3262	PERI-COLACE REFORMULATED FEB 2008 (Oral Pill)	941258	Docusate	f63ecf22-fb2b-8677-5bfe-c6ac368977a3	2013-09-17 00:00:00	\N	\N
3263	PERIDEX (Mouthwash)	1790812	Chlorhexidine	6ea1691d-5379-f0c0-1b37-ecf08f6dbc00	2013-04-03 00:00:00	\N	\N
3264	PERIGIENE (Soap)	949459	chloroxylenol	4f6e8610-f474-450e-a385-eaea58f649c8	2014-11-05 00:00:00	\N	\N
3265	PERIGUARD (Topical)	911064	Zinc Oxide	6e4a7df5-684d-4fe4-bf55-05ce9b5685e6	2014-11-05 00:00:00	\N	\N
3266	Perindopril (Oral Pill)	1373225	Perindopril	87768fbf-7c63-47da-8925-0316f343d6ef	2015-06-05 00:00:00	\N	\N
3267	PERIO MED (Mouthwash)	1036094	Stannous Fluoride	7f79eb00-86df-4284-b415-47f45e4849da	2011-10-11 00:00:00	\N	\N
3268	PERIOCHIP (Implant)	1790812	Chlorhexidine	c40ab6ac-8987-42d2-a95b-95fbfd3b0162	2010-03-24 00:00:00	\N	\N
3269	PERIOGARD (Mouthwash)	1790812	Chlorhexidine	6e537d5f-bce1-41ce-9984-9b3c2861b7c9	2010-03-15 00:00:00	\N	\N
3270	PERMAX (Oral Pill)	732309	Pergolide	a26390e8-eb86-4623-8cdd-45b24b14df74	2007-09-06 00:00:00	\N	\N
3271	Permethrin (Shampoo)	922868	Permethrin	9f4cad52-e1fe-4c7b-ab08-deeef4a86ca9	2015-10-09 00:00:00	\N	\N
3272	Permethrin (Topical)	922868	Permethrin	a8d4eb78-4556-4315-815c-7f05e691b7aa	2015-09-04 00:00:00	\N	\N
3273	Perphenazine (Oral Pill)	733008	Perphenazine	20c06f4c-639a-4de3-846f-7754537dc935	2015-08-21 00:00:00	\N	\N
3274	PERSA-GEL (Topical)	918172	Benzoyl Peroxide	2af69b7d-258a-4cc2-b3f3-a108ccf99458	2015-07-10 00:00:00	\N	\N
3275	PERSANTINE (Oral Pill)	1331270	Dipyridamole	ca68879c-0214-4d7c-93b0-bdaf8ef23f8e	2011-12-13 00:00:00	\N	\N
3276	Petrolatum (Topical)	19033354	Petrolatum	8068b6e6-2bb7-4262-acaf-05e7a60249a6	2015-09-24 00:00:00	\N	\N
3277	Petrolatum/Resorcinol (Topical)	19033354	Petrolatum	03f57a4a-f94b-4ba6-b709-41cfb6e16261	2014-01-03 00:00:00	\N	\N
3278	Petrolatum/Zinc Oxide (Paste)	19033354	Petrolatum	f830a0e4-dba5-4a5f-af35-3832ec70d4d3	2014-04-09 00:00:00	\N	\N
3279	PEXEVA (Oral Pill)	722031	Paroxetine	6c4d4603-190a-496f-a40f-bc09853b9820	2014-07-28 00:00:00	\N	\N
3280	PFIZERPEN (Injectable)	1728416	Penicillin G	efef4846-9497-41af-8dd6-518f86eca7f2	2015-10-06 00:00:00	\N	\N
3281	PHAZYME (Oral Pill)	966991	Simethicone	740fd60b-ebb8-493b-aadb-55eee80f09fe	2014-12-03 00:00:00	\N	\N
3282	PHENADOZ (Rectal)	1153013	Promethazine	c293895b-1010-4283-9228-1184f01a0ef0	2013-12-05 00:00:00	\N	\N
3283	PHENAZO (Oral Pill)	933724	Phenazopyridine	78506c63-8061-499c-a57e-bdd88f805591	2012-02-21 00:00:00	\N	\N
3284	Phenazopyridine (Oral Pill)	933724	Phenazopyridine	efabc3b6-395b-4a39-8e46-01240f26e016	2015-09-17 00:00:00	\N	\N
3285	Phendimetrazine (Oral Pill)	723344	phendimetrazine	112cbc20-15ab-5ac1-e054-00144ff8d46c	2015-03-13 00:00:00	\N	\N
3286	Phenelzine (Oral Pill)	733896	Phenelzine	afd48e96-a64e-4e5a-ba21-504a53855397	2014-10-16 00:00:00	\N	\N
3287	PHENERGAN (Injectable)	1153013	Promethazine	6f7e47cc-f823-4336-8107-f980e3049617	2012-10-10 00:00:00	\N	\N
3288	PHENERGAN (Rectal)	1153013	Promethazine	d24e400d-e781-a0a4-b629-e99c32736b8a	2014-08-06 00:00:00	\N	\N
3289	PHENobarbital (Oral Liquid)	734275	Phenobarbital	ff602c63-870a-4a32-b14e-27dbfb34151f	2015-03-05 00:00:00	\N	\N
3290	PHENobarbital (Oral Pill)	734275	Phenobarbital	1c97b14f-b6a9-4f34-891c-f84280729a89	2015-07-20 00:00:00	\N	\N
3291	Phenol (Mucosal)	923540	phenol	74122093-83c0-4049-a2c8-fb557dacc7c5	2015-07-29 00:00:00	\N	\N
3292	Phenol (Oral Lozenge)	923540	phenol	6f4402aa-3f6e-4469-b512-868dba734d2b	2010-10-09 00:00:00	\N	\N
3293	Phenol (Topical)	923540	phenol	3e7d3299-dad2-401d-a81c-5653f44de3ba	2015-09-02 00:00:00	\N	\N
3294	Phentermine (Oral Pill)	735340	Phentermine	efa6398d-fd9c-48f4-a91f-5a91b4ae5b5e	2015-09-29 00:00:00	\N	\N
3295	Phentermine XR (Oral Pill)	735340	Phentermine	7ca86c66-409b-4852-8631-c3ada6e60738	2013-02-14 00:00:00	\N	\N
3296	Phentolamine (Injectable)	1335539	Phentolamine	4025cf98-ea87-4531-b0fc-6283c84f63f3	2011-06-02 00:00:00	\N	\N
3297	Phenylbutazone (Injectable)	1135710	Phenylbutazone	340d310d-7987-4f9c-ae39-eab2340d8f74	2014-04-18 00:00:00	\N	\N
3298	Phenylbutyrate (Oral Pill)	1539954	phenylbutyrate	aa638c13-3048-42b2-8a8b-79dae040ea35	2015-09-04 00:00:00	\N	\N
3299	Phenylbutyrate (Oral Powder)	1539954	phenylbutyrate	aa638c13-3048-42b2-8a8b-79dae040ea35	2014-03-07 00:00:00	\N	\N
3300	Phenylephrine (Injectable)	1135766	Phenylephrine	1651c487-5454-49f7-af45-71bfb9c9c56b	2011-09-20 00:00:00	\N	\N
3301	Phenylephrine (Nasal)	1135766	Phenylephrine	887562bf-1b9d-4980-8859-5d8d8a723994	2015-06-18 00:00:00	\N	\N
3302	Phenylephrine (Ophthalmic)	1135766	Phenylephrine	a4d3fe20-f063-11e0-ac29-0002a5d5c51b	2015-01-20 00:00:00	\N	\N
3303	Phenylephrine (Oral Liquid)	1135766	Phenylephrine	4dfd46e4-b9f9-464d-aa47-e8fa9e526a5d	2015-06-03 00:00:00	\N	\N
3304	Phenylephrine (Oral Pill)	1135766	Phenylephrine	22feef40-6b75-48a9-827c-f7925cf1f695	2015-10-13 00:00:00	\N	\N
3305	Phenylephrine (Rectal)	1135766	Phenylephrine	a95c678f-84f7-13db-f5b5-05d4d8761fc4	2012-02-03 00:00:00	\N	\N
3306	Phenylephrine/Pramoxine (Rectal)	1135766	Phenylephrine	e144fb04-db3c-4e22-9c9f-8378c7f0ce1f	2014-02-04 00:00:00	\N	\N
3307	Phenylephrine/Promethazine (Oral Liquid)	1135766	Phenylephrine	1ed2a01c-6521-451e-819f-7464562314a3	2015-06-16 00:00:00	\N	\N
3308	Phenylephrine/Pyrilamine (Oral Liquid)	1135766	Phenylephrine	1089fc64-2296-4c80-a0db-efd50e693a25	2012-12-13 00:00:00	\N	\N
3309	Phenylephrine/Pyrilamine (Oral Pill)	1135766	Phenylephrine	fd6ab993-d4ca-490b-a07c-61b0910ea657	2013-10-28 00:00:00	\N	\N
3310	Phenylephrine/Thonzylamine (Oral Liquid)	1135766	Phenylephrine	5e133352-255f-41cc-aacc-0508d634368d	2014-04-17 00:00:00	\N	\N
3311	Phenylephrine/Triprolidine (Oral Liquid)	1135766	Phenylephrine	26c2117e-804e-4132-8707-fc0302fb9090	2014-03-19 00:00:00	\N	\N
3312	Phenylephrine/Witch Hazel (Rectal)	1135766	Phenylephrine	126d0cf5-4619-45c5-88dc-7028a11787fb	2014-11-24 00:00:00	\N	\N
3313	PHENYLHISTINE DH (Oral Liquid)	1192710	Chlorpheniramine	6ca7c4ff-ba0d-490f-b8b8-9518955424e1	2015-05-07 00:00:00	\N	\N
3314	PHENYTEK XR (Oral Pill)	740910	Phenytoin	fc10b6de-3dbd-4f8a-8049-def272d0a2f1	2014-07-15 00:00:00	\N	\N
3315	Phenytoin (Chewable)	740910	Phenytoin	708599c8-6d55-4765-94b6-0c8229dd1379	2015-09-17 00:00:00	\N	\N
3316	Phenytoin (Oral Liquid)	740910	Phenytoin	9ce9adc8-6fa2-4444-8386-14cd576ac63d	2015-08-12 00:00:00	\N	\N
3317	Phenytoin (Oral Pill)	740910	Phenytoin	a0663e35-fb54-4267-81eb-a7165be54465	2014-08-29 00:00:00	\N	\N
3318	Phenytoin XR (Oral Pill)	740910	Phenytoin	f46729db-f841-4bfc-8a29-7a09a48fc9d6	2015-09-10 00:00:00	\N	\N
3319	PHISOHEX (Soap)	1768734	Hexachlorophene	e9c6f5b4-8374-491a-9b7c-fe008f20e3d1	2013-07-08 00:00:00	\N	\N
3320	PHOS-FLUR (Mouthwash)	19069022	Sodium Fluoride	84de9ca9-7959-4d5f-9bb0-884cee1b8038	2011-07-29 00:00:00	\N	\N
3321	PHOS-FLUR (Toothpaste)	19069022	Sodium Fluoride	540306ab-083a-4129-9c66-7ff5e425d9dc	2012-09-07 00:00:00	\N	\N
3322	PHOSLO (Oral Pill)	951469	calcium acetate	34a29fae-b549-41ed-bd7d-e98fe2110bef	2014-08-12 00:00:00	\N	\N
3323	PHOSPHOLINE IODIDE (Ophthalmic)	958368	Echothiophate	c4adbc81-6681-4e12-f8ab-5d1cb7723aad	2013-12-12 00:00:00	\N	\N
3324	PHOTOFRIN (Injectable)	19089602	Dihematoporphyrin Ether	5c4841b4-fbc0-4163-8ee1-cb28629cbfbf	2015-04-29 00:00:00	\N	\N
3325	Physostigmine (Injectable)	19044337	Physostigmine	b81350a6-715b-451c-87e9-3674ec29ffd8	2014-10-28 00:00:00	\N	\N
3326	Pignut hickory pollen extract (Injectable)	40172636	pignut hickory pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3327	Pilocarpine (Ophthalmic)	945286	Pilocarpine	d87192c5-c6b4-4d56-95b1-bb242afed3c1	2013-04-16 00:00:00	\N	\N
3328	Pilocarpine (Oral Pill)	945286	Pilocarpine	610022b7-7dc9-405a-a580-104657f43bdf	2015-10-13 00:00:00	\N	\N
3329	Pimecrolimus (Topical)	915935	Pimecrolimus	e4027e5a-0f9b-4070-b196-f60172f45c4c	2014-12-15 00:00:00	\N	\N
3330	Pimozide (Oral Pill)	745790	Pimozide	fd9729c3-545f-4d34-9bc7-72b61e028fc4	2014-11-03 00:00:00	\N	\N
3331	Pin oak pollen extract (Injectable)	40172640	pin oak pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3332	PIN-X (Chewable)	1759270	Pyrantel	8c37db7c-a73e-4d99-a8a9-d55da1a74a3e	2011-12-01 00:00:00	\N	\N
3333	Pindolol (Oral Pill)	1345858	Pindolol	07fe9cc3-1ef2-420c-b45d-7f1e894b6ef9	2014-10-14 00:00:00	\N	\N
3334	Pioglitazone (Oral Pill)	1525215	pioglitazone	d2ddc491-88a9-4063-9150-443b4fa4330c	2015-05-01 00:00:00	\N	\N
3335	Piperacillin (Injectable)	1746114	Piperacillin	fac0c875-111e-4af2-d186-ed4d4ee9de59	2007-05-22 00:00:00	\N	\N
3336	Piperacillin/Tazobactam (Injectable)	1746114	Piperacillin	7b3ba6b9-59e1-454a-9ddc-ab3592221627	2015-06-24 00:00:00	\N	\N
3337	Piperonyl Butoxide/Pyrethrins (Shampoo)	946340	Piperonyl Butoxide	4954a3f2-8d27-4955-ab88-2518b8a05252	2015-09-25 00:00:00	\N	\N
3338	Piperonyl Butoxide/Pyrethrins (Topical)	946340	Piperonyl Butoxide	7509990f-0bc8-44dc-9678-05b27f2c1368	2013-09-13 00:00:00	\N	\N
3339	PIPRACIL (Injectable)	1746114	Piperacillin	fac0c875-111e-4af2-d186-ed4d4ee9de59	2007-05-22 00:00:00	\N	\N
3340	Piroxicam (Oral Pill)	1146810	Piroxicam	6047dd25-8419-42ce-bd58-9e568ae7b50f	2015-07-15 00:00:00	\N	\N
3341	Pitavastatin (Oral Pill)	40165636	pitavastatin	44dcbf97-99ec-427c-ba50-207e0069d6d2	2013-10-24 00:00:00	\N	\N
3342	Pitch pine pollen extract (Injectable)	40172710	pitch pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3343	PITOCIN (Injectable)	1326115	Oxytocin	969d5b35-0add-4c23-9605-6a5b6ab65c95	2013-11-01 00:00:00	\N	\N
3344	Plains cottonwood pollen extract (Injectable)	40167516	plains cottonwood pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3345	PLAN B ONE-STEP (Oral Pill)	1589505	Levonorgestrel	e53e3f9a-d359-4c5a-aceb-d002ed367849	2013-12-10 00:00:00	\N	\N
3346	PLAQUENIL (Oral Pill)	1777087	Hydroxychloroquine	631ed616-f23c-43c9-b63b-f53707c077cb	2013-07-15 00:00:00	\N	\N
3347	PLASBUMIN (Injectable)	1344143	"Albumin Human, USP"	5b334e41-5297-540c-5fc1-cd7b845c5685	2015-04-30 00:00:00	\N	\N
3348	Plasma protein fraction (Injectable)	19025693	plasma protein fraction	679bbaf2-b082-5948-8400-ece5340eabc1	2014-05-28 00:00:00	\N	\N
3349	PLASMA-LYTE 56 (Injectable)	19013986	magnesium acetate	94c12711-d672-450d-baae-06e24a72aace	2006-09-28 00:00:00	\N	\N
3350	PLASMA-LYTE 56 IN 5 % DEXTROSE (Injectable)	1560524	Glucose	85c08b62-8de0-42d2-8cdc-fe42e6b605d7	2015-02-27 00:00:00	\N	\N
3351	PLASMANATE (Injectable)	19025693	plasma protein fraction	679bbaf2-b082-5948-8400-ece5340eabc1	2014-05-28 00:00:00	\N	\N
3352	PLAVIX (Oral Pill)	1322184	clopidogrel	10360cf0-1671-3cbe-cd7c-2c8e8753bd1b	2013-03-21 00:00:00	\N	\N
3353	Pleospora herbarum extract (Injectable)	40176165	Pleospora herbarum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3354	Plerixafor (Injectable)	19017581	Plerixafor	0ed08d2b-5051-46b2-aa37-1d6275bf9003	2015-08-10 00:00:00	\N	\N
3355	PLETAL (Oral Pill)	1350310	cilostazol	24d75b58-bafb-4440-b8d7-4f4079c08b0b	2015-08-07 00:00:00	\N	\N
3356	PLEXION (Soap)	1036252	Sulfacetamide	817a486f-7668-42fa-8f7c-d67ffc647da5	2014-05-13 00:00:00	\N	\N
3357	PLEXION (Topical)	1036252	Sulfacetamide	f4ad79c1-bdac-40aa-af75-476826c7f009	2014-05-12 00:00:00	\N	\N
3358	PLURATUSS (Oral Liquid)	1130863	Brompheniramine	08fb676a-9df6-435f-90f1-9b0b2de453ce	2010-10-09 00:00:00	\N	\N
3359	Podofilox (Topical)	947705	podofilox	6af07697-5203-43e0-ba35-83683af851c3	2014-03-20 00:00:00	\N	\N
3360	Polidocanol (Injectable)	40175900	polidocanol	dfd6b4a0-b0dc-11e2-9e96-0800200c9a66	2015-03-23 00:00:00	\N	\N
3361	POLOCAINE (Injectable)	702774	Mepivacaine	007fcf17-f78a-40a7-d494-af93bbb40032	2015-09-15 00:00:00	\N	\N
3362	POLY HIST CB (Oral Liquid)	1140640	carbetapentane	c3a1a47a-27ce-4565-9d6a-a2d8314357a6	2010-07-20 00:00:00	\N	\N
3363	POLY HIST FORTE REFORMULATED NOV 2013 (Oral Pill)	1192710	Chlorpheniramine	8f6622e1-b40d-4d1c-9322-463775728a25	2015-02-23 00:00:00	\N	\N
3364	POLY HIST NC (Oral Liquid)	1201620	Codeine	96a2f945-bace-431e-8fd6-d73a6dc1baea	2015-03-31 00:00:00	\N	\N
3365	POLY HIST PD (Oral Liquid)	1192710	Chlorpheniramine	8728160d-6172-4f4e-b512-46f5d9bca733	2010-07-20 00:00:00	\N	\N
3366	POLY TUSSIN EX (Oral Liquid)	1189596	dihydrocodeine	a3d94294-e66b-4384-9e9a-489a98bd5964	2010-07-20 00:00:00	\N	\N
3367	POLYCIN-B (Ophthalmic)	915175	Bacitracin	7eee57e9-b09c-4316-add2-66b5b06b6e79	2011-07-27 00:00:00	\N	\N
3368	POLYETHYLENE GLYCOL 3350 (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	bcd57d3c-e1c4-474f-a757-ca89b020278b	2015-10-05 00:00:00	\N	\N
3369	POLYETHYLENE GLYCOL 3350/Potassium Chloride/Sodium Bicarbonate/Sodium Chloride (Oral Liquid)	986417	POLYETHYLENE GLYCOL 3350	444c83ae-ac3a-467c-be05-e2bcbfbaaba1	2014-03-20 00:00:00	\N	\N
3370	Polyethylene Glycol 400 (Ophthalmic)	948490	Polyethylene Glycol 400	10fcf407-6eaf-4730-9ed0-9b7715cf5701	2015-08-24 00:00:00	\N	\N
3371	Polyethylene Glycol 400/Propylene glycol (Ophthalmic)	948490	Polyethylene Glycol 400	46288fea-f448-4a9e-b3da-f9fc54614ffd	2015-09-23 00:00:00	\N	\N
3372	Polyethylene Glycol 400/Tetrahydrozoline (Ophthalmic)	948490	Polyethylene Glycol 400	36136ce4-9d66-4e56-bd51-0616a79a42a7	2013-02-07 00:00:00	\N	\N
3373	Polymyxin B (Injectable)	948582	Polymyxin B	805caef0-89df-4bcf-876d-9f6b7a89c9a3	2015-04-28 00:00:00	\N	\N
3374	Polymyxin B/Trimethoprim (Ophthalmic)	948582	Polymyxin B	1a01d41b-3da1-4938-9e71-499320c72dd2	2015-09-17 00:00:00	\N	\N
3375	Polysaccharide iron complex (Oral Liquid)	1300751	Polysaccharide iron complex	17cd83ec-8779-45f9-8c8d-0aaa8c7b9b42	2014-01-27 00:00:00	\N	\N
3376	Polysaccharide iron complex (Oral Pill)	1300751	Polysaccharide iron complex	968c74e0-0510-4a0e-add2-37af97fc6928	2014-03-07 00:00:00	\N	\N
3377	Polysorbate 80 (Ophthalmic)	948760	Polysorbate 80	dbb0d312-c79a-4c89-acb1-b895b52c05d5	2010-10-09 00:00:00	\N	\N
3378	POLYSPORIN (Topical)	915175	Bacitracin	dd7aceb6-0666-4059-b2a9-8e7fe5f3f0ac	2013-07-19 00:00:00	\N	\N
3379	Polythiazide/Reserpine (Oral Pill)	948787	Polythiazide	b503fa5e-5726-426d-867c-e8fe59ed3ead	2006-10-13 00:00:00	\N	\N
3380	Polyvinyl Alcohol (Ophthalmic)	948856	Polyvinyl Alcohol	556e7de7-e0ae-4ddb-a190-599238355443	2015-09-17 00:00:00	\N	\N
3381	Polyvinyl Alcohol/Povidone (Ophthalmic)	948856	Polyvinyl Alcohol	ecaa0eba-1662-4394-b26f-a765f422dcea	2015-04-29 00:00:00	\N	\N
3382	Polyvinyl Alcohol/Povidone/Tetrahydrozoline (Ophthalmic)	948856	Polyvinyl Alcohol	9b5a7220-33ae-4bee-b7d3-65cf2ef86c88	2011-11-17 00:00:00	\N	\N
3383	Pomalidomide (Oral Pill)	43014237	pomalidomide	2b25ef01-5c9e-11e1-b86c-0800200c9a66	2015-05-07 00:00:00	\N	\N
3384	POMALYST (Oral Pill)	43014237	pomalidomide	2b25ef01-5c9e-11e1-b86c-0800200c9a66	2015-05-07 00:00:00	\N	\N
3385	Ponatinib (Oral Pill)	43013182	ponatinib	807f988e-117b-4497-934d-73aa78baac71	2014-10-08 00:00:00	\N	\N
3386	Post oak pollen extract (Injectable)	40172774	post oak pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3387	Potassium Acetate (Injectable)	19076414	Potassium Acetate	0f2af08c-8dbb-46ce-9582-13239a47b546	2014-07-21 00:00:00	\N	\N
3388	Potassium bicarbonate (Effervescent)	19027080	potassium bicarbonate	98c778f9-5a3d-4b4f-9c9e-8a5f0b84b2a6	2015-03-06 00:00:00	\N	\N
3389	Potassium bitartrate/Sodium Bicarbonate (Rectal)	19086788	Potassium bitartrate	d868de56-ac3b-4e44-8aa5-031661f0ac25	2015-03-12 00:00:00	\N	\N
3390	Potassium Chloride (Effervescent)	19049105	Potassium Chloride	d5a02700-b888-43b0-85c5-ac8938438c9e	2012-04-25 00:00:00	\N	\N
3391	Potassium Chloride (Injectable)	19049105	Potassium Chloride	7c390c7c-1a1d-4f8a-a83b-097179278b2a	2014-07-29 00:00:00	\N	\N
3392	Potassium Chloride (Oral Liquid)	19049105	Potassium Chloride	bae3548f-40fe-4ef5-adb3-eb4cef6f735d	2015-10-01 00:00:00	\N	\N
3393	Potassium Chloride XR (Oral Pill)	19049105	Potassium Chloride	74883ca9-e9cf-4556-929d-72c53f0478ac	2015-09-15 00:00:00	\N	\N
3394	Potassium Chloride/Sodium Chloride (Injectable)	19049105	Potassium Chloride	becc7410-0a25-49f5-b0c3-240078479dc8	2014-11-05 00:00:00	\N	\N
3395	Potassium citrate XR (Oral Pill)	976545	potassium citrate	2215dc1d-0b5a-469e-9b51-4d7480a51078	2014-11-03 00:00:00	\N	\N
3396	Potassium gluconate (Oral Pill)	19059547	Potassium gluconate	10e2e633-9bc5-41d7-89ab-a10a928e89ce	2015-01-15 00:00:00	\N	\N
3397	Potassium Iodide (Oral Pill)	19049909	Potassium Iodide	566c8453-bae5-4f96-bc82-30d4543c9895	2014-04-03 00:00:00	\N	\N
3398	Potassium nitrate (Oral Strip)	927322	potassium nitrate	ac99f344-f0a7-4502-a06f-888a1b382edd	2010-10-05 00:00:00	\N	\N
3399	Potassium nitrate/Silver Nitrate (Topical)	927322	potassium nitrate	b7634e27-3c75-4e56-ab42-3e5796edb0c7	2014-05-16 00:00:00	\N	\N
3400	Potassium nitrate/Sodium Fluoride (Toothpaste)	927322	potassium nitrate	1b6618ea-6533-41d7-be2c-13bb9e108dc5	2015-09-15 00:00:00	\N	\N
3401	"Potassium phosphate/Sodium Phosphate, Dibasic/Sodium Phosphate, Monobasic (Oral Pill)"	19027362	potassium phosphate	83376725-ee0f-40ad-bd90-31a61b9445cf	2015-08-14 00:00:00	\N	\N
3402	"Potassium phosphate/Sodium Phosphate, Monobasic (Oral Pill)"	19027362	potassium phosphate	9f446400-c403-4971-879e-1341f7f7d9da	2014-10-07 00:00:00	\N	\N
3403	Povidone-Iodine (Ophthalmic)	1750087	Povidone-Iodine	b026de1b-9949-4557-ac49-c7b0038c24cd	2011-07-12 00:00:00	\N	\N
3404	Povidone-Iodine (Soap)	1750087	Povidone-Iodine	4779974e-c149-489d-9cce-a0e9e0e921c9	2012-07-05 00:00:00	\N	\N
3405	Povidone-Iodine (Topical)	1750087	Povidone-Iodine	6ebacffc-e42c-4e8a-a87c-684881460742	2015-10-13 00:00:00	\N	\N
3406	Povidone-Iodine (Vaginal)	1750087	Povidone-Iodine	ebd9aa34-6b66-4645-bbaa-51e087b54bbd	2014-04-21 00:00:00	\N	\N
3407	PRADAXA (Oral Pill)	40228152	dabigatran etexilate	5db7f199-8752-4d24-85f7-e34ca8f4d02e	2011-04-14 00:00:00	\N	\N
3408	Pralidoxime (Injectable)	1727468	pralidoxime	2741d8fd-51c2-46be-880b-99f2b20a6137	2014-12-24 00:00:00	\N	\N
3409	PRAMEGEL REFORMULATED APR 2012 (Topical)	901656	Menthol	848cfd76-aa0a-427b-959f-66d2cf5f9a34	2014-09-22 00:00:00	\N	\N
3410	Pramipexole (Oral Pill)	720810	Pramipexole	04bf2b80-5371-4641-bbf5-e19587c0e9cf	2015-10-05 00:00:00	\N	\N
3411	PRAMOSONE (Topical)	975125	Hydrocortisone	f55fbf9a-cfab-4612-ba40-140e1339ca00	2015-08-07 00:00:00	\N	\N
3412	Pramoxine (Rectal)	927478	pramoxine	0494f952-de65-49d8-a8a6-5ee5abd53619	2012-06-05 00:00:00	\N	\N
3413	Pramoxine (Soap)	927478	pramoxine	c0cd4ef5-860f-4035-9f91-fe4f78c33ae2	2015-06-25 00:00:00	\N	\N
3414	Pramoxine (Topical)	927478	pramoxine	cb1d2724-dfaa-4c70-8222-124f9db14488	2015-08-12 00:00:00	\N	\N
3415	Pramoxine/Zinc Acetate (Topical)	927478	pramoxine	95a66433-6a68-4f3c-9aaa-4d27443aa7e5	2015-06-24 00:00:00	\N	\N
3416	Pramoxine/Zinc Oxide (Rectal)	927478	pramoxine	0d5ba4f1-1178-490d-8524-143d0aa2f0ef	2015-03-06 00:00:00	\N	\N
3417	PRANDIMET (Oral Pill)	1503297	Metformin	5be33711-b77d-4a01-87c8-3b2618c16e8f	2012-05-09 00:00:00	\N	\N
3418	PRANDIN (Oral Pill)	1516766	repaglinide	e2a07020-a596-4282-bb7c-c9ebe6edcd61	2015-05-08 00:00:00	\N	\N
3419	PRASCION (Soap)	1036252	Sulfacetamide	c3aeca7e-4b7d-431c-a0c9-f7f5b05ad5a8	2011-08-12 00:00:00	\N	\N
3420	PRASCION (Topical)	1036252	Sulfacetamide	49052371-e1d6-4665-b82e-442bdf4b177d	2010-12-27 00:00:00	\N	\N
3421	Prasugrel (Oral Pill)	40163718	prasugrel	cb684ad9-0b72-406f-8a07-a419254ccd36	2015-08-19 00:00:00	\N	\N
3422	PRAVACHOL (Oral Pill)	1551860	Pravastatin	897ad8b7-921d-eb02-a61c-3419e662a2da	2013-10-31 00:00:00	\N	\N
3423	Pravastatin (Oral Pill)	1551860	Pravastatin	88295e57-9167-48a0-b52f-6ec9cef61109	2015-09-30 00:00:00	\N	\N
3424	PRAX (Topical)	927478	pramoxine	35ca8ff5-79da-4e7c-be71-91d7b8a6d977	2015-08-12 00:00:00	\N	\N
3425	Praziquantel (Oral Pill)	1750461	Praziquantel	34ce1cdd-648e-4f1e-8512-bf3d4cc22eb9	2015-07-08 00:00:00	\N	\N
3426	Prazosin (Oral Pill)	1350489	Prazosin	14a764d2-6142-443e-9598-414f11cbb627	2015-05-11 00:00:00	\N	\N
3427	PRECOSE (Oral Pill)	1529331	Acarbose	e2158832-ad0b-4b9c-bbf0-1608a177bf85	2015-03-11 00:00:00	\N	\N
3428	PRED FORTE (Ophthalmic)	1550557	prednisolone	00a5aa88-e361-4ea7-8922-530c738b726e	2014-03-28 00:00:00	\N	\N
3429	PRED MILD (Ophthalmic)	1550557	prednisolone	90fba723-51b1-4404-a30b-816f35001d91	2014-05-06 00:00:00	\N	\N
3430	Prednicarbate (Topical)	928110	prednicarbate	ccc7985a-da29-475f-8a53-0f76ba20b86d	2015-05-20 00:00:00	\N	\N
3431	prednisoLONE (Ophthalmic)	1550557	prednisolone	dbcab023-8a71-4c66-ac6b-b98b20a493f9	2015-01-29 00:00:00	\N	\N
3432	prednisoLONE (Oral Disintegrating)	1550557	prednisolone	1e379543-c4cf-4e72-953b-db15b7f0c2a1	2014-12-09 00:00:00	\N	\N
3433	prednisoLONE (Oral Liquid)	1550557	prednisolone	9f4b181e-2675-40c6-a3d7-a8fe671230c1	2015-06-22 00:00:00	\N	\N
3434	prednisoLONE (Oral Pill)	1550557	prednisolone	b8fadaec-9985-4f17-9b2f-b2f6a28cae1c	2015-06-12 00:00:00	\N	\N
3435	PrednisoLONE/Sulfacetamide (Ophthalmic)	1550557	prednisolone	e5a2f3a5-2b9d-4d02-ad5c-e6a890569363	2015-08-17 00:00:00	\N	\N
3436	predniSONE (Oral Pill)	1551099	Prednisone	d3abe47f-8ad5-4752-b772-97b56cca19f2	2015-10-05 00:00:00	\N	\N
3437	Pregabalin (Oral Pill)	734354	pregabalin	59cf1b6b-eaae-4bd8-abca-8e68aeb30ee6	2014-12-22 00:00:00	\N	\N
3438	PREGNYL (Injectable)	1563600	Chorionic Gonadotropin	dc604794-6dd6-43a7-85fa-2f04ed325c33	2012-04-20 00:00:00	\N	\N
3439	PREMARIN (Oral Pill)	1549080	"Estrogens, Conjugated (USP)"	701acf2c-fffe-451a-9b94-82d825e5a47c	2014-05-15 00:00:00	\N	\N
3440	PREMSYN PMS (Oral Pill)	1125315	Acetaminophen	ce280f7d-ca22-473d-b276-de44933e7957	2010-10-09 00:00:00	\N	\N
3441	PREPARATION H COOLING GEL (Rectal)	1135766	Phenylephrine	cebee3f7-8591-e4f7-e66a-e43b4ba3aaf4	2014-04-28 00:00:00	\N	\N
3442	PREPARATION H MEDICATED WIPES (Topical)	959196	Witch Hazel	1953ec64-20ce-488b-8f14-44e15cc9e720	2015-03-24 00:00:00	\N	\N
3443	PREPARATION H REFORMULATED JUN 2013 (Rectal)	908523	Mineral Oil	ce789c2a-1d38-4c5f-923e-9d4dab751c01	2015-07-10 00:00:00	\N	\N
3444	PREVACID (Oral Disintegrating)	929887	lansoprazole	7140f8d9-e478-4f69-a4eb-3fd4c9414576	2015-07-23 00:00:00	\N	\N
3445	PREVACID (Oral Pill)	929887	lansoprazole	2f4c571b-a27e-40ef-b0cd-e6e44ac9a15e	2015-01-16 00:00:00	\N	\N
3446	PREVIDENT (Toothpaste)	19069022	Sodium Fluoride	5b67ae9e-129a-43ab-8eca-d4a38fbbfcf6	2012-09-06 00:00:00	\N	\N
3447	PREVIDENT 5000 SENSITIVE (Toothpaste)	927322	potassium nitrate	b028cfff-4946-49e8-b8bb-197ab99d0d35	2011-07-29 00:00:00	\N	\N
3448	PREVIDENT DENTAL RINSE (Mouthwash)	19069022	Sodium Fluoride	714c38d1-e018-47a2-9160-6c79ee8c2dc5	2012-09-04 00:00:00	\N	\N
3449	PREZISTA (Oral Pill)	1756831	darunavir	69b6f72d-fe6b-4347-8801-99ece7e2a29b	2013-05-29 00:00:00	\N	\N
3450	PriLOSEC (Oral Pill)	923645	Omeprazole	d970b074-957a-4036-92d3-1712386f3858	2015-02-03 00:00:00	\N	\N
3451	PRIMACOR (Injectable)	1368671	Milrinone	2a0a2d3a-1900-4c73-89c5-c4bde1b61553	2008-05-22 00:00:00	\N	\N
3452	Primaquine (Oral Pill)	1751310	Primaquine	222f3d0a-7649-44ad-99b2-b2dc8c298e7b	2015-05-06 00:00:00	\N	\N
3453	PRIMATENE (Oral Pill)	1143374	Ephedrine	9005482c-25ae-d365-33d1-29269532c74d	2013-02-15 00:00:00	\N	\N
3454	PRIMAXIN (Injectable)	1797258	Cilastatin	7aa0ce90-156c-4583-ae6d-9ed3595960c8	2013-04-12 00:00:00	\N	\N
3455	Primidone (Oral Pill)	751347	Primidone	a90d5ba6-4170-0b97-5ae3-fc707c9e4f1b	2015-08-20 00:00:00	\N	\N
3456	PRIMLEV (Oral Pill)	1125315	Acetaminophen	94679f29-d63a-41a5-bdda-3aa3fc2db531	2015-03-02 00:00:00	\N	\N
3457	PRIMSOL (Oral Liquid)	1705674	Trimethoprim	a06ea7d8-a884-4b62-a87f-c36d824f2aa4	2014-09-29 00:00:00	\N	\N
3458	Privet pollen extract (Injectable)	40162001	privet pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3459	PRIVINE (Nasal)	914533	Naphazoline	ec2bb7d7-d014-46ed-a836-453e921da4c5	2010-10-09 00:00:00	\N	\N
3460	PROAMATINE (Oral Pill)	1308368	Midodrine	171543e7-a592-4676-88ef-d68f14701d13	2009-12-08 00:00:00	\N	\N
3461	Probenecid (Oral Pill)	1151422	Probenecid	8459857e-1a52-45de-81e6-e06ce18508bb	2015-04-07 00:00:00	\N	\N
3462	Procainamide (Injectable)	1351461	Procainamide	dfd657ec-aaf5-4f9e-85d0-0a2a081ceaf7	2014-06-02 00:00:00	\N	\N
3463	Procaine (Injectable)	751698	Procaine	999625d5-3a6b-4753-059a-4f19d04c85a5	2007-09-14 00:00:00	\N	\N
3464	PROCARDIA (Oral Pill)	1318853	Nifedipine	e04aa152-b08d-47f7-b976-f8bee4c386db	2014-02-03 00:00:00	\N	\N
3465	PROCENTRA (Oral Liquid)	719311	Dextroamphetamine	1548cce2-fb6b-4f17-8a3b-868933f6c9d6	2015-09-24 00:00:00	\N	\N
3466	PROCHIEVE (Vaginal)	1552310	Progesterone	9f8dc923-65d7-42ff-b718-97e7a7e87822	2009-12-14 00:00:00	\N	\N
3467	Prochlorperazine (Injectable)	752061	Prochlorperazine	328bcba6-a2f8-4216-8f6f-c40959fe8779	2015-10-01 00:00:00	\N	\N
3468	Prochlorperazine (Oral Pill)	752061	Prochlorperazine	718c6fee-77d5-4ba1-8a1d-f2ac059298b3	2015-10-01 00:00:00	\N	\N
3469	Prochlorperazine (Rectal)	752061	Prochlorperazine	9bdba30b-53b4-427a-af74-7a39b52130b2	2013-08-29 00:00:00	\N	\N
3470	PROCOMYCIN (Topical)	915175	Bacitracin	a08ffd2b-6c78-4a1a-9ca4-08a72900119d	2014-03-28 00:00:00	\N	\N
3471	PROCORT (Rectal)	975125	Hydrocortisone	9e899b72-a16e-4b55-93b5-ab5baec37d50	2013-04-09 00:00:00	\N	\N
3472	PROCRIT (Injectable)	1301125	Epoetin Alfa	9bbe9a5b-ad1d-41a4-9699-ff6dc776bce1	2013-01-18 00:00:00	\N	\N
3473	PROCTO-PAK (Rectal)	975125	Hydrocortisone	a1148e9e-061c-4070-8059-68ffe3d3b20a	2012-06-21 00:00:00	\N	\N
3474	PROCTOCORT (Rectal)	975125	Hydrocortisone	a2e1222a-ab91-4382-a210-7dfdd6de1407	2011-02-08 00:00:00	\N	\N
3475	PROCTOFOAM-HC (Rectal)	975125	Hydrocortisone	3831e931-ec0a-11e3-ac10-0800200c9a66	2014-08-15 00:00:00	\N	\N
3476	PROCTOSOL (Topical)	975125	Hydrocortisone	565284e7-4994-486b-8267-18bd166655ac	2014-12-10 00:00:00	\N	\N
3477	PROCTOZONE HC (Topical)	975125	Hydrocortisone	fcd4747b-3c54-4b2f-a6bc-eafa0cf7016e	2013-06-14 00:00:00	\N	\N
3478	PROCYSBI (Oral Pill)	910888	Cysteamine	b7b6e290-5168-46dc-9e7f-5995420ec1c1	2015-08-27 00:00:00	\N	\N
3479	PRODERM (Topical)	950933	Castor Oil	6bf98ba3-d9f6-4872-8220-a1b403226223	2012-10-31 00:00:00	\N	\N
3480	PRODRIN (Oral Pill)	1125315	Acetaminophen	1d157217-d307-423c-8f50-965b23881330	2013-08-29 00:00:00	\N	\N
3481	PROFENAL (Ophthalmic)	1036636	Suprofen	8de2c303-5d99-46b6-ad6d-a4caadea3604	2008-03-13 00:00:00	\N	\N
3482	Progesterone (Injectable)	1552310	Progesterone	83cfc12e-75d1-4284-bcc3-beadcbd27171	2014-01-07 00:00:00	\N	\N
3483	Progesterone (Oral Pill)	1552310	Progesterone	6e8d8c78-001b-00fb-6a03-3b4489198d25	2014-06-19 00:00:00	\N	\N
3484	Progesterone (Vaginal)	1552310	Progesterone	9f8dc923-65d7-42ff-b718-97e7a7e87822	2009-12-14 00:00:00	\N	\N
3485	PROGLYCEM (Oral Liquid)	1523280	Diazoxide	b16c7832-2fd9-49af-b923-1dc0d91fd6e2	2015-10-05 00:00:00	\N	\N
3486	PROGRAF (Oral Pill)	950637	Tacrolimus	1e56c550-1c2b-4177-8e49-26303e9e335f	2014-05-22 00:00:00	\N	\N
3487	PROLENSA (Ophthalmic)	1139179	bromfenac	4e072537-f73c-4a96-a65f-e2805ce112d8	2015-08-17 00:00:00	\N	\N
3488	Promethazine (Injectable)	1153013	Promethazine	ed16846a-b054-4625-b4e4-4a951e95c92e	2015-02-24 00:00:00	\N	\N
3489	Promethazine (Oral Liquid)	1153013	Promethazine	e5be207b-122b-490f-a0d6-841132e45180	2015-06-10 00:00:00	\N	\N
3490	Promethazine (Oral Pill)	1153013	Promethazine	0af133fc-a27d-4099-908a-0bdf7c64f22b	2015-10-09 00:00:00	\N	\N
3491	Promethazine (Rectal)	1153013	Promethazine	9aa7b3f2-4429-4a61-ad8e-876afb14cc45	2015-06-02 00:00:00	\N	\N
3492	PROMETHEGAN (Rectal)	1153013	Promethazine	bf9d28d7-0ce1-48bb-85e8-48676e35069c	2014-08-05 00:00:00	\N	\N
3493	PROMETRIUM (Oral Pill)	1552310	Progesterone	cf73c385-5173-4b54-af23-069581c5d560	2010-09-01 00:00:00	\N	\N
3494	PROMOLAXIN (Oral Pill)	941258	Docusate	9ff570c5-1d0e-47bb-aea2-347c7b24ca68	2015-03-27 00:00:00	\N	\N
3495	PRONTO PLUS (Shampoo)	946340	Piperonyl Butoxide	3cdec6f3-4da6-467f-96c3-c8941ff46b56	2011-02-28 00:00:00	\N	\N
3496	Propafenone (Oral Pill)	1353256	Propafenone	a7c8f090-c48c-44f7-9973-2cf4b491e35c	2015-08-21 00:00:00	\N	\N
3497	Proparacaine (Ophthalmic)	929504	proparacaine	37cde651-2549-43f3-97b9-cdc442a0aa7a	2015-08-17 00:00:00	\N	\N
3498	PROPECIA (Oral Pill)	996416	Finasteride	9e7329eb-39f1-4f84-a0bb-91daffaba1c3	2013-06-14 00:00:00	\N	\N
3499	PROPEL (Implant)	905233	Mometasone	6befbf16-3f60-4ce8-94ec-5ce6a2b7f4e1	2015-01-02 00:00:00	\N	\N
3500	Propofol (Injectable)	753626	Propofol	e3105799-a4b6-f3f4-e6e2-b2b29bbdb538	2015-08-06 00:00:00	\N	\N
3501	Propoxyphene (Oral Pill)	1153664	Propoxyphene	c6c48eee-240b-4425-8691-35462523652e	2012-10-15 00:00:00	\N	\N
3502	Propranolol (Injectable)	1353766	Propranolol	87688f92-a620-437d-904a-25c19d4270c8	2013-04-26 00:00:00	\N	\N
3503	Propranolol (Oral Liquid)	1353766	Propranolol	b6f9dd2a-632b-87eb-70f0-b2064d7ed48a	2015-05-14 00:00:00	\N	\N
3504	Propranolol (Oral Pill)	1353766	Propranolol	6112d957-e39e-470d-9f66-0bce4b3455ee	2015-10-01 00:00:00	\N	\N
3505	Propylhexedrine (Nasal)	954036	propylhexedrine	03a8ef3c-a808-6208-e054-00144ff8d46c	2014-09-25 00:00:00	\N	\N
3506	Propylthiouracil (Oral Pill)	1554072	Propylthiouracil	ff603c99-6620-4945-acdc-c9150b6f77d4	2015-08-19 00:00:00	\N	\N
3507	PROSTIN E2 (Vaginal)	1329415	Dinoprostone	fae013fc-e199-43f3-86ef-66d34017c534	2014-10-30 00:00:00	\N	\N
3508	PROSTIN VR (Injectable)	1381504	Alprostadil	dea460fa-d05e-4191-8461-f185a711ad89	2014-08-11 00:00:00	\N	\N
3509	Protamine Sulfate (USP) (Injectable)	19054242	Protamine Sulfate (USP)	8df0a819-9e1a-44ce-97a6-3ea82c867d44	2014-07-01 00:00:00	\N	\N
3510	Protein C (Injectable)	42801108	Protein C	926914a9-78b2-40ea-b37d-2a55c09bf275	2015-08-24 00:00:00	\N	\N
3511	PROTONIX (Injectable)	948078	pantoprazole	3cde88e6-28f2-4cbe-8c3f-770b05cc0e1b	2015-09-17 00:00:00	\N	\N
3512	PROTONIX (Oral Granules)	948078	pantoprazole	189b7b6a-9717-44eb-b87b-fd3e985b2268	2015-09-02 00:00:00	\N	\N
3513	PROTONIX (Oral Pill)	948078	pantoprazole	e6238767-90da-4176-8ac6-d71c2025dcb5	2015-09-02 00:00:00	\N	\N
3514	PROTOPAM (Injectable)	1727468	pralidoxime	2741d8fd-51c2-46be-880b-99f2b20a6137	2014-12-24 00:00:00	\N	\N
3515	Protriptyline (Oral Pill)	754270	Protriptyline	700abc58-9362-4ef5-9d7a-dd3c4d364d0a	2014-07-25 00:00:00	\N	\N
3516	PROVENGE (Injectable)	40224095	sipuleucel-T	8309b497-5d4e-4408-ac0c-2452c11c8a35	2015-02-04 00:00:00	\N	\N
3517	PROVIGIL (Oral Pill)	710650	modafinil	8b79d52e-e6e5-4aaf-8835-242c72d6ee38	2015-01-28 00:00:00	\N	\N
3518	PROzac (Oral Pill)	755695	Fluoxetine	4b8fcce1-abfc-4631-9975-9d66e178dab6	2010-02-24 00:00:00	\N	\N
3519	PRUDOXIN (Topical)	738156	Doxepin	64311378-2da2-4835-a222-5df5204c59c2	2015-02-13 00:00:00	\N	\N
3520	Prussian blue (Oral Pill)	19095769	Prussian blue	baa68c79-5f3d-468a-a510-58b9e978cd50	2014-09-11 00:00:00	\N	\N
3521	PSEUDODINE C (Oral Liquid)	1201620	Codeine	dd62a5eb-dd5a-4329-8696-07acb555af10	2009-03-20 00:00:00	\N	\N
3522	Pseudoephedrine (Oral Liquid)	1154332	Pseudoephedrine	0ae49d7e-ceec-4ad6-a0b8-cb20237e2b70	2015-03-19 00:00:00	\N	\N
3523	Pseudoephedrine (Oral Pill)	1154332	Pseudoephedrine	5377d4dd-aad1-4820-bc05-e7dbb152c0f5	2015-10-09 00:00:00	\N	\N
3524	Pseudoephedrine/Triprolidine (Oral Liquid)	1154332	Pseudoephedrine	b7c62fdd-5709-4023-9c30-6970de4ad2b3	2010-12-21 00:00:00	\N	\N
3525	Pseudoephedrine/Triprolidine (Oral Pill)	1154332	Pseudoephedrine	7f1ff0eb-78e9-465d-9ec9-a900fe8bd9c4	2015-04-13 00:00:00	\N	\N
3526	PSORCON (Topical)	960988	Diflorasone	29c78a72-3dde-493f-b6a2-f286bec1f09e	2007-08-06 00:00:00	\N	\N
3527	PSORIASIN (Topical)	1000995	Coal Tar	33b9c589-5953-4c9f-bdd0-d827c3446240	2013-06-03 00:00:00	\N	\N
3528	PSORIASIN WASH (Soap)	964407	Salicylic Acid	3153a8b5-c027-4254-a61b-0c376a38d0f6	2010-10-09 00:00:00	\N	\N
3529	Psyllium (Oral Liquid)	957797	Psyllium	bb6f5b6a-5111-4e50-8897-74e8ab859cfd	2015-06-05 00:00:00	\N	\N
3530	Psyllium (Oral Pill)	957797	Psyllium	ea99f870-428a-4d36-8d2d-0eca0240fb54	2015-07-07 00:00:00	\N	\N
3531	"Psyllium/Sennosides, USP (Oral Pill)"	957797	Psyllium	3b5e5397-fe64-48c5-8607-47c0a0900953	2013-12-04 00:00:00	\N	\N
3532	Pullularia extract (Injectable)	40161386	Pullularia extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
3533	PULMICORT (Inhalant)	939259	Budesonide	2e0fa140-85a0-42db-ba15-a068120076b4	2013-04-19 00:00:00	\N	\N
3534	PULMOZYME (Inhalant)	1125443	Dornase Alfa	d8c78a7e-ff99-48f3-8952-643ec2ea0f86	2015-01-16 00:00:00	\N	\N
3535	PURALUBE (Ophthalmic)	908523	Mineral Oil	6a4a2053-f947-4ce3-a885-a1c1465c8b0b	2014-08-22 00:00:00	\N	\N
3655	Rifampin (Injectable)	1763204	Rifampin	6f03bb2a-1527-42c7-ab43-f4b4f789e69d	2014-09-12 00:00:00	\N	\N
3536	Purified Protein Derivative of Tuberculin (Injectable)	19058274	Purified Protein Derivative of Tuberculin	96d91ba3-9dfe-4420-a835-57647ea30b40	2013-05-22 00:00:00	\N	\N
3537	PYLERA (Oral Pill)	958134	bismuth subcitrate	7fe5d2db-c59d-4e15-acd7-f9df8eca45aa	2011-03-21 00:00:00	\N	\N
3538	Pyrantel (Chewable)	1759270	Pyrantel	8c37db7c-a73e-4d99-a8a9-d55da1a74a3e	2011-12-01 00:00:00	\N	\N
3539	Pyrantel (Oral Liquid)	1759270	Pyrantel	82a9fe66-7646-42cf-9be9-b9e181076e02	2015-08-18 00:00:00	\N	\N
3540	Pyrazinamide (Oral Pill)	1759455	Pyrazinamide	dd5cde5a-4b8b-4b16-92f4-a4b77f5b4ba3	2015-08-13 00:00:00	\N	\N
3541	PYRIDIUM (Oral Pill)	933724	Phenazopyridine	ae0f0808-51ed-43b9-86a3-b947c42da89f	2015-07-30 00:00:00	\N	\N
3542	Pyridostigmine (Oral Pill)	759740	Pyridostigmine	9448c360-0ce2-42fe-9f0c-50f2159e8483	2015-08-07 00:00:00	\N	\N
3543	Pyridostigmine XR (Oral Pill)	759740	Pyridostigmine	93454159-0c58-1980-34b9-4038a2260420	2015-09-30 00:00:00	\N	\N
3544	Pyridoxine (Oral Pill)	19005046	pyridoxine	a524c0ff-4893-4df0-aaca-7f690b2bbb13	2012-07-13 00:00:00	\N	\N
3545	Pyrimethamine (Oral Pill)	1760039	Pyrimethamine	3e4d5027-7939-480f-ae19-82e764d9fa97	2015-10-05 00:00:00	\N	\N
3546	QLEARQUIL ALLERGY RELIEF (Oral Pill)	1107830	Loratadine	486e5b2b-0456-4794-b263-004102f0795a	2014-04-24 00:00:00	\N	\N
3547	QLEARQUIL DAYTIME SINUS & CONGESTION (Oral Pill)	1125315	Acetaminophen	119ee51b-6a7f-451b-bf69-ecb92c6a352b	2014-10-29 00:00:00	\N	\N
3548	QLEARQUIL NASAL DECONGESTANT (Nasal)	925636	Oxymetazoline	9a10ca38-ac96-47ab-ab21-0519c034b8a3	2014-03-06 00:00:00	\N	\N
3549	QUADRAMET (Injectable)	1338558	SAMARIUM Sm153	61e84808-0999-4923-910c-2a480d5f971a	2013-12-27 00:00:00	\N	\N
3550	QUALAQUIN (Oral Pill)	1760616	Quinine	ce2ffee3-3048-43a0-ac45-ee32ce0c4c33	2010-05-27 00:00:00	\N	\N
3551	Quazepam (Oral Pill)	731188	quazepam	5d9472c0-e1df-4365-91c9-b54c7019fad3	2015-03-09 00:00:00	\N	\N
3552	QUELICIN (Injectable)	836208	Succinylcholine	c06156ae-b889-4250-bc85-1435b2635829	2014-06-05 00:00:00	\N	\N
3553	QUESTRAN (Oral Liquid)	19095309	Cholestyramine Resin	362ddd91-a63f-4ec6-841a-75785dd208c8	2015-01-06 00:00:00	\N	\N
3554	QUEtiapine (Oral Pill)	766814	quetiapine	03325ca1-4f51-41a1-92f3-ff7f96e01cc8	2015-10-05 00:00:00	\N	\N
3555	Quinapril (Oral Pill)	1331235	quinapril	a2de05b9-d1aa-4fbb-a9a3-6918cc306f78	2015-10-13 00:00:00	\N	\N
3556	quiNIDine (Injectable)	1360421	Quinidine	11d14362-8f69-4c30-b487-5d05f6462bd7	2014-08-12 00:00:00	\N	\N
3557	quiNIDine (Oral Pill)	1360421	Quinidine	a90a03b0-ffbe-4cf6-90b5-bfb0412a1cb2	2014-07-08 00:00:00	\N	\N
3558	quiNIDine XR (Oral Pill)	1360421	Quinidine	a08a0f0b-6cf5-4fa4-a861-0b054d6fddfc	2014-08-15 00:00:00	\N	\N
3559	quiNINE (Oral Pill)	1760616	Quinine	0b5bbefd-5b56-46f9-84f5-1456371577fd	2015-08-07 00:00:00	\N	\N
3560	QUIXIN (Ophthalmic)	1742253	Levofloxacin	09b3a912-97f9-45ae-a162-9f45c860dc22	2011-09-27 00:00:00	\N	\N
3561	R-GENE 10 (Injectable)	19006410	Arginine	6accf33f-9841-4327-8923-93c42020ef12	2014-04-07 00:00:00	\N	\N
3562	RABEprazole (Oral Pill)	911735	rabeprazole	5a1edab0-a602-4786-9ef5-40063f9efdb4	2015-09-30 00:00:00	\N	\N
3563	"Rabies virus vaccine wistar strain PM-1503-3M (Human), Inactivated (Injectable)"	544505	"rabies virus vaccine wistar strain PM-1503-3M (Human), Inactivated"	ba8d4e72-f452-4859-ae6f-3644b4b0a78c	2013-09-30 00:00:00	\N	\N
3564	Racepinephrine (Inhalant)	1300153	Racepinephrine	5c6d98fe-3e86-4816-92f2-49d38a432e39	2014-12-15 00:00:00	\N	\N
3565	RADIOGARDASE (Oral Pill)	19095769	Prussian blue	baa68c79-5f3d-468a-a510-58b9e978cd50	2014-09-11 00:00:00	\N	\N
3566	RADIUM CHLORIDE RA-223 (Injectable)	43526934	RADIUM CHLORIDE RA-223	a398400e-bd31-41a9-9696-4f7c06569ede	2013-05-20 00:00:00	\N	\N
3567	RAGWITEK (Sublingual)	40171301	short ragweed pollen extract	986abfaf-67fc-47fb-8c86-d9f9cce6fa8b	2015-02-26 00:00:00	\N	\N
3568	Raloxifene (Oral Pill)	1513103	Raloxifene	7f4bd906-2af7-4f93-af23-6f13b0f5d868	2015-09-29 00:00:00	\N	\N
3569	Raltegravir (Oral Pill)	1712889	raltegravir	e463b253-ad05-4e5c-8a3b-595d55c56ed7	2013-04-11 00:00:00	\N	\N
3570	Ramelteon (Oral Pill)	781182	ramelteon	7a51d289-2013-4d37-adf2-91ea49df7932	2010-01-21 00:00:00	\N	\N
3571	Ramipril (Oral Pill)	1334456	Ramipril	2dbd4a0a-09f6-4295-8852-613bd3a0fbfb	2015-09-28 00:00:00	\N	\N
3572	Ranibizumab (Injectable)	19080982	ranibizumab	de4e66cc-ca05-4dc9-8262-e00e9b41c36d	2015-02-26 00:00:00	\N	\N
3573	Ranitidine (Injectable)	961047	Ranitidine	9268c1df-bcf3-4899-896d-044492802a33	2013-08-06 00:00:00	\N	\N
3574	Ranitidine (Oral Liquid)	961047	Ranitidine	dd7a6355-0341-4bce-a942-2a8bba3fb669	2015-08-27 00:00:00	\N	\N
3575	Ranitidine (Oral Pill)	961047	Ranitidine	b8be814d-24ff-4b46-9b50-187aa1b4aaa0	2015-10-02 00:00:00	\N	\N
3576	RAPAMUNE (Oral Pill)	19034726	Sirolimus	0f26220a-f4ab-4ceb-9a98-a13dbdeed81f	2011-05-12 00:00:00	\N	\N
3577	Rasagiline (Oral Pill)	715710	rasagiline	eb558270-1b12-4704-9b09-39f668f30529	2010-12-23 00:00:00	\N	\N
3578	RASH RELIEF ANTIBACTERIAL (Topical)	915175	Bacitracin	f439fb97-0722-42ee-bc90-67daf0497aa8	2011-11-16 00:00:00	\N	\N
3579	RASH RELIEF ANTIFUNGAL (Topical)	916662	dimethicone	4114c685-acd1-4c65-842b-1cb7840852dc	2011-11-16 00:00:00	\N	\N
3580	RASH RELIEF CLEAR (Topical)	916662	dimethicone	0b5753aa-b591-4d6e-8341-fcc9456299b6	2011-11-16 00:00:00	\N	\N
3581	RASH RELIEF WITH ZINC OXIDE (Topical)	916662	dimethicone	54d7250e-6aaa-4fc8-88b3-2fee58ebaf73	2011-11-07 00:00:00	\N	\N
3582	RAYOS (Oral Pill)	1551099	Prednisone	281ab967-7565-4bef-9c0c-a646589c671e	2014-02-18 00:00:00	\N	\N
3583	RAZADYNE (Oral Pill)	757627	Galantamine	e62efb5a-d2cc-4e11-9e61-10e65ef3d897	2011-02-24 00:00:00	\N	\N
3584	REA LO (Topical)	906914	Urea	5fcff124-7709-4137-af94-539246e331f4	2014-09-02 00:00:00	\N	\N
3585	REA-LO (Topical)	906914	Urea	bac5d4a7-2819-48f4-a0de-00d1c2d5ed31	2014-08-15 00:00:00	\N	\N
3586	RECOMBINATE (Injectable)	1352213	Factor VIII	2a569ec5-08d7-44ab-b649-384a496e173c	2012-01-03 00:00:00	\N	\N
3587	RECOTHROM (Topical)	1300673	Thrombin	af304504-85af-87ba-edb6-9bf35985cba8	2015-05-18 00:00:00	\N	\N
3588	RECTICARE (Rectal)	989878	Lidocaine	49cb48cf-7a26-4d7a-887f-2e98261d269d	2014-12-10 00:00:00	\N	\N
3589	RECTIV (Rectal)	1361711	Nitroglycerin	af05dde8-1c06-4cd5-bcd0-8e318874536a	2014-10-23 00:00:00	\N	\N
3590	Red mulberry pollen extract (Injectable)	40161918	red mulberry pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3591	Red pine pollen extract (Injectable)	40172530	red pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3592	Redberry juniper pollen extract (Injectable)	40172534	redberry juniper pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3593	Redroot pigweed pollen extract (Injectable)	40161926	redroot pigweed pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3656	Rifampin (Oral Pill)	1763204	Rifampin	26a2dbca-5090-4f6c-99ed-e11a70bb5af0	2015-08-27 00:00:00	\N	\N
3594	Redtop grass pollen extract (Injectable)	40161930	redtop grass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3595	Redwood pollen extract (Injectable)	40228820	redwood pollen extract	3b904f52-6163-4095-a456-11b3018b227a	2009-12-15 00:00:00	\N	\N
3596	REFENESEN (Oral Pill)	1163944	Guaifenesin	8a172972-d5dd-4c0e-8359-b5fd9edc96d8	2010-11-04 00:00:00	\N	\N
3597	REFENESEN PE (Oral Pill)	1163944	Guaifenesin	5667fc64-88b5-4caa-87bb-f08808a1d35c	2014-09-25 00:00:00	\N	\N
3598	REFISSA (Topical)	903643	Tretinoin	fda09c9d-efee-40dc-8030-065ceacd7a5c	2015-05-01 00:00:00	\N	\N
3599	REFRESH DROPS (Ophthalmic)	949279	Carboxymethylcellulose	cd467181-9d56-4b11-9826-15b5357d0689	2014-12-29 00:00:00	\N	\N
3600	REFRESH LACRI-LUBE (Ophthalmic)	908523	Mineral Oil	d232a44b-516d-4cdf-a4e7-c3a9a50dc7af	2012-06-27 00:00:00	\N	\N
3601	REFRESH LIQUIGEL (Ophthalmic)	949279	Carboxymethylcellulose	4b8b2f6a-4b89-446c-9e5b-9b83c453a01d	2014-04-22 00:00:00	\N	\N
3602	REFRESH LUBRICANT (Ophthalmic)	948856	Polyvinyl Alcohol	31bf1d6c-9719-4060-b6a3-409a2fe7b560	2015-04-29 00:00:00	\N	\N
3603	REFRESH OPTIVE SENSITIVE (Ophthalmic)	949279	Carboxymethylcellulose	7f8d88af-fd3b-4138-af61-f24c59ccebd7	2014-07-24 00:00:00	\N	\N
3604	REFRESH PM (Ophthalmic)	908523	Mineral Oil	24365d64-cd94-41cc-a7e1-033102d98114	2014-08-05 00:00:00	\N	\N
3605	REGENECARE (Topical)	989878	Lidocaine	c3eec066-38e8-4617-b34d-2f72ffb7a324	2013-06-19 00:00:00	\N	\N
3606	REGIMEX (Oral Pill)	719128	Benzphetamine	1a5d7233-4453-42a5-8144-a4276db39660	2013-03-14 00:00:00	\N	\N
3607	REGITINE (Injectable)	1335539	Phentolamine	6db10859-2a3f-4782-ac33-94300463658f	2006-10-13 00:00:00	\N	\N
3608	REGLAN (Oral Pill)	906780	Metoclopramide	55f1ee88-a455-44ba-b51a-2fcefe8eda65	2014-12-10 00:00:00	\N	\N
3609	REGRANEX (Topical)	912476	Becaplermin	fd2c7d21-7b07-4ab3-8983-816ab3223771	2015-03-02 00:00:00	\N	\N
3610	REGULOID (Oral Liquid)	957797	Psyllium	f25f3b52-8ac4-4be5-8830-f0a50d19008b	2013-07-12 00:00:00	\N	\N
3611	RELAGESIC (Oral Pill)	1125315	Acetaminophen	8f1bb6e5-3de5-48b4-bf44-d4e881be5ab0	2012-05-21 00:00:00	\N	\N
3612	RELCOF C (Oral Liquid)	1201620	Codeine	357c9914-8d87-43d0-ba2f-516a0a455175	2011-03-09 00:00:00	\N	\N
3613	RELPAX (Oral Pill)	1189697	eletriptan	6bb510c8-2ae2-4159-b4c6-0aec5e64b4c9	2014-03-18 00:00:00	\N	\N
3614	REMBRANDT (Toothpaste)	19069022	Sodium Fluoride	11df694e-1594-4eb4-9318-05d6bab51335	2012-08-14 00:00:00	\N	\N
3615	REMEDY ANTIFUNGAL (Topical)	907879	Miconazole	c31bb2b7-f84b-4c58-8da9-78f3d305419d	2014-02-21 00:00:00	\N	\N
3616	REMEDY ZINC SKIN PROTECTANT (Paste)	19033354	Petrolatum	f830a0e4-dba5-4a5f-af35-3832ec70d4d3	2014-04-09 00:00:00	\N	\N
3617	REMERON (Oral Pill)	725131	Mirtazapine	8feda54f-a3fa-4108-bfc4-c15b0eab4396	2012-02-21 00:00:00	\N	\N
3618	REMEVEN (Topical)	906914	Urea	f5e87f91-e355-4347-ae9b-f38b41802cf3	2011-05-11 00:00:00	\N	\N
3619	Remifentanil (Injectable)	19016749	remifentanil	dbc63b6e-f8c5-4fd0-8ec3-4f5e19125313	2015-03-16 00:00:00	\N	\N
3620	RENACIDIN (Irrigation)	950435	Citric Acid	bdb3cef8-79c4-4322-9a21-c13123abe0cc	2013-03-21 00:00:00	\N	\N
3621	RENAGEL (Oral Pill)	952004	sevelamer	ee835dc1-36b7-4447-a5c6-5ed9e06a839d	2014-07-23 00:00:00	\N	\N
3622	RENESE-R (Oral Pill)	948787	Polythiazide	b503fa5e-5726-426d-867c-e8fe59ed3ead	2006-10-13 00:00:00	\N	\N
3623	RENOVA (Topical)	903643	Tretinoin	9f0a0e8d-1051-48a4-80c5-1bd260dd9c36	2014-08-19 00:00:00	\N	\N
3624	RENVELA (Oral Pill)	952004	sevelamer	6178c669-a2e5-4a82-9ca2-7dfef56b63b9	2011-09-02 00:00:00	\N	\N
3625	Repaglinide (Oral Pill)	1516766	repaglinide	457c2638-86cd-4afc-b562-eea925e9d42a	2015-06-04 00:00:00	\N	\N
3626	REPREXAIN (Oral Pill)	1174888	Hydrocodone	ae37a79e-ca8f-44d7-83a3-96cf2ebebedd	2014-10-01 00:00:00	\N	\N
3627	REQUIP (Oral Pill)	713823	ropinirole	de0bb94f-4fd8-4f27-5ba6-6f392dd5160f	2014-09-05 00:00:00	\N	\N
3628	RESCON TABLETS (Oral Pill)	1188114	dexchlorpheniramine	9d08d801-6cca-4a1c-ab53-5979f16e3110	2012-03-30 00:00:00	\N	\N
3629	RESCON-GG (Oral Liquid)	1163944	Guaifenesin	af378f6d-d506-47b0-8044-5e184ebc5d6a	2013-02-19 00:00:00	\N	\N
3630	RESCRIPTOR (Oral Pill)	1747157	Delavirdine	992306f0-c612-41dd-a4df-35d1fd360033	2011-07-07 00:00:00	\N	\N
3631	RESINOL (Topical)	19033354	Petrolatum	03f57a4a-f94b-4ba6-b709-41cfb6e16261	2014-01-03 00:00:00	\N	\N
3632	Resorcinol/Sulfur (Topical)	935390	resorcinol	d30564d2-c27f-44ce-ac21-e24b45acac81	2014-10-24 00:00:00	\N	\N
3633	RESPAIRE (Oral Pill)	1163944	Guaifenesin	bd8e9558-235a-42f6-81c3-f3c80b2b235d	2011-11-29 00:00:00	\N	\N
3634	RETAINE (Ophthalmic)	949279	Carboxymethylcellulose	6b40c38e-31f8-4aca-9456-04128e6c2e93	2011-10-03 00:00:00	\N	\N
3635	RETAINE HPMC (Ophthalmic)	902251	hypromellose	ba8f8be3-4641-bc28-2ec0-2ff9f4f9be9f	2013-06-20 00:00:00	\N	\N
3636	Retapamulin (Topical)	991003	retapamulin	5da8f60f-c809-4161-a802-6fe823d532bb	2010-10-09 00:00:00	\N	\N
3637	RETAVASE (Injectable)	19024191	Reteplase	e9ae6656-977c-4105-8528-bee664aab27a	2010-01-06 00:00:00	\N	\N
3638	Reteplase (Injectable)	19024191	Reteplase	e9ae6656-977c-4105-8528-bee664aab27a	2010-01-06 00:00:00	\N	\N
3639	RETIN-A (Topical)	903643	Tretinoin	0ee4fccd-087f-4134-9b66-1d5186c116c0	2014-05-01 00:00:00	\N	\N
3640	REVATIO (Oral Pill)	1316262	sildenafil	f757f066-8288-4d6c-8c5e-2471007c7966	2012-08-20 00:00:00	\N	\N
3641	REVONTO (Injectable)	711714	Dantrolene	0055d78a-9dc2-4267-8c9e-c3f2c98a66ff	2014-12-23 00:00:00	\N	\N
3642	REYATAZ (Oral Pill)	1727223	Atazanavir	025876b6-f031-43ea-967a-b1d95b4685a6	2012-02-28 00:00:00	\N	\N
3643	REZAMID (Topical)	935390	resorcinol	d02ace0b-7244-45d4-987f-eb569303a426	2014-10-24 00:00:00	\N	\N
3644	REZIRA (Oral Liquid)	1174888	Hydrocodone	7b873615-d90e-41a1-acc6-60f0526eeead	2014-10-09 00:00:00	\N	\N
3645	RHEUMATREX (Oral Pill)	1305058	Methotrexate	2cb70aa1-f73a-41c8-9a7f-edbcf1a06efd	2013-03-12 00:00:00	\N	\N
3646	RI-MOX PLUS (Oral Liquid)	985247	Aluminum Hydroxide	a21a94c5-7981-4cf9-af23-fc397b7ded1c	2013-04-10 00:00:00	\N	\N
3647	RIASTAP (Injectable)	19044986	fibrinogen concentrate (human)	903dc8d0-39da-462c-9dac-004e0c7a26cc	2012-02-01 00:00:00	\N	\N
3648	RIAX (Topical)	918172	Benzoyl Peroxide	a585dbbe-a316-4183-bb6e-24a1b52966c3	2013-10-18 00:00:00	\N	\N
3649	Ribavirin (Oral Pill)	1762711	Ribavirin	3b8b0c65-e466-4662-9e85-5a253d31ebe8	2015-06-04 00:00:00	\N	\N
3650	RIDAURA (Oral Pill)	1114771	Auranofin	05c34ddf-a0f7-4267-83f5-d02be3defc37	2011-12-15 00:00:00	\N	\N
3651	Rifabutin (Oral Pill)	1777417	Rifabutin	4be9cc3f-0016-4426-a700-574b45ce245b	2015-09-23 00:00:00	\N	\N
3652	RIFADIN (Injectable)	1763204	Rifampin	036ab68e-5085-4edc-bd83-784b43d64eab	2014-07-24 00:00:00	\N	\N
3653	RIFADIN (Oral Pill)	1763204	Rifampin	036ab68e-5085-4edc-bd83-784b43d64eab	2014-07-24 00:00:00	\N	\N
3654	RIFAMATE (Oral Pill)	1782521	isoniazid	3cc36609-8e2d-4caa-a8e0-c0367e3e52df	2014-02-14 00:00:00	\N	\N
3657	RIFATER (Oral Pill)	1782521	isoniazid	429a2f62-9fe6-4299-b314-92a9d22b1381	2013-04-24 00:00:00	\N	\N
3658	Rifaximin (Oral Pill)	1735947	rifaximin	523f0320-cc73-445a-a48d-7a181c182307	2013-08-23 00:00:00	\N	\N
3659	Rilonacept (Injectable)	19023450	rilonacept	282f4099-e848-432a-bac1-e041c192a5ba	2015-03-06 00:00:00	\N	\N
3660	RILUTEK (Oral Pill)	735951	Riluzole	e49d207d-8e32-4183-94ba-cd264f124090	2014-01-23 00:00:00	\N	\N
3661	Riluzole (Oral Pill)	735951	Riluzole	4c851be4-f0d0-4b24-baf9-427ddfc6f7b0	2015-05-11 00:00:00	\N	\N
3662	Rimantadine (Oral Liquid)	1763339	Rimantadine	9c7bb7e7-a775-4f93-bd77-d08c48a86f7c	2007-07-19 00:00:00	\N	\N
3663	Rimantadine (Oral Pill)	1763339	Rimantadine	49f7d69a-820b-4c75-a31d-b2104c019c12	2014-07-08 00:00:00	\N	\N
3664	RIMSO-50 (Irrigation)	928980	Dimethyl Sulfoxide	58b25d79-78f2-4953-b0c6-61658dc4ef0d	2013-06-04 00:00:00	\N	\N
3665	Risedronate (Oral Pill)	1516800	Risedronate	ef2dbc86-b4f5-4990-a83f-0b121cfe2ec1	2015-06-02 00:00:00	\N	\N
3666	RisperDAL (Oral Pill)	735979	Risperidone	ccb70f90-9ef1-4eac-925f-0178cacdac6b	2013-05-07 00:00:00	\N	\N
3667	risperiDONE (Oral Disintegrating)	735979	Risperidone	7073b706-1946-4ff2-8788-fb9452a59cae	2015-09-02 00:00:00	\N	\N
3668	risperiDONE (Oral Liquid)	735979	Risperidone	5ceafd11-de77-4a91-9873-3ce0ae688397	2015-01-30 00:00:00	\N	\N
3669	risperiDONE (Oral Pill)	735979	Risperidone	24a5d048-b351-4df5-89c8-f68147daba88	2015-09-30 00:00:00	\N	\N
3670	RITALIN (Oral Pill)	705944	Methylphenidate	cd83fc91-47a3-4be4-9727-caf9ec0371e8	2012-01-30 00:00:00	\N	\N
3671	Ritonavir (Oral Pill)	1748921	Ritonavir	624120b3-0a32-42a7-abfc-324e6b6c93df	2015-07-30 00:00:00	\N	\N
3672	Rivaroxaban (Oral Pill)	40241331	Rivaroxaban	10db92f9-2300-4a80-836b-673e1ae91610	2015-03-25 00:00:00	\N	\N
3673	Rivastigmine (Oral Pill)	733523	rivastigmine	36b4f524-90e6-415c-8c0c-8983da2c7fd4	2015-10-01 00:00:00	\N	\N
3674	Rizatriptan (Oral Disintegrating)	1154077	rizatriptan	57ed2505-28f1-4292-b3c3-a49bf0f7c683	2015-09-17 00:00:00	\N	\N
3675	Rizatriptan (Oral Pill)	1154077	rizatriptan	2978b28c-91e1-4b17-9670-7b03717c1711	2015-09-28 00:00:00	\N	\N
3676	ROBAFEN (Oral Liquid)	1163944	Guaifenesin	a925e169-a63d-4614-925e-e556daef9ec5	2014-02-14 00:00:00	\N	\N
3677	ROBAFEN AC (Oral Liquid)	1201620	Codeine	e4bf6ada-e8b4-49e1-98aa-0fde1d0a7e47	2012-04-10 00:00:00	\N	\N
3678	ROBAFEN COUGH (Oral Pill)	1119510	Dextromethorphan	9b6295c7-377b-4392-83b1-13018b0bc295	2015-08-28 00:00:00	\N	\N
3679	ROBAFEN DM (Oral Liquid)	1119510	Dextromethorphan	c1c85b72-0883-4409-ba9c-d9f8d4f63825	2015-08-03 00:00:00	\N	\N
3680	ROBAXIN (Injectable)	704943	Methocarbamol	8f91e243-7395-4ec9-adf5-37520983daf2	2012-06-26 00:00:00	\N	\N
3681	ROBAXIN (Oral Pill)	704943	Methocarbamol	5666ece8-9a10-4dcc-a7dc-3cd29df10e28	2012-05-15 00:00:00	\N	\N
3682	ROBINUL (Injectable)	963353	Glycopyrrolate	3adddbd4-0b17-4312-83a2-a8420caf045e	2012-03-30 00:00:00	\N	\N
3683	ROBINUL (Oral Pill)	963353	Glycopyrrolate	bd65ee5e-2000-423c-b0a6-72eb213455c4	2012-09-11 00:00:00	\N	\N
3684	ROBITUSSIN CHEST CONGESTION (Oral Liquid)	1163944	Guaifenesin	259c8b69-c625-4146-b888-34ef43b8385f	2015-03-31 00:00:00	\N	\N
3685	ROBITUSSIN COUGH GELS (Oral Pill)	1119510	Dextromethorphan	a19d233a-bc41-4603-dcbc-e15088045c2d	2012-06-01 00:00:00	\N	\N
3686	ROBITUSSIN NIGHTTIME COUGH DM (Oral Liquid)	1119510	Dextromethorphan	598ea332-9cf3-403f-9fdc-991cbc62d744	2013-03-01 00:00:00	\N	\N
3687	ROBITUSSIN PEAK COLD NASAL (Oral Pill)	1125315	Acetaminophen	fb7e074d-4c4f-892e-f34e-13b9803fc436	2011-12-22 00:00:00	\N	\N
3688	ROBITUSSIN PEDIATRIC COUGH & COLD LA (Oral Liquid)	1192710	Chlorpheniramine	becb4025-b63e-f2ea-9d11-d51fdf4e5c13	2010-10-09 00:00:00	\N	\N
3689	ROBITUSSIN PEDIATRIC COUGH SUPPRESSANT (Oral Liquid)	1119510	Dextromethorphan	75bc7827-4439-e6a8-a65c-7154d5592e58	2012-10-02 00:00:00	\N	\N
3690	ROCALTROL (Oral Liquid)	19035631	Calcitriol	d1013494-bf62-4e68-9f0c-e6571137f20f	2011-10-13 00:00:00	\N	\N
3691	ROCALTROL (Oral Pill)	19035631	Calcitriol	d1013494-bf62-4e68-9f0c-e6571137f20f	2011-10-13 00:00:00	\N	\N
3692	Rocuronium (Injectable)	19003953	Rocuronium	6ec8c417-6613-45e0-bc86-293a8b1ee83f	2015-03-12 00:00:00	\N	\N
3693	Roflumilast (Oral Pill)	40236897	Roflumilast	c9a1d0a8-581f-4f91-a2b8-f419192d0ebf	2015-07-01 00:00:00	\N	\N
3694	ROGAINE (Topical)	1309068	Minoxidil	88f17a5a-a8e3-488a-8a96-8bd6f150c043	2015-09-15 00:00:00	\N	\N
3695	ROLAIDS REFORMULATED AUG 2006 (Chewable)	19035704	Calcium Carbonate	50aa27e4-00c9-477a-88c0-a10de1fa3f75	2014-06-19 00:00:00	\N	\N
3696	ROMAZICON (Injectable)	19055153	Flumazenil	69049fa6-7dc4-4ae7-99f4-06839af06498	2010-09-13 00:00:00	\N	\N
3697	romiDEPsin (Injectable)	40168385	romidepsin	6005c345-ccf9-4fff-8660-3fd73485b0d9	2010-01-04 00:00:00	\N	\N
3698	rOPINIRole (Oral Pill)	713823	ropinirole	de0bb94f-4fd8-4f27-5ba6-6f392dd5160f	2015-07-28 00:00:00	\N	\N
3699	Ropivacaine (Injectable)	1136487	ropivacaine	05b3b09e-e54c-4933-8913-5279d04b521d	2014-09-19 00:00:00	\N	\N
3700	ROSADAN (Topical)	1707164	Metronidazole	99eaa138-0cfa-45e1-abbf-a88271707979	2012-04-16 00:00:00	\N	\N
3701	Rosiglitazone (Oral Pill)	1547504	rosiglitazone	dd8d7ec8-79b0-4152-8789-d247c77232ce	2015-06-11 00:00:00	\N	\N
3702	Rosuvastatin (Oral Pill)	1510813	rosuvastatin	2c1a3c18-fa77-401b-8784-8e18b0d862f1	2015-09-28 00:00:00	\N	\N
3703	Rough cocklebur pollen extract (Injectable)	40222500	rough cocklebur pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3704	ROWASA (Rectal)	968426	mesalamine	a666d21d-da21-498d-aea2-055326cafd70	2009-12-04 00:00:00	\N	\N
3705	ROXICODONE (Oral Pill)	1124957	Oxycodone	5a8157d3-ba20-4abf-b0d4-6ad141b31d63	2015-01-07 00:00:00	\N	\N
3706	ROZEREM (Oral Pill)	781182	ramelteon	7a51d289-2013-4d37-adf2-91ea49df7932	2010-01-21 00:00:00	\N	\N
3707	RU HIST D (Oral Pill)	1135766	Phenylephrine	ae3f15f0-d7ac-4be7-93c2-67d2ed82f4dc	2012-02-24 00:00:00	\N	\N
3708	RYANODEX (Injectable)	711714	Dantrolene	8f7b3ac0-604d-4c78-b545-5e0f8ea3d698	2014-08-04 00:00:00	\N	\N
3709	RYMED-D (Oral Pill)	1188114	dexchlorpheniramine	c1d6e914-74cc-4cdf-9587-7eaaa4a386e5	2013-04-01 00:00:00	\N	\N
3710	RYNEZE (Oral Liquid)	1192710	Chlorpheniramine	9aca3d25-d042-479b-a00e-63be5b5073fe	2010-07-20 00:00:00	\N	\N
3711	Sacrosidase (Oral Liquid)	951980	Sacrosidase	d613bb7f-c3f4-462e-81a2-da2347cc4b6b	2015-05-29 00:00:00	\N	\N
3712	SAFETUSSIN DM (Oral Liquid)	1119510	Dextromethorphan	ac9f25a7-03cc-461b-af3e-8c16b7146a22	2015-07-01 00:00:00	\N	\N
3713	SAFETUSSIN PM (Oral Liquid)	1119510	Dextromethorphan	0f7e2c22-0c59-4027-ad61-6bdd048a605c	2015-07-01 00:00:00	\N	\N
3714	SALACYN (Topical)	964407	Salicylic Acid	ac10b92d-2103-41cd-a819-440d35818532	2010-12-08 00:00:00	\N	\N
3715	SALAGEN (Oral Pill)	945286	Pilocarpine	fb4810ec-d26f-429d-b87c-5898a7870169	2010-05-11 00:00:00	\N	\N
3716	SALEX (Shampoo)	964407	Salicylic Acid	bd9eca8a-87df-46c8-b731-9d8211296e0c	2013-07-19 00:00:00	\N	\N
3717	SALEX (Topical)	964407	Salicylic Acid	bd9eca8a-87df-46c8-b731-9d8211296e0c	2013-07-19 00:00:00	\N	\N
3718	Salicylic Acid (Paste)	964407	Salicylic Acid	6d3298e8-f623-4771-8497-fb43b5434923	2013-05-29 00:00:00	\N	\N
3719	Salicylic Acid (Shampoo)	964407	Salicylic Acid	a6b3a6ef-a285-4d77-b4c6-3372a3192ec3	2015-05-22 00:00:00	\N	\N
3720	Salicylic Acid (Soap)	964407	Salicylic Acid	72f2fd8e-4d6c-4944-83a4-5f07f7726598	2015-09-30 00:00:00	\N	\N
3721	Salicylic Acid (Topical)	964407	Salicylic Acid	b33d61f2-386b-4a8d-a4c9-8e1373eddd53	2015-10-01 00:00:00	\N	\N
3722	Salicylic Acid (Transdermal)	964407	Salicylic Acid	fa2e95b5-fe90-4406-b981-05bca62fd25c	2015-04-03 00:00:00	\N	\N
3723	Salicylic Acid/Sulfur (Shampoo)	964407	Salicylic Acid	7afc2219-712b-4a0c-b8a9-725f41cbf343	2013-12-18 00:00:00	\N	\N
3724	Salmon calcitonin (Injectable)	1537655	salmon calcitonin	2a27340f-26e7-4003-b817-60de6696088b	2015-09-30 00:00:00	\N	\N
3725	Salmon calcitonin (Nasal)	1537655	salmon calcitonin	a6eaedb3-5c96-4859-be43-a48c9c818bc7	2014-09-12 00:00:00	\N	\N
3726	SALONPAS (Transdermal)	939881	Capsaicin	ef5373aa-9857-4d01-95af-2d7716e54ae4	2013-12-20 00:00:00	\N	\N
3727	SALONPAS GEL-PATCH (Transdermal)	939881	Capsaicin	ee0ec612-3abd-4365-bfd4-9fa69abf0186	2013-12-17 00:00:00	\N	\N
3728	SALONPAS MASSAGE FOAM (Topical)	901656	Menthol	bf478e06-408c-4958-b98f-68570b14a2de	2011-05-02 00:00:00	\N	\N
3729	SALONPAS PAIN RELIEF PATCH (Transdermal)	901656	Menthol	2e88c933-89e6-4a48-be7a-dc6a36e5c8f8	2013-09-27 00:00:00	\N	\N
3730	SALONPAS PAIN RELIEVING PATCH (Transdermal)	938205	Camphor	1ebe6a18-5247-4172-93ee-161416db060d	2015-07-16 00:00:00	\N	\N
3731	Salsalate (Oral Pill)	1137460	Salsalate	ae3ee7d8-1a27-4148-8527-102d3d95d3d9	2015-07-01 00:00:00	\N	\N
3732	Saltbush pollen extract (Injectable)	40172670	saltbush pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3733	SALURON (Oral Pill)	1376289	Hydroflumethiazide	6153ef9e-77f0-4233-a5bc-3e3d1f732323	2006-10-13 00:00:00	\N	\N
3734	SALVAX (Topical)	964407	Salicylic Acid	879e31b4-3449-40ce-9b34-815563d4e272	2010-12-08 00:00:00	\N	\N
3735	SAMARIUM Sm153 (Injectable)	1338558	SAMARIUM Sm153	89cae12d-05fc-4d53-920f-e271b2940a5d	2013-12-27 00:00:00	\N	\N
3736	SandoSTATIN (Injectable)	1522957	Octreotide	4e2c9856-1836-49f0-9472-4dbeeb408f39	2014-02-18 00:00:00	\N	\N
3737	SANSERT (Oral Pill)	1106740	Methysergide	3fae28ee-700e-4d4f-a040-02ef01a2aeb4	2006-08-21 00:00:00	\N	\N
3738	SANTYL (Topical)	980311	COLLAGENASE	a7bf0341-49ff-4338-a339-679a3f3f953d	2014-02-03 00:00:00	\N	\N
3739	SAPHRIS (Sublingual)	40164052	Asenapine	5429f134-839f-4ffc-9944-55f51238def8	2015-03-23 00:00:00	\N	\N
3740	Saquinavir (Oral Pill)	1746244	Saquinavir	b8b53129-06ab-4143-b9b7-7675e49a52ef	2010-09-22 00:00:00	\N	\N
3741	SARAPIN (Injectable)	19030860	SARRACENIA PURPUREA preparation	2c51acbc-033b-40a2-93b1-81ba89223b13	2015-03-12 00:00:00	\N	\N
3742	Sargramostim (Injectable)	1308432	sargramostim	c96afe62-f0cf-4d4b-b57d-194a8ec12389	2013-08-06 00:00:00	\N	\N
3743	SARNA (Topical)	938205	Camphor	a64e2fdb-54ba-4a5a-b31b-85a1d4d871eb	2014-08-15 00:00:00	\N	\N
3744	SARNA SENSITIVE (Topical)	927478	pramoxine	6fe48995-0b1c-48dd-bc6e-5d41b31a6486	2014-08-25 00:00:00	\N	\N
3745	SARRACENIA PURPUREA preparation (Injectable)	19030860	SARRACENIA PURPUREA preparation	2c51acbc-033b-40a2-93b1-81ba89223b13	2015-03-12 00:00:00	\N	\N
3746	SAVELLA (Oral Pill)	19080226	milnacipran	9b3d078b-d12f-47ef-baa4-35b88b090ed4	2013-01-11 00:00:00	\N	\N
3747	Saxagliptin (Oral Pill)	40166035	saxagliptin	d45fc842-2563-4421-86af-a55b3191e19b	2015-09-10 00:00:00	\N	\N
3748	SCALPICIN ITCH RELIEF (Topical)	975125	Hydrocortisone	7b1a29fa-b266-43e6-a87b-aa3c96ab4041	2012-11-19 00:00:00	\N	\N
3749	SCALPICIN SCALP RELIEF (Topical)	964407	Salicylic Acid	c072181f-827e-4e55-93e6-74929eabdbd1	2013-02-22 00:00:00	\N	\N
3750	SCANDONEST (Injectable)	702774	Mepivacaine	7215f107-d1ca-466d-8f4b-f86e5249d39b	2013-07-31 00:00:00	\N	\N
3751	SCLEROSOL (Topical)	1036667	Talc	c89eb8fd-6c31-4f8b-8103-1f559424eda1	2013-07-01 00:00:00	\N	\N
3752	Scopolamine (Injectable)	965748	Scopolamine	b85b3ca0-89ce-44fe-b748-62e160e8c349	2012-08-31 00:00:00	\N	\N
3753	SCOT-TUSSIN (Oral Liquid)	1163944	Guaifenesin	2cd6ab31-1fae-4737-b6af-50586323b751	2013-01-25 00:00:00	\N	\N
3754	SCOT-TUSSIN DM (Oral Liquid)	1119510	Dextromethorphan	4f0aefe3-e80f-44b8-bc24-1a325f36c2d3	2013-01-31 00:00:00	\N	\N
3755	SCOT-TUSSIN SUGAR FREE DM (Oral Liquid)	1192710	Chlorpheniramine	17bfd444-32a5-4036-a5fc-eb11b977e1e5	2013-01-25 00:00:00	\N	\N
3756	Scotch pine pollen extract (Injectable)	40171787	Scotch pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3757	SCYTERA (Topical)	1000995	Coal Tar	3637ca89-694d-4061-a23d-e691093276e7	2010-10-09 00:00:00	\N	\N
3758	SEB-PREV (Topical)	1036252	Sulfacetamide	51e81749-8306-4e3e-9165-28c34cdcca62	2010-09-14 00:00:00	\N	\N
3759	SEBEX (Shampoo)	964407	Salicylic Acid	aec81d61-1d28-490f-9654-f66bd4a30ffa	2013-01-15 00:00:00	\N	\N
3760	Secobarbital (Oral Pill)	766067	Secobarbital	19647025-6c7b-4079-8040-51e26347b014	2015-07-07 00:00:00	\N	\N
3761	SECONAL SODIUM (Oral Pill)	766067	Secobarbital	6698bc44-b971-49cc-a5de-11e569493c59	2015-07-07 00:00:00	\N	\N
3762	SECTRAL (Oral Pill)	1319998	Acebutolol	7eee95bf-0452-4d6e-9712-33403768695a	2012-01-31 00:00:00	\N	\N
3763	Selegiline (Oral Disintegrating)	766209	Selegiline	380d7717-2a79-42f3-a712-efe5e7696ba0	2015-01-13 00:00:00	\N	\N
3764	Selegiline (Oral Pill)	766209	Selegiline	ed802863-bf91-46a4-9c44-a6c5ce905edc	2015-10-01 00:00:00	\N	\N
3765	Selenious Acid (Injectable)	19038024	Selenious Acid	db7454bc-4f18-4632-b771-2e86db889bae	2014-08-25 00:00:00	\N	\N
3766	Selenium sulfide (Shampoo)	938061	selenium sulfide	4a90c2c6-f2a5-4c0d-8879-b7d6863ea179	2015-06-29 00:00:00	\N	\N
3767	Selenium sulfide (Topical)	938061	selenium sulfide	4b0c6317-7473-45de-b704-5d48d5c2dbe9	2010-12-08 00:00:00	\N	\N
3768	SELRX (Shampoo)	938061	selenium sulfide	44170482-124c-4d18-a4b5-fb5f39514689	2013-09-06 00:00:00	\N	\N
3769	SELSUN BLUE (Shampoo)	938061	selenium sulfide	f97e458c-cce3-498f-81fc-1b96a4e8f50a	2015-05-22 00:00:00	\N	\N
3770	SELSUN BLUE NATURALS (Shampoo)	964407	Salicylic Acid	ed031a0f-7467-4b2c-a6b6-95306f6ee828	2015-05-22 00:00:00	\N	\N
3771	SELZENTRY (Oral Pill)	1787101	maraviroc	2b5e5c5d-852a-413b-825c-8491d4539e67	2013-02-19 00:00:00	\N	\N
3772	SEMPREX-D (Oral Pill)	1140123	acrivastine	d86c6a13-9e5f-43c2-92f5-c7ed7bfcedfc	2015-05-06 00:00:00	\N	\N
3773	SENEXON (Oral Liquid)	938268	"sennosides, USP"	90983cc4-04cf-4cfc-a705-5681b985e6a0	2014-06-23 00:00:00	\N	\N
3774	SENEXON (Oral Pill)	938268	"sennosides, USP"	ffc422f2-a3e0-4b48-8186-a11e4088c85e	2011-09-27 00:00:00	\N	\N
3775	SENEXON S (Oral Pill)	941258	Docusate	bb2064aa-b820-4e07-962a-a506145942df	2014-05-23 00:00:00	\N	\N
3776	SENNA LAX (Oral Pill)	938268	"sennosides, USP"	0398229e-2e65-43cf-9e76-cfdd6ac5da46	2015-08-31 00:00:00	\N	\N
3777	"Sennosides, USP (Chewable)"	938268	"sennosides, USP"	c8ea170b-57b5-4643-ba88-4cf2ae1bf6a0	2014-05-08 00:00:00	\N	\N
3778	"Sennosides, USP (Oral Liquid)"	938268	"sennosides, USP"	b2bf2d76-7dc0-4864-bfc2-ef41e155d316	2012-09-27 00:00:00	\N	\N
3779	"Sennosides, USP (Oral Pill)"	938268	"sennosides, USP"	da71f182-032f-4438-a6d4-e973b4cf6241	2015-10-13 00:00:00	\N	\N
3780	SENOKOT (Oral Pill)	938268	"sennosides, USP"	f27cb405-9820-4fe9-8432-e50643f2c7f0	2014-02-10 00:00:00	\N	\N
3781	SENOKOT-S (Oral Pill)	941258	Docusate	c24cdc5e-62e0-41a6-8afb-512202a569f4	2015-08-04 00:00:00	\N	\N
3782	SENSI-CARE BODY (Topical)	916662	dimethicone	736a6d4e-852b-4611-9638-904979b94ad4	2013-12-23 00:00:00	\N	\N
3783	SENSIPAR (Oral Pill)	1548111	cinacalcet	e4d86a0f-7164-41c9-9838-ea51d91c43b0	2014-07-23 00:00:00	\N	\N
3784	SENSORCAINE (Injectable)	732893	Bupivacaine	ab7d1ab1-3d58-4562-a3be-c8b2b12e99cf	2014-11-12 00:00:00	\N	\N
3785	SENSORCAINE WITH EPINEPHRINE (Injectable)	732893	Bupivacaine	bc61a9a6-0a4e-48a9-b908-e5e66b9f23eb	2015-02-27 00:00:00	\N	\N
3786	SEPTOCAINE (Injectable)	19080512	Articaine	0eba0bd2-ccb6-4f7e-8d0c-e4b4e6cdce03	2011-07-12 00:00:00	\N	\N
3787	SER-AP-ES (Oral Pill)	1373928	Hydralazine	bdd0658e-38fb-4726-9720-09c502138ab0	2006-08-21 00:00:00	\N	\N
3788	SEROMYCIN (Oral Pill)	1710446	Cycloserine	e1e08327-4b90-463e-bb2a-22438cabcef2	2011-10-06 00:00:00	\N	\N
3789	SEROquel (Oral Pill)	766814	quetiapine	6d34c9a4-cf73-4e2d-82f6-a132412c20fe	2013-05-14 00:00:00	\N	\N
3790	Sertaconazole (Topical)	939134	sertaconazole	821073f7-33f6-464d-baed-f66d97987d6d	2014-12-08 00:00:00	\N	\N
3791	Sertraline (Oral Liquid)	739138	Sertraline	7f144b68-ae90-483c-b030-f6824662a734	2014-12-30 00:00:00	\N	\N
3792	Sertraline (Oral Pill)	739138	Sertraline	250d998f-7100-495c-81ff-10fcfd5ba61d	2015-10-01 00:00:00	\N	\N
3793	Sevelamer (Oral Pill)	952004	sevelamer	b2a373e4-110e-4f9a-9abe-e0c4374770d4	2014-07-23 00:00:00	\N	\N
3794	Sevoflurane (Inhalant)	19039298	sevoflurane	3b59360e-2b93-4fcb-b3a3-295f1fee4634	2015-08-10 00:00:00	\N	\N
3795	Shagbark hickory pollen extract (Injectable)	40162231	shagbark hickory pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3796	Sheep sorrel pollen extract/Yellow dock pollen extract (Injectable)	40162235	sheep sorrel pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
3797	SHEER DESENZ (Oral Strip)	927322	potassium nitrate	ac99f344-f0a7-4502-a06f-888a1b382edd	2010-10-05 00:00:00	\N	\N
3798	Short ragweed pollen extract (Injectable)	40171301	short ragweed pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3799	Short ragweed pollen extract (Sublingual)	40171301	short ragweed pollen extract	986abfaf-67fc-47fb-8c86-d9f9cce6fa8b	2015-02-26 00:00:00	\N	\N
3800	Siberian elm pollen extract (Injectable)	42801112	Siberian elm pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3801	SIGNIFOR (Injectable)	43012417	pasireotide	442f0d9d-5c7d-4b81-b329-d71be8cf2be2	2015-03-31 00:00:00	\N	\N
3802	SILADRYL (Oral Liquid)	1129625	Diphenhydramine	717c622c-570e-47d4-be73-041a88e8ebf8	2011-06-22 00:00:00	\N	\N
3803	Sildenafil (Injectable)	1316262	sildenafil	bb92d686-a81e-4b91-8048-693af0534cb3	2015-07-01 00:00:00	\N	\N
3804	Sildenafil (Oral Pill)	1316262	sildenafil	47af30e9-a189-4721-8c8f-652256df75a1	2015-09-11 00:00:00	\N	\N
3805	SILENOR (Oral Pill)	738156	Doxepin	1bec1223-5239-4eb6-a9e8-62444106d2c0	2014-12-01 00:00:00	\N	\N
3806	SILTUSSIN (Oral Liquid)	1163944	Guaifenesin	264abf3d-c466-4209-b911-29ce18b0b816	2015-02-18 00:00:00	\N	\N
3807	SILTUSSIN DM (Oral Liquid)	1119510	Dextromethorphan	ad9916ec-633b-4dcd-a955-88d5f0ec439e	2014-11-04 00:00:00	\N	\N
3808	SILVADENE (Topical)	966956	Silver Sulfadiazine	c437213a-1cd4-445e-a39f-bbcacb9f746f	2015-05-29 00:00:00	\N	\N
3809	Silver sulfadiazine (Topical)	966956	Silver Sulfadiazine	c2b6aaa5-3325-403c-9466-977c4f63f36f	2015-06-19 00:00:00	\N	\N
3810	Simethicone (Chewable)	966991	Simethicone	23005295-c5f2-4a76-8431-4a9b8d817d4d	2015-08-11 00:00:00	\N	\N
3811	Simethicone (Oral Liquid)	966991	Simethicone	395be942-d883-4bcb-8811-6fe1521d5a92	2015-09-28 00:00:00	\N	\N
3812	Simethicone (Oral Pill)	966991	Simethicone	dda3c826-143e-420c-817e-d46d0ee523fb	2015-07-27 00:00:00	\N	\N
3813	SIMPLY SLEEP (Oral Pill)	1129625	Diphenhydramine	37c606b0-04d5-49f0-886a-3ee2c9b0e9cc	2013-09-27 00:00:00	\N	\N
3814	SIMPONI (Injectable)	19041065	golimumab	9e260a47-55af-4c92-8d88-a86ccc767fff	2015-08-10 00:00:00	\N	\N
3815	Simvastatin (Oral Disintegrating)	1539403	Simvastatin	34b56f73-bea4-4265-8b2a-c57520cf8e70	2008-02-05 00:00:00	\N	\N
3816	Simvastatin (Oral Pill)	1539403	Simvastatin	c6985b00-59b5-4ff3-a940-478c616fc227	2015-10-02 00:00:00	\N	\N
3817	Sincalide (Injectable)	19067803	Sincalide	c56a824b-a8ba-42db-b05c-49c731130879	2015-07-15 00:00:00	\N	\N
3818	SINE-OFF MAXIMUM STRENGTH REFORMULATED SEP 2008 (Oral Pill)	1125315	Acetaminophen	e37237f4-20a0-4599-84c8-d96c62062861	2010-10-09 00:00:00	\N	\N
3819	SINEMET XR (Oral Pill)	740560	Carbidopa	69e575b9-f8a5-494f-b736-2520ef505cb0	2014-07-29 00:00:00	\N	\N
3820	SINEX LONG-ACTING (Nasal)	925636	Oxymetazoline	a892608a-56d5-426e-b348-881099a4068d	2015-04-27 00:00:00	\N	\N
3821	SINGULAIR (Chewable)	1154161	montelukast	e8d9021d-73aa-4c96-8b8a-e90069e78555	2012-02-21 00:00:00	\N	\N
3822	SINGULAIR (Oral Pill)	1154161	montelukast	10cd5ca5-6f8b-417c-af11-a2054a2dde34	2013-03-29 00:00:00	\N	\N
3823	Sipuleucel-T (Injectable)	40224095	sipuleucel-T	8309b497-5d4e-4408-ac0c-2452c11c8a35	2015-02-04 00:00:00	\N	\N
3824	Sirolimus (Oral Pill)	19034726	Sirolimus	0f26220a-f4ab-4ceb-9a98-a13dbdeed81f	2015-09-16 00:00:00	\N	\N
3825	Sisal fiber extract (Injectable)	40162251	sisal fiber extract	a363efb9-0817-4347-8c36-6630b5b99dc5	2009-12-18 00:00:00	\N	\N
3826	sitaGLIPtin (Oral Pill)	1580747	sitagliptin	588f94fa-ef4c-4633-8d65-d0d93f374ffc	2015-07-14 00:00:00	\N	\N
3827	SITAVIG (Buccal)	1703687	Acyclovir	00f7425a-6236-47ff-a087-f28f8cdb1aec	2014-08-22 00:00:00	\N	\N
3828	SKELAXIN (Oral Pill)	780369	metaxalone	7a4163f2-c553-4d14-7e98-d14c5c7f772a	2015-06-08 00:00:00	\N	\N
3829	SKLICE (Topical)	1784444	Ivermectin	4c5557cd-c4cf-11df-851a-0800200c9a66	2012-07-09 00:00:00	\N	\N
3830	SKYLA (Implant)	1589505	Levonorgestrel	9f44ff35-e052-49cd-a1c2-0bfd87d49309	2015-09-03 00:00:00	\N	\N
3831	Slash pine pollen extract (Injectable)	40172778	slash pine pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
3832	SLEEPINAL (Oral Pill)	1129625	Diphenhydramine	111e891d-acd8-44f9-b958-09cb876d388c	2014-01-29 00:00:00	\N	\N
3833	Smooth brome pollen extract (Injectable)	40162259	smooth brome pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
3834	SOCHLOR (Ophthalmic)	967823	Sodium Chloride	3f78386f-42f1-22a9-1f27-349381dad0b0	2014-02-06 00:00:00	\N	\N
3835	Sodium Acetate (Injectable)	19077884	Sodium Acetate	ce9a7469-c4ba-4f60-8f7a-47ef0974316e	2015-04-09 00:00:00	\N	\N
3836	Sodium Bicarbonate (Injectable)	939506	Sodium Bicarbonate	41735bcb-602f-49a0-b578-18c1bdb33d03	2015-09-02 00:00:00	\N	\N
3837	Sodium Bicarbonate (Oral Pill)	939506	Sodium Bicarbonate	e73b5871-4a87-4473-ab00-5e5395be017d	2015-03-25 00:00:00	\N	\N
3838	Sodium Bicarbonate/Sodium Chloride (Nasal)	939506	Sodium Bicarbonate	ff4df6c5-c85f-406a-89d7-8c2853fd5e10	2015-06-10 00:00:00	\N	\N
3839	Sodium Chloride (Inhalant)	967823	Sodium Chloride	b4fd60c9-6fd9-430a-b4f6-0424b46bdbe1	2015-06-22 00:00:00	\N	\N
3840	Sodium Chloride (Injectable)	967823	Sodium Chloride	f55bd888-5e01-474d-871b-24654c070178	2015-01-13 00:00:00	\N	\N
3841	Sodium Chloride (Irrigation)	967823	Sodium Chloride	05dee566-7b82-4216-8a6b-765d2b4d9dc7	2015-08-06 00:00:00	\N	\N
3842	Sodium Chloride (Nasal)	967823	Sodium Chloride	f852bdfe-12af-4ac7-9158-4a1450bcb025	2014-12-02 00:00:00	\N	\N
3843	Sodium Chloride (Ophthalmic)	967823	Sodium Chloride	93fafa27-5031-4d95-b4b8-5574b7204ae2	2015-09-18 00:00:00	\N	\N
3844	Sodium citrate (Injectable)	977968	sodium citrate	447528e6-55cd-4a9b-868e-2a741b2693d3	2015-09-15 00:00:00	\N	\N
3845	Sodium ferric gluconate complex (Injectable)	1399177	Sodium ferric gluconate complex	218d1b8d-b24f-4f77-b588-97c7dd1c2eec	2015-04-24 00:00:00	\N	\N
3846	Sodium Fluoride (Chewable)	19069022	Sodium Fluoride	58b3e7ff-c032-4e42-823a-8ed7b93d606f	2014-03-04 00:00:00	\N	\N
3847	Sodium Fluoride (Mouthwash)	19069022	Sodium Fluoride	1a57bfa0-3b18-4612-ad8c-5e651abb3530	2015-09-02 00:00:00	\N	\N
3848	Sodium Fluoride (Oral Foam)	19069022	Sodium Fluoride	feaab33f-87b2-4e79-b8c3-649d79002111	2015-07-16 00:00:00	\N	\N
3849	Sodium Fluoride (Oral Gel)	19069022	Sodium Fluoride	ec50b003-cf61-4f66-bb62-f779e48363c2	2015-07-16 00:00:00	\N	\N
3850	Sodium Fluoride (Oral Liquid)	19069022	Sodium Fluoride	cc162a0e-b601-4466-9a4e-192985ee014a	2015-09-08 00:00:00	\N	\N
3851	Sodium Fluoride (Paste)	19069022	Sodium Fluoride	0f859886-ce63-4de2-994e-7288b19d9656	2012-08-24 00:00:00	\N	\N
3852	Sodium Fluoride (Toothpaste)	19069022	Sodium Fluoride	d93ee76f-454b-40bf-9357-39a2ae3b6ccb	2015-09-21 00:00:00	\N	\N
3853	Sodium Fluoride/Xylitol (Chewable)	19069022	Sodium Fluoride	4c854364-e732-4dec-b1d1-b8a97e4e1176	2010-08-24 00:00:00	\N	\N
3854	Sodium Iodide (Injectable)	19069873	Sodium Iodide	64c7014a-c9b1-4264-b365-c610c3d733fd	2014-06-09 00:00:00	\N	\N
3855	Sodium Morrhuate (Injectable)	19069904	Sodium Morrhuate	9298b254-4311-46cd-9244-8651dd87417e	2014-09-04 00:00:00	\N	\N
3856	Sodium Nitrite (Injectable)	19069907	Sodium Nitrite	ff4941b3-9901-4aab-adcf-c5327bede34e	2012-12-20 00:00:00	\N	\N
3857	Sodium Oxybate (Oral Liquid)	769935	Sodium Oxybate	926eb076-a4a8-45e4-91ef-411f0aa4f3ca	2015-09-21 00:00:00	\N	\N
3858	Sodium phosphate (Oral Pill)	939871	sodium phosphate	983ce15f-cd37-4f3a-9e51-205860e80976	2010-08-24 00:00:00	\N	\N
3859	"Sodium Phosphate, Dibasic/Sodium Phosphate, Monobasic (Injectable)"	991710	"Sodium Phosphate, Dibasic"	348ecd15-59c0-4833-88ea-7acf6ac0dbef	2013-10-18 00:00:00	\N	\N
3860	"Sodium Phosphate, Dibasic/Sodium Phosphate, Monobasic (Oral Liquid)"	991710	"Sodium Phosphate, Dibasic"	baa19edb-d585-451e-a536-96293f2a7688	2013-12-17 00:00:00	\N	\N
3861	"Sodium Phosphate, Dibasic/Sodium Phosphate, Monobasic (Rectal)"	991710	"Sodium Phosphate, Dibasic"	fb260df0-7bda-4299-84a5-44c8f9447798	2015-08-21 00:00:00	\N	\N
3862	"SODIUM PHOSPHATE,MONOBASIC,MONOHYDRATE/Sodium Phosphate, Dibasic (Oral Pill)"	991710	"Sodium Phosphate, Dibasic"	57ccd52e-5b13-4b39-8aa0-ebecc49a7db4	2010-12-15 00:00:00	\N	\N
3863	Sodium polystyrene sulfonate (Oral Liquid)	19078126	Sodium polystyrene sulfonate	905c3ee5-d1a7-4deb-a345-4a42296704fa	2015-08-12 00:00:00	\N	\N
3864	Sodium Tetradecyl Sulfate (Injectable)	19070012	Sodium Tetradecyl Sulfate	f1756c28-dcd2-4b49-be62-07ca20682018	2013-07-25 00:00:00	\N	\N
3865	Sodium thiosulfate (Injectable)	940004	sodium thiosulfate	ff4941b3-9901-4aab-adcf-c5327bede34e	2012-12-20 00:00:00	\N	\N
3866	SOLARCAINE (Topical)	989878	Lidocaine	88f3cb40-2258-4e1c-92fb-e1891ddb3135	2013-09-04 00:00:00	\N	\N
3867	Solifenacin (Oral Pill)	916005	Solifenacin	5256f116-ad56-4ce0-8a5e-69d401f3ea00	2015-09-15 00:00:00	\N	\N
3868	SOLTAMOX (Oral Liquid)	1436678	Tamoxifen	8e4710a7-8757-49be-8bec-a1dc39e6c695	2012-10-01 00:00:00	\N	\N
3869	Solu-CORTEF (Injectable)	975125	Hydrocortisone	b2b4c961-363d-49fe-b354-d59b39fd517a	2012-05-17 00:00:00	\N	\N
3870	Solu-MEDROL (Injectable)	1506270	Methylprednisolone	68ef8ec4-16de-4a8c-8696-b09359660380	2015-01-29 00:00:00	\N	\N
3871	SOMA (Oral Pill)	749910	Carisoprodol	6543c6ba-852e-40fb-b7ec-1331b9c83656	2010-12-10 00:00:00	\N	\N
3872	Somatropin (Injectable)	1584910	Somatropin	85ba081b-bee0-4a9a-aa0f-ae5b5e9a0886	2015-04-21 00:00:00	\N	\N
3873	SOMBRA WARM PAIN RELIEVING GEL (Topical)	938205	Camphor	de78dba9-53b3-4dbd-9dd2-6a692378da34	2012-01-18 00:00:00	\N	\N
3874	SOMINEX (Oral Pill)	1129625	Diphenhydramine	9e70ead1-479f-48bb-9be4-a8b30b784795	2013-02-20 00:00:00	\N	\N
3875	SONATA (Oral Pill)	720727	zaleplon	43ac81cb-1e3f-4d44-86bd-13db2721d060	2010-09-14 00:00:00	\N	\N
3876	SOOTHE & COOL MOISTURE BARRIER (Topical)	19033354	Petrolatum	59625382-2769-4c91-9c53-e19dfd6ca115	2010-10-09 00:00:00	\N	\N
3877	SOOTHE NIGHT TIME (Ophthalmic)	908523	Mineral Oil	638d3c3f-9960-43da-956e-0e28c77f533e	2011-12-22 00:00:00	\N	\N
3878	SOOTHE REGULAR STRENGTH (Oral Liquid)	937791	bismuth subsalicylate	82f2b3a4-3428-4046-9372-2ef9046a071c	2015-09-28 00:00:00	\N	\N
3879	Sorbitol (Irrigation)	970011	Sorbitol	5f7be402-f25a-428e-b81f-6a4a00de894c	2014-10-09 00:00:00	\N	\N
3880	Sorbitol (Rectal)	970011	Sorbitol	16cc9d47-5382-4237-ab84-f22c5436fe2e	2012-07-10 00:00:00	\N	\N
3881	SORINE (Oral Pill)	1370109	Sotalol	6ee6e904-a8e2-41d4-8261-67103ecfa605	2015-07-21 00:00:00	\N	\N
3882	Sotalol (Injectable)	1370109	Sotalol	2afe7385-2441-4e22-b63e-ab8614b275df	2014-09-30 00:00:00	\N	\N
3883	Sotalol (Oral Liquid)	1370109	Sotalol	1f33f900-0777-4a92-a7f7-00cf3d57d95c	2015-03-02 00:00:00	\N	\N
3884	Sotalol (Oral Pill)	1370109	Sotalol	03de4b65-29b0-4e30-a94b-b5877a050f93	2015-10-01 00:00:00	\N	\N
3885	SOTRADECOL (Injectable)	19070012	Sodium Tetradecyl Sulfate	f1756c28-dcd2-4b49-be62-07ca20682018	2013-07-25 00:00:00	\N	\N
3886	SOTRET (Oral Pill)	984232	Isotretinoin	d5a26c5e-9c3e-4781-8c08-62b91d21a68d	2006-12-01 00:00:00	\N	\N
3887	SOTYLIZE (Oral Liquid)	1370109	Sotalol	1f33f900-0777-4a92-a7f7-00cf3d57d95c	2015-03-02 00:00:00	\N	\N
3888	SPECTRACEF (Oral Pill)	1747005	cefditoren	1c90b649-5536-417c-82cb-89663137f14f	2013-06-06 00:00:00	\N	\N
3889	Spinosad (Shampoo)	40172543	spinosad	5cd2bff8-40cd-4e63-9907-77b80d774cb7	2015-06-16 00:00:00	\N	\N
3890	SPIRIVA (Inhalant)	1106776	tiotropium	1cf82d42-5ad0-4b86-838e-9230c61cf3d4	2010-07-09 00:00:00	\N	\N
3891	Spironolactone (Oral Pill)	970250	Spironolactone	d895f00f-ce8c-47cf-9e3f-78ec2d1a0a1b	2015-08-06 00:00:00	\N	\N
3892	SPORTSCREME (Topical)	943116	trolamine salicylate	cfaae612-43df-409e-80b4-4704fbf53b04	2014-12-19 00:00:00	\N	\N
3893	SPRYCEL (Oral Pill)	1358436	dasatinib	0e7f054c-7a27-4192-bd1c-6115d8be858f	2012-06-04 00:00:00	\N	\N
3894	SSD (Topical)	966956	Silver Sulfadiazine	cecc0b75-fccf-418d-923a-2a5869c1d043	2013-12-10 00:00:00	\N	\N
3895	STAHIST AD (Oral Pill)	990413	chlorcyclizine	ccedbc38-2479-4c35-9f86-a9f29bcfab3f	2012-01-09 00:00:00	\N	\N
3896	STAHIST AD LIQUID (Oral Liquid)	990413	chlorcyclizine	4e1bd76c-3fd8-4372-907f-6b799d67cfbb	2012-04-11 00:00:00	\N	\N
3897	STANBACK HEADACHE POWDER REFORMULATED JAN 2011 (Oral Powder)	1112807	Aspirin	caaa1313-09e4-45aa-8836-346f6a370196	2012-06-14 00:00:00	\N	\N
3898	Stannous Fluoride (Mouthwash)	1036094	Stannous Fluoride	d2f0df92-d52f-4c9c-99d0-3cd2a025e5e9	2015-06-23 00:00:00	\N	\N
3899	Stannous Fluoride (Oral Gel)	1036094	Stannous Fluoride	3b21d029-271b-43f4-9406-429507621bf7	2015-09-16 00:00:00	\N	\N
3900	Stannous Fluoride (Toothpaste)	1036094	Stannous Fluoride	2ee74342-c3f6-4aa5-a4d6-d9123d24a5aa	2015-05-07 00:00:00	\N	\N
3901	Starch (Rectal)	1036157	Starch	6a3ee178-39a9-44bf-8fdb-5eacbd089998	2012-08-10 00:00:00	\N	\N
3902	Starch/Zinc Oxide (Topical)	1036157	Starch	9f12dee2-7afa-45e9-a729-0fd42bb77715	2010-10-09 00:00:00	\N	\N
3903	STATROL (Ophthalmic)	915981	Neomycin	7218af16-9378-472a-a033-4c9f9d5524db	2008-03-13 00:00:00	\N	\N
3904	STATUSS GREEN REFORMULATED JAN 2012 (Oral Liquid)	990413	chlorcyclizine	9d1d42e4-9d69-4360-a057-81f909133880	2012-01-10 00:00:00	\N	\N
3905	Stavudine (Oral Liquid)	1781406	Stavudine	259fbf19-ad1a-424f-873a-ba12e42b9315	2013-10-18 00:00:00	\N	\N
3906	Stavudine (Oral Pill)	1781406	Stavudine	6d397a2a-06fc-467e-b014-c19e6384c8d9	2014-11-06 00:00:00	\N	\N
3907	STAXYN (Oral Disintegrating)	1311276	vardenafil	0e5139d8-bf61-4f21-a36b-81b96b9b07d1	2015-09-23 00:00:00	\N	\N
3908	STOPAIN (Topical)	901656	Menthol	da5b7666-3df4-4b11-afb3-7e292c065053	2010-11-30 00:00:00	\N	\N
3909	STRATTERA (Oral Pill)	742185	atomoxetine	23c702e2-3abc-4d7d-b88f-a089e2179f42	2014-10-27 00:00:00	\N	\N
3910	Streptomycin (Injectable)	1836191	Streptomycin	abd1f64e-4283-4370-aae8-3666316aa36e	2013-10-24 00:00:00	\N	\N
3911	Streptozocin (Injectable)	19136210	Streptozocin	15d161ed-9e7b-4c92-ba45-0556d2423e67	2012-09-07 00:00:00	\N	\N
3912	STRI-DEX (Topical)	964407	Salicylic Acid	843d3424-bd6c-44aa-976b-63c9da15014e	2013-05-30 00:00:00	\N	\N
3913	STRIANT (Buccal)	1636780	Testosterone	9af8ef50-f650-44ca-a272-135bfce9daca	2015-05-21 00:00:00	\N	\N
3914	STRIBILD (Oral Pill)	42874220	cobicistat	144067b2-0532-476a-996e-e4a0a9d09b05	2015-08-11 00:00:00	\N	\N
3915	STRIDEX (Topical)	964407	Salicylic Acid	b3a78318-293a-4869-b442-3b6a9965791f	2010-10-09 00:00:00	\N	\N
3916	STYPTSTIX (Topical)	927322	potassium nitrate	b7634e27-3c75-4e56-ab42-3e5796edb0c7	2014-05-16 00:00:00	\N	\N
3917	SUBLIMAZE (Injectable)	1154029	Fentanyl	8944ea18-016e-4971-876d-2365fac190ea	2008-05-15 00:00:00	\N	\N
3918	SUBOXONE (Oral Strip)	1133201	Buprenorphine	426a0094-f192-48ff-be40-c4f7c9566d50	2015-10-06 00:00:00	\N	\N
3919	SUBOXONE (Sublingual)	1133201	Buprenorphine	8083b4e1-9863-4311-b72d-cbad288f7652	2012-06-11 00:00:00	\N	\N
3920	Succimer (Oral Pill)	1728909	Succimer	62035612-9505-3a3f-1ac8-e2dbd711d24e	2013-08-29 00:00:00	\N	\N
3921	Succinylcholine (Injectable)	836208	Succinylcholine	c06156ae-b889-4250-bc85-1435b2635829	2014-06-05 00:00:00	\N	\N
3922	SUCRAID (Oral Liquid)	951980	Sacrosidase	d613bb7f-c3f4-462e-81a2-da2347cc4b6b	2015-05-29 00:00:00	\N	\N
3923	Sucralfate (Oral Liquid)	1036228	Sucralfate	0fb67b1c-b4c0-46f2-8a81-df1510e006aa	2014-05-06 00:00:00	\N	\N
3924	Sucralfate (Oral Pill)	1036228	Sucralfate	989ca8a8-3ad6-4ee4-aa9c-eed731828753	2015-09-28 00:00:00	\N	\N
3925	SUCRETS (Oral Lozenge)	992308	dyclonine	68f3e4d6-4292-4c5c-96de-2c4d38ec6399	2012-04-11 00:00:00	\N	\N
3926	SUCRETS DM (Oral Lozenge)	1119510	Dextromethorphan	00ad5b08-5371-4a2f-be49-4254106d7f64	2011-11-23 00:00:00	\N	\N
3927	SUCRETS ORIGINAL (Oral Lozenge)	969004	Hexylresorcinol	e282ba65-b674-45d5-82c2-ab4e4a95243b	2011-11-14 00:00:00	\N	\N
3928	SUDAFED (Oral Liquid)	1154332	Pseudoephedrine	52e9307b-ad38-4f65-bb2f-4fa262e82010	2015-03-19 00:00:00	\N	\N
3929	SUDAFED (Oral Pill)	1154332	Pseudoephedrine	d280abe9-6bdf-4e1e-a0cf-95fd0451c999	2015-06-01 00:00:00	\N	\N
3930	SUDAFED PE (Oral Pill)	1135766	Phenylephrine	74716ae2-b035-47e2-9fc6-9ce53fdcd790	2015-08-26 00:00:00	\N	\N
3931	SUDAFED PE CHILDREN'S COLD & COUGH (Oral Liquid)	1119510	Dextromethorphan	20e45243-3989-413a-bcf1-49d754ff2e44	2015-03-19 00:00:00	\N	\N
3932	SUDAFED PE CHILDREN'S NASAL DECONGESTANT (Oral Liquid)	1135766	Phenylephrine	4dfd46e4-b9f9-464d-aa47-e8fa9e526a5d	2015-06-03 00:00:00	\N	\N
3933	Sudan grass pollen extract (Injectable)	40237944	Sudan grass pollen extract	c7d383a6-94b8-4101-8a4c-fa7747a21468	2009-11-19 00:00:00	\N	\N
3934	SUDO-TAB (Oral Pill)	1135766	Phenylephrine	6f70ed59-a1f8-4daa-8614-feaf2533687b	2012-11-14 00:00:00	\N	\N
3935	SUDOGEST (Oral Liquid)	1154332	Pseudoephedrine	0ae49d7e-ceec-4ad6-a0b8-cb20237e2b70	2010-10-09 00:00:00	\N	\N
3936	SUDOGEST (Oral Pill)	1154332	Pseudoephedrine	7d26821c-a08a-40a8-9729-251f21d54702	2015-09-15 00:00:00	\N	\N
3937	SUDOGEST SINUS & ALLERGY (Oral Pill)	1192710	Chlorpheniramine	7cd8f7f3-c262-4f7c-bcaf-068be2c952f9	2015-05-05 00:00:00	\N	\N
3938	SUFentanil (Injectable)	19078219	Sufentanil	53dbe21e-0b97-4271-a7af-2d18986adcd8	2014-04-10 00:00:00	\N	\N
3939	Sulconazole (Topical)	940535	sulconazole	b3aea089-3961-43ea-8335-8128e9bae13b	2015-09-28 00:00:00	\N	\N
3940	SULF-10 (Ophthalmic)	1036252	Sulfacetamide	43aab37c-3020-4f7e-8b21-f9be22e9d356	2006-09-18 00:00:00	\N	\N
3941	Sulfacetamide (Ophthalmic)	1036252	Sulfacetamide	26983557-e3e8-477f-bb63-64f04b1606eb	2015-08-19 00:00:00	\N	\N
3942	Sulfacetamide (Shampoo)	1036252	Sulfacetamide	6a034465-e600-49cb-91bd-7b9ceee6ffc6	2012-10-04 00:00:00	\N	\N
3943	Sulfacetamide (Soap)	1036252	Sulfacetamide	a77aed6c-355f-44ed-ae95-78b4d1549c2b	2014-01-31 00:00:00	\N	\N
3944	Sulfacetamide (Topical)	1036252	Sulfacetamide	5a005021-dfa1-4aeb-8661-045516723baf	2015-10-02 00:00:00	\N	\N
3945	Sulfacetamide/Sulfur (Soap)	1036252	Sulfacetamide	0e76c520-d02a-4064-bcda-fc45cf9e6fa3	2015-09-23 00:00:00	\N	\N
3946	Sulfacetamide/Sulfur (Topical)	1036252	Sulfacetamide	5fff8c9a-a798-4b5b-b818-6c1817936d5d	2015-03-17 00:00:00	\N	\N
3947	Sulfamethoxazole/Trimethoprim (Injectable)	1836430	Sulfamethoxazole	b89b5502-ce87-45a6-a43c-9891da3cfca4	2013-08-22 00:00:00	\N	\N
3948	Sulfamethoxazole/Trimethoprim (Oral Liquid)	1836430	Sulfamethoxazole	bbad2036-e2a8-4c56-bb92-dea833598ebc	2015-08-10 00:00:00	\N	\N
3949	Sulfamethoxazole/Trimethoprim (Oral Pill)	1836430	Sulfamethoxazole	a0f86f52-8841-4e1c-8536-2e78320471ed	2015-09-17 00:00:00	\N	\N
3950	SULFAMYLON (Topical)	992716	Mafenide	9972db4c-703f-4cbc-915c-ec993bff6fb9	2015-07-17 00:00:00	\N	\N
3951	Sulfanilamide (Vaginal)	1036475	Sulfanilamide	d344f475-1bf2-4aaf-aae3-0cd0be4995d1	2014-12-10 00:00:00	\N	\N
3952	sulfaSALAzine (Oral Pill)	964339	Sulfasalazine	ad13d598-7b1b-48d3-a25b-08635b419f99	2015-02-17 00:00:00	\N	\N
3953	SULFATRIM (Oral Liquid)	1836430	Sulfamethoxazole	a8df90d8-78b3-48c3-b42e-1e651d81454b	2013-11-13 00:00:00	\N	\N
3954	SULFONATED PHENOL/Sulfuric acid (Mucosal)	991706	SULFONATED PHENOL	15d22ca4-503e-2751-e054-00144ff8d46c	2015-05-26 00:00:00	\N	\N
3955	SULFONATED PHENOL/Sulfuric acid (Topical)	991706	SULFONATED PHENOL	15d22ca4-503e-2751-e054-00144ff8d46c	2015-05-26 00:00:00	\N	\N
3956	Sulfur (Soap)	1036525	Sulfur	bd35f939-a36a-4a96-98df-36bf81ab8628	2015-06-10 00:00:00	\N	\N
3957	Sulfur (Topical)	1036525	Sulfur	0280e008-8f9d-4bb8-897b-3e5fbb49aa1e	2015-05-06 00:00:00	\N	\N
3958	Sulindac (Oral Pill)	1236607	Sulindac	19dde540-3d29-4db4-9570-6ca15f09e0fe	2015-09-02 00:00:00	\N	\N
3959	SULPHO-LAC (Soap)	1036525	Sulfur	2f838efd-831d-4171-8387-83c8eab3c51a	2010-10-09 00:00:00	\N	\N
3960	SUMADAN WASH (Soap)	1036252	Sulfacetamide	f4b493b8-1193-4a3f-b7a2-77d08d5b3d66	2013-12-10 00:00:00	\N	\N
3961	SUMAtriptan (Injectable)	1140643	Sumatriptan	24259865-233b-4258-a01b-e895a873f2c4	2012-03-05 00:00:00	\N	\N
3962	SUMAtriptan (Nasal)	1140643	Sumatriptan	6c95caa4-812e-4e47-bcfc-c641c00db3f7	2015-09-03 00:00:00	\N	\N
3963	SUMAtriptan (Oral Pill)	1140643	Sumatriptan	1ecbd827-e22b-113d-e054-00144ff8d46c	2015-09-03 00:00:00	\N	\N
3964	SUMAtriptan (Transdermal)	1140643	Sumatriptan	806a07a0-e042-11df-9548-0002a5d5c51b	2015-08-28 00:00:00	\N	\N
3965	SUMAXIN (Soap)	1036252	Sulfacetamide	2e3350eb-ca10-4bf2-819f-3eb46c7437b7	2010-09-03 00:00:00	\N	\N
3966	SUMAXIN (Topical)	1036252	Sulfacetamide	5d9ddc1a-fbae-4595-86ce-3bbca7d03482	2011-12-29 00:00:00	\N	\N
3967	SUPERDENT HEMAL (Mucosal)	957393	aluminum chloride	cb363bac-c935-4398-892e-d9024eb7d121	2015-04-03 00:00:00	\N	\N
3968	SUPRANE (Inhalant)	19002770	desflurane	bf4d8d29-852d-4281-b732-4af0eca019e1	2015-03-11 00:00:00	\N	\N
3969	SUPRAX (Chewable)	1796435	Cefixime	d0fd45bd-7d52-4fa6-a5f7-f46d5651ffa2	2014-09-11 00:00:00	\N	\N
3970	SUPRAX (Oral Liquid)	1796435	Cefixime	7e2462b2-bfed-4da4-8c47-46838d6153f8	2014-09-11 00:00:00	\N	\N
3971	SUPRAX (Oral Pill)	1796435	Cefixime	d0fd45bd-7d52-4fa6-a5f7-f46d5651ffa2	2014-09-11 00:00:00	\N	\N
3972	Suprofen (Ophthalmic)	1036636	Suprofen	8de2c303-5d99-46b6-ad6d-a4caadea3604	2008-03-13 00:00:00	\N	\N
3973	SURFAK STOOL SOFTENER (Oral Pill)	941258	Docusate	f2ea1d6b-fce6-40b4-9c06-48ca40323e01	2011-11-25 00:00:00	\N	\N
3974	SURFAXIN (Injectable)	42800204	lucinactant	f2ba0c81-ceb0-11e0-9572-0800200c9a66	2014-05-02 00:00:00	\N	\N
3975	SURMONTIL (Oral Pill)	705755	Trimipramine	0177d783-773c-41bf-9db9-eb7e5c64474a	2015-02-10 00:00:00	\N	\N
3976	SUSTIVA (Oral Pill)	1738135	efavirenz	04b5c345-c446-43a4-83f0-509bc287e10b	2013-03-01 00:00:00	\N	\N
3977	Suvorexant (Oral Pill)	45775760	Suvorexant	e5b72731-1acb-45b7-9c13-290ad12d3951	2015-08-12 00:00:00	\N	\N
3978	SYLATRON (Injectable)	1797155	peginterferon alfa-2b	3874c95c-092e-4cd5-b104-6ed2bc391b0e	2015-05-28 00:00:00	\N	\N
3979	SYNALAR (Topical)	996541	fluocinolone	4feecef4-553f-4a90-a3ce-a19eb04bd68e	2013-02-27 00:00:00	\N	\N
3980	SYNALGOS-DC (Oral Pill)	1112807	Aspirin	3e863ce5-936c-4145-b14b-76670e21bdad	2013-05-14 00:00:00	\N	\N
3981	SYNERA (Transdermal)	989878	Lidocaine	b3eee508-8bf3-4bd3-9a71-47ee6ea87f95	2012-03-05 00:00:00	\N	\N
3982	SYNERCID (Injectable)	1789517	dalfopristin	28f698df-b584-4455-2e94-6efc41313960	2014-09-29 00:00:00	\N	\N
3983	SYNRIBO (Injectable)	19069046	omacetaxine mepesuccinate	83a504ef-cf92-467d-9ecf-d251194a3484	2014-05-16 00:00:00	\N	\N
3984	"Synthetic conjugated estrogens, A (Oral Pill)"	1596779	"synthetic conjugated estrogens, A"	410f9433-98ed-4c3f-abb1-2386296d2f72	2015-08-19 00:00:00	\N	\N
3985	"Synthetic conjugated estrogens, B (Oral Pill)"	1586808	"synthetic conjugated estrogens, B"	b7aba0b2-72d1-4429-bb64-98b92e9d9433	2015-07-17 00:00:00	\N	\N
3986	SYNTHROID (Oral Pill)	1501700	Thyroxine	1083d90e-398e-4c8f-99a7-4ddf377ffffe	2015-01-20 00:00:00	\N	\N
3987	SYPRINE (Oral Pill)	19004969	Trientine	0ed52ecf-cda9-4a06-bacc-2c2827cc8967	2015-01-12 00:00:00	\N	\N
3988	SYSTANE (Ophthalmic)	948490	Polyethylene Glycol 400	14916d2c-a63d-491e-bd91-a61f300af38a	2015-09-23 00:00:00	\N	\N
3989	SYSTANE BALANCE (Ophthalmic)	929128	Propylene glycol	c7b1a03a-a5f2-409e-a34a-d6f166671de5	2010-10-09 00:00:00	\N	\N
3990	SYSTANE NIGHTTIME (Ophthalmic)	908523	Mineral Oil	4689c59c-5721-3f91-6c85-e41501998fd0	2012-05-09 00:00:00	\N	\N
3991	TABLOID (Oral Pill)	1437379	Thioguanine	4490128b-e73f-4849-9d6e-e8591639d771	2013-03-12 00:00:00	\N	\N
3992	TACHOSIL (Transdermal)	19054702	Fibrinogen	5918e503-b457-48ab-b68b-243e29651d06	2015-07-28 00:00:00	\N	\N
3993	TACLONEX (Topical)	920458	Betamethasone	ef43ba2d-20ce-4415-b5c2-e486b836812e	2015-01-06 00:00:00	\N	\N
3994	Tacrolimus (Oral Pill)	950637	Tacrolimus	61dee012-43af-0e9a-3843-9b9b91e022c4	2015-10-13 00:00:00	\N	\N
3995	Tacrolimus (Topical)	950637	Tacrolimus	1bf44a84-14fd-4f80-ad8a-99b1431d631f	2014-11-10 00:00:00	\N	\N
3996	TACTINAL (Oral Pill)	1125315	Acetaminophen	0a5b8720-dec4-4cb2-e054-00144ff88e88	2014-12-17 00:00:00	\N	\N
3997	Tadalafil (Oral Pill)	1336926	tadalafil	ebddb745-81f9-4b25-8739-b2886032ed26	2014-03-21 00:00:00	\N	\N
3998	TAFINLAR (Oral Pill)	43532299	dabrafenib	803beaaa-33f9-48cc-9a95-c2e887e095b4	2015-02-02 00:00:00	\N	\N
3999	Tag alder pollen extract (Injectable)	40162097	tag alder pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
4000	TAGAMET (Oral Pill)	997276	Cimetidine	e6401e0a-8612-42e8-bf89-2d67243f28dc	2014-12-18 00:00:00	\N	\N
4001	TAKE ACTION (Oral Pill)	1589505	Levonorgestrel	94f251c1-599c-4517-8c60-50a896b06992	2014-03-04 00:00:00	\N	\N
4002	TALACEN (Oral Pill)	1125315	Acetaminophen	927f1bb9-6c13-4229-a5c8-0bf0b4c3bb35	2008-11-14 00:00:00	\N	\N
4003	Talc (Topical)	1036667	Talc	c89eb8fd-6c31-4f8b-8103-1f559424eda1	2013-07-01 00:00:00	\N	\N
4004	Talc/Zinc Oxide (Topical)	1036667	Talc	8ebc1ab4-6dcb-42ec-908b-5b97648331db	2010-10-09 00:00:00	\N	\N
4005	Taliglucerase alfa (Injectable)	42800246	taliglucerase alfa	fa3cbd5d-677c-4b19-9032-d9182cb69a83	2014-10-22 00:00:00	\N	\N
4006	Tall oat grass pollen extract (Injectable)	40225727	tall oat grass pollen extract	c7d383a6-94b8-4101-8a4c-fa7747a21468	2009-11-19 00:00:00	\N	\N
4007	Tamarack pollen extract (Injectable)	40172606	tamarack pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
4008	TAMBOCOR (Oral Pill)	1354860	Flecainide	b764c8b8-7e23-4016-830f-68312d84f3d3	2006-09-18 00:00:00	\N	\N
4009	TAMIFLU (Oral Liquid)	1799139	Oseltamivir	1948cafd-b5b3-4212-9d5d-8c293b1baad5	2012-04-11 00:00:00	\N	\N
4010	TAMIFLU (Oral Pill)	1799139	Oseltamivir	2f912317-c0de-445a-8729-a99a8d2acaad	2013-05-14 00:00:00	\N	\N
4011	Tamoxifen (Oral Liquid)	1436678	Tamoxifen	8e4710a7-8757-49be-8bec-a1dc39e6c695	2012-10-01 00:00:00	\N	\N
4012	Tamoxifen (Oral Pill)	1436678	Tamoxifen	f5ffe9dd-f76d-4aab-9473-81e33b26710b	2015-04-07 00:00:00	\N	\N
4013	Tamsulosin (Oral Pill)	924566	tamsulosin	836447d8-fdea-4fa7-bb2f-e269fcb251f9	2015-09-08 00:00:00	\N	\N
4014	TANAC LIQUID (Mucosal)	917006	Benzocaine	4fec813b-f5ad-4d15-8db5-529d5aa8bcb6	2011-01-03 00:00:00	\N	\N
4015	TAPAZOLE (Oral Pill)	1504620	Methimazole	0659f574-542f-4931-8fe7-d9f6b431bb9a	2013-03-13 00:00:00	\N	\N
4016	Tapentadol (Oral Liquid)	19026459	tapentadol	e921054f-b3f1-4624-8edd-f6628c6f0fd9	2014-11-26 00:00:00	\N	\N
4017	Tapentadol (Oral Pill)	19026459	tapentadol	e35e8385-db1f-41a8-8307-20979569ac72	2014-03-14 00:00:00	\N	\N
4018	TARCEVA (Oral Pill)	1325363	erlotinib	5783976b-0862-44e5-9b19-0f41d236d5c3	2012-01-30 00:00:00	\N	\N
4019	TARGRETIN (Oral Pill)	1389888	bexarotene	1d056725-0576-4338-8089-6336e768ccdc	2015-08-12 00:00:00	\N	\N
4020	TARGRETIN (Topical)	1389888	bexarotene	e415c4c8-3144-4172-94a0-f4f3243130ae	2014-02-14 00:00:00	\N	\N
4021	TARSUM (Shampoo)	1000995	Coal Tar	d990a3d8-8be8-44e3-8e84-a6d8da21f3b5	2014-10-24 00:00:00	\N	\N
4022	Tasimelteon (Oral Pill)	44814600	tasimelteon	ca4a9b63-708e-49e9-8f9b-010625443b90	2014-12-19 00:00:00	\N	\N
4023	TASMAR (Oral Pill)	715727	tolcapone	a0e47a9d-78e7-4523-983a-aa259f221736	2015-10-09 00:00:00	\N	\N
4024	TAVIST (Oral Pill)	1197677	Clemastine	da09ea30-067f-45bc-9dc8-6fdd63db9ee1	2011-09-02 00:00:00	\N	\N
4025	Tazarotene (Topical)	947416	tazarotene	75145c21-6ef2-455a-8a67-d48ddd4181a4	2014-07-09 00:00:00	\N	\N
4026	TAZORAC (Topical)	947416	tazarotene	dd02ea43-7668-4872-a655-ee31c456e345	2014-07-09 00:00:00	\N	\N
4027	Tea Tree Oil (Topical)	19008374	Tea Tree Oil	31952c39-8b43-4e93-b2e8-9388da8bdaf8	2011-03-28 00:00:00	\N	\N
4028	TEARS RENEWED (Ophthalmic)	1319156	Dextran 70	8cb4d4b4-44e5-4584-a4a4-940ad50b2f9d	2011-05-10 00:00:00	\N	\N
4029	Teduglutide (Injectable)	43013171	teduglutide	66b69c1e-b25c-44d3-b5ff-1c1de9a516fa	2013-01-16 00:00:00	\N	\N
4030	Tegretol	19045157	carbamazepine	8d409411-aa9f-4f3a-a52c-fbcb0c3ec053	2015-08-28 00:00:00	\N	\N
4031	TEKTURNA (Oral Pill)	1317967	aliskiren	4c222831-90af-4336-8bf6-5628ddf24326	2012-01-18 00:00:00	\N	\N
4032	TEKTURNA HCT (Oral Pill)	1317967	aliskiren	40d12d97-152d-4fea-bc59-b69e5c29fde2	2010-11-08 00:00:00	\N	\N
4033	Telavancin (Injectable)	40166675	telavancin	c09655ea-7af5-4443-a769-86e416214f59	2014-12-15 00:00:00	\N	\N
4034	TELDRIN HBP (Oral Pill)	1192710	Chlorpheniramine	4cdbecbe-3219-4083-adc0-5479dc3ad3b9	2010-10-09 00:00:00	\N	\N
4035	Telithromycin (Oral Pill)	1702911	telithromycin	ba1cca98-f350-4655-88e3-6ef990779fb9	2015-03-26 00:00:00	\N	\N
4036	Telmisartan (Oral Pill)	1317640	telmisartan	209b005e-12d7-3d34-e054-00144ff8d46c	2015-09-28 00:00:00	\N	\N
4037	Temazepam (Oral Pill)	836715	Temazepam	f1ff672d-0b95-4e1b-9104-a545e02f4ee7	2015-07-31 00:00:00	\N	\N
4038	TEMODAR (Oral Pill)	1341149	temozolomide	819571ea-b808-4fd8-93c7-1ea2e33d71cf	2011-11-14 00:00:00	\N	\N
4039	TEMOVATE (Topical)	998415	Clobetasol	830a28fb-9b80-4fbb-99dc-56ec80e4e581	2015-07-20 00:00:00	\N	\N
4040	Temozolomide (Oral Pill)	1341149	temozolomide	819571ea-b808-4fd8-93c7-1ea2e33d71cf	2015-07-30 00:00:00	\N	\N
4041	Tenecteplase (Injectable)	19098548	Tenecteplase	66a1e273-ab59-4e7a-a223-a96b86501f51	2011-09-01 00:00:00	\N	\N
4042	TENEX (Oral Pill)	1344965	Guanfacine	886e050c-dd22-4f35-ac3b-243f091125c3	2013-07-26 00:00:00	\N	\N
4043	Tenofovir disoproxil (Oral Pill)	1710281	tenofovir disoproxil	e122435e-cd0b-4c90-940a-b7a0d090d866	2010-04-15 00:00:00	\N	\N
4044	TENORETIC (Oral Pill)	1314002	Atenolol	0ebcca1e-ca16-4483-429a-aec5dcacd1dc	2012-11-08 00:00:00	\N	\N
4045	TENORMIN (Injectable)	1314002	Atenolol	4f266bf9-05ba-45bd-f683-d156c06d9acc	2006-12-08 00:00:00	\N	\N
4046	TERAZOL 3 (Vaginal)	941472	terconazole	61eab575-94e4-41cb-8045-af73424bb316	2014-07-31 00:00:00	\N	\N
4047	TERAZOL 7 (Vaginal)	941472	terconazole	61eab575-94e4-41cb-8045-af73424bb316	2010-12-22 00:00:00	\N	\N
4048	Terazosin (Oral Pill)	1341238	Terazosin	24a4243f-0855-44c1-bb78-ba6f14b273f9	2015-09-16 00:00:00	\N	\N
4049	Terbinafine (Oral Pill)	1741309	terbinafine	aa9f660f-29e6-42fe-ba66-ee9387ce0385	2015-04-16 00:00:00	\N	\N
4050	Terbinafine (Topical)	1741309	terbinafine	2a342421-fc4b-4c21-a394-5ddb9d4a96d5	2015-07-13 00:00:00	\N	\N
4051	Terbutaline (Injectable)	1236744	Terbutaline	cec31032-f366-4524-9e01-63146e473b2b	2014-12-15 00:00:00	\N	\N
4052	Terbutaline (Oral Pill)	1236744	Terbutaline	879be756-991a-42c5-a381-9c8c2ad1fbdb	2015-03-24 00:00:00	\N	\N
4053	Terconazole (Vaginal)	941472	terconazole	2b3923b5-0a97-428c-b8d2-4a3ceb3447a1	2015-04-03 00:00:00	\N	\N
4054	TERRAMYCIN (Oral Pill)	925952	Oxytetracycline	d30ffe60-a418-4425-883e-58d10417b9bf	2014-09-09 00:00:00	\N	\N
4055	Tesamorelin (Injectable)	40231628	tesamorelin	3de31cec-31dc-4ac4-9717-367a687d22f2	2013-03-11 00:00:00	\N	\N
4056	TESSALON PERLES (Oral Pill)	1136601	benzonatate	8edd07a0-5f5b-9000-bafb-dbf8ff7609d4	2013-08-14 00:00:00	\N	\N
4057	TESTOPEL (Implant)	1636780	Testosterone	a1741a0b-3d4c-42dc-880d-a06e96cce9ef	2013-07-05 00:00:00	\N	\N
4058	Testosterone (Buccal)	1636780	Testosterone	9af8ef50-f650-44ca-a272-135bfce9daca	2015-05-21 00:00:00	\N	\N
4059	Testosterone (Implant)	1636780	Testosterone	a1741a0b-3d4c-42dc-880d-a06e96cce9ef	2013-07-05 00:00:00	\N	\N
4060	Testosterone (Injectable)	1636780	Testosterone	786cfd08-40a2-420a-bb29-230db15816bc	2015-08-10 00:00:00	\N	\N
4061	TESTRED (Oral Pill)	1506602	Methyltestosterone	09db5a9d-9662-4bfb-824c-9c9aaad488dc	2015-04-23 00:00:00	\N	\N
4062	"Tetanus toxoid vaccine, inactivated (Injectable)"	529411	"tetanus toxoid vaccine, inactivated"	669abb62-e995-48f1-a80d-e954f9192fa5	2012-08-31 00:00:00	\N	\N
4063	Tetrabenazine (Oral Pill)	836877	Tetrabenazine	5867189c-17bd-4e70-a079-c4730f9950d1	2015-07-20 00:00:00	\N	\N
4064	Tetracaine (Injectable)	1036884	Tetracaine	b29124f7-c238-4961-b810-f4e7fabe4bb1	2010-07-20 00:00:00	\N	\N
4065	Tetracaine (Ophthalmic)	1036884	Tetracaine	5c7b1de4-9f55-1d0e-ef6d-b0ba2cbaba79	2015-09-15 00:00:00	\N	\N
4066	Tetracycline (Oral Pill)	1836948	Tetracycline	d07410b3-37e6-4382-97de-0c2676bc1103	2014-07-22 00:00:00	\N	\N
4067	Tetracycline (Topical)	1836948	Tetracycline	8654de63-4200-439d-b3f9-4a21ef1ad0b4	2014-05-28 00:00:00	\N	\N
4068	Tetrahydrocannabinol (Oral Pill)	1037005	Tetrahydrocannabinol	08adbfd9-789a-4888-a9e2-2a6dac867885	2015-04-03 00:00:00	\N	\N
4069	Tetrahydrozoline (Nasal)	941577	tetrahydrozoline	9bea4aec-219f-46a9-9af4-5baab2552073	2013-09-26 00:00:00	\N	\N
4070	Tetrahydrozoline (Ophthalmic)	941577	tetrahydrozoline	253fb4ed-e6e7-4dee-b2c3-364ccf36dde6	2015-09-25 00:00:00	\N	\N
4071	Tetrahydrozoline/Zinc Sulfate (Ophthalmic)	941577	tetrahydrozoline	ac928224-804c-40c7-b76a-c573ed33535b	2015-09-29 00:00:00	\N	\N
4072	TETRAVISC (Ophthalmic)	1036884	Tetracaine	8534f262-6755-4a3c-980b-c25a6c9110e4	2011-05-27 00:00:00	\N	\N
4073	TETTERINE (Topical)	907879	Miconazole	4de96ed4-7506-4acd-8e8d-ea74bfd18e4a	2014-10-09 00:00:00	\N	\N
4074	TEVETEN HCT (Oral Pill)	1346686	eprosartan	b1dfcac3-ef66-4d3e-9d58-37d3f516eb31	2012-01-04 00:00:00	\N	\N
4075	TEXACORT (Topical)	975125	Hydrocortisone	25279d46-6bad-471f-8bd6-736d53cfd942	2012-05-08 00:00:00	\N	\N
4076	THALITONE (Oral Pill)	1395058	Chlorthalidone	e2eb7dad-3ea3-439c-dcbb-d1d61aa49dfc	2011-08-01 00:00:00	\N	\N
4077	THEO-24 XR (Oral Pill)	1237049	Theophylline	7a108fa0-c230-475f-be93-6f864b98a410	2015-10-01 00:00:00	\N	\N
4078	THEOLAIR (Oral Pill)	1237049	Theophylline	3829d74e-b3ab-46df-a08b-f0327b63304e	2006-09-18 00:00:00	\N	\N
4079	Theophylline (Injectable)	1237049	Theophylline	c3bb34c1-89b2-48c3-9ad2-16b4b2bce5f9	2012-05-22 00:00:00	\N	\N
4080	Theophylline (Oral Liquid)	1237049	Theophylline	2676f761-4fe5-40a9-a07d-ed2542847883	2014-11-21 00:00:00	\N	\N
4081	Theophylline (Oral Pill)	1237049	Theophylline	3829d74e-b3ab-46df-a08b-f0327b63304e	2006-09-18 00:00:00	\N	\N
4082	Theophylline XR (Oral Pill)	1237049	Theophylline	1750235a-ad52-4231-abe5-d3c441ba39e8	2015-10-13 00:00:00	\N	\N
4083	THERA TEARS (Ophthalmic)	949279	Carboxymethylcellulose	661d8764-8ae6-4229-9485-867553ee8e16	2012-07-31 00:00:00	\N	\N
4084	THERACYS (Topical)	19023835	"BCG, Live, Connaught Strain"	8e456333-5a25-4484-84bf-53ece67c000a	2013-11-12 00:00:00	\N	\N
4085	THERASEAL HAND PROTECTION (Topical)	916662	dimethicone	2c8dc616-20c1-4d33-8a89-9bcdb22b35c8	2015-02-04 00:00:00	\N	\N
4086	THERATEARS (Ophthalmic)	949279	Carboxymethylcellulose	17a01236-130f-495b-9f8d-92b6a23b2dc5	2012-10-09 00:00:00	\N	\N
4087	THERMAZENE (Topical)	966956	Silver Sulfadiazine	b3767ee9-038e-43ff-88bf-2a4577ac608a	2015-01-16 00:00:00	\N	\N
4088	Thiamine (Injectable)	19137312	Thiamine	4a8ea036-44e8-4329-ae13-3ef4ada26dfc	2014-09-18 00:00:00	\N	\N
4089	Thioguanine (Oral Pill)	1437379	Thioguanine	4490128b-e73f-4849-9d6e-e8591639d771	2013-03-12 00:00:00	\N	\N
4090	THIOLA (Oral Pill)	903031	tiopronin	494a714e-923c-cd57-df6c-12886afb265a	2012-12-19 00:00:00	\N	\N
4091	Thioridazine (Oral Pill)	700299	Thioridazine	9c4bedb4-2d59-4fcd-aad7-fce988cd96d8	2015-09-22 00:00:00	\N	\N
4092	Thiothixene (Oral Pill)	700465	Thiothixene	92a1f215-e063-4c3e-89f5-f56d78a4c64e	2015-09-24 00:00:00	\N	\N
4093	Thrombin (Topical)	1300673	Thrombin	bcf44467-b1eb-479b-8866-a8ac2c780c22	2015-05-18 00:00:00	\N	\N
4094	Thyroid (USP) (Oral Pill)	1501309	thyroid (USP)	c815faa3-1d02-4680-96ef-5fad1645e99b	2015-03-25 00:00:00	\N	\N
4095	THYROLAR (Oral Pill)	1501700	Thyroxine	7d028b83-5166-4b2e-b442-ba6cbfefbfd6	2013-05-17 00:00:00	\N	\N
4096	Thyrotropin-Releasing Hormone (Injectable)	19001701	Thyrotropin-Releasing Hormone	af5da799-76bf-415a-9dc7-99c7ddc62bc4	2012-10-24 00:00:00	\N	\N
4097	tiaGABine (Oral Pill)	715458	tiagabine	25225511-70b8-4377-ad4f-6629025ac75f	2015-05-14 00:00:00	\N	\N
4098	TICE BCG (Topical)	19086176	"BCG, Live, Tice Strain"	c9b74876-e665-442b-87ad-b7333bc9a67a	2014-03-26 00:00:00	\N	\N
4099	Ticlopidine (Oral Pill)	1302398	Ticlopidine	13d85420-75e2-46e7-93eb-dcd10675cd03	2013-06-03 00:00:00	\N	\N
4100	TIGAN (Injectable)	942799	trimethobenzamide	97191d37-7c2e-48c6-91bf-0631fd7b1dd8	2011-01-04 00:00:00	\N	\N
4101	TIGAN (Oral Pill)	942799	trimethobenzamide	01a95f6d-f7d6-4ed1-a262-3c5848915252	2013-03-12 00:00:00	\N	\N
4102	TIGER BALM (Topical)	938205	Camphor	ce703715-4c11-472c-9270-daac87b7be05	2015-01-13 00:00:00	\N	\N
4103	TIGER BALM LINIMENT (Topical)	901656	Menthol	51293a06-5922-4072-ae14-afaba9c1b58e	2013-04-26 00:00:00	\N	\N
4104	TIGER BALM MUSCLE RUB (Topical)	938205	Camphor	24385c6e-11d8-4573-ab23-7ad0fa981a84	2015-05-29 00:00:00	\N	\N
4105	Timolol (Ophthalmic)	902427	Timolol	c9726422-f794-4d39-a437-17dcb8c0f3b5	2015-08-17 00:00:00	\N	\N
4106	Timolol (Oral Pill)	902427	Timolol	57c62928-63d8-4505-9b9e-c085a3a12c95	2014-06-20 00:00:00	\N	\N
4107	TIMOPTIC (Ophthalmic)	902427	Timolol	15ca19c2-f28b-4703-aa23-5af265af9e8b	2015-08-18 00:00:00	\N	\N
4108	Timothy grass pollen extract (Injectable)	40161488	Timothy grass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2015-07-13 00:00:00	\N	\N
4109	Timothy grass pollen extract (Sublingual)	40161488	Timothy grass pollen extract	1d7f3e56-c233-47a4-9bcd-80098ffff47d	2015-02-27 00:00:00	\N	\N
4110	TINACTIN (Topical)	902950	Tolnaftate	ec83cef5-d8ea-4df1-aa2a-08c25040b32c	2015-09-21 00:00:00	\N	\N
4111	TINDAMAX (Oral Pill)	1702559	Tinidazole	a0d01539-8413-4703-94cc-d221918630a1	2013-07-29 00:00:00	\N	\N
4112	TINEACIDE ANTIFUNGAL (Topical)	914244	Undecylenate	3a7caf9f-2552-41be-a7d4-ac3a18b5a0d5	2011-03-23 00:00:00	\N	\N
4113	TING (Topical)	902950	Tolnaftate	bc89b8ec-4f9d-42d8-a38c-9b6284a54a34	2010-10-09 00:00:00	\N	\N
4114	Tinidazole (Oral Pill)	1702559	Tinidazole	c8169a92-39e3-4794-87f5-13d31f0f15b3	2015-08-12 00:00:00	\N	\N
4115	Tinzaparin (Injectable)	1308473	tinzaparin	1513b960-d9d1-11de-8a1e-0002a5d5c51b	2010-10-21 00:00:00	\N	\N
4116	Tioconazole (Vaginal)	942028	tioconazole	22ac4774-87b4-437f-8520-e4a4ed6e1c55	2015-09-30 00:00:00	\N	\N
4117	Tiopronin (Oral Pill)	903031	tiopronin	494a714e-923c-cd57-df6c-12886afb265a	2012-12-19 00:00:00	\N	\N
4118	Tirofiban (Injectable)	19017067	tirofiban	fe0ced75-ccbf-4d2e-bd0d-b57e60ab913f	2015-05-22 00:00:00	\N	\N
4119	TISSEEL (Topical)	19036781	Calcium Chloride	e1aca067-0c96-4025-88bc-bd2345a46a30	2014-04-29 00:00:00	\N	\N
4120	TITRALAC (Chewable)	19035704	Calcium Carbonate	5d630381-88f0-4406-af0c-95b86c43f3c9	2011-04-28 00:00:00	\N	\N
4121	TITRALAC PLUS (Chewable)	19035704	Calcium Carbonate	68725b83-46fc-47ae-bb5c-51f080dcacfe	2011-04-28 00:00:00	\N	\N
4122	TIVICAY (Oral Pill)	43560385	dolutegravir	63df5af3-b8ac-4e76-9830-2dbb340af922	2015-08-07 00:00:00	\N	\N
4123	TIVORBEX (Oral Pill)	1178663	Indomethacin	04ca474c-798e-43dd-be7a-1b36720e6a3d	2015-07-06 00:00:00	\N	\N
4124	tiZANidine (Oral Pill)	778474	tizanidine	d24e0cda-a22f-404f-b861-f85090cef099	2015-10-01 00:00:00	\N	\N
4125	TL GARD RX (Oral Pill)	19111620	Folic Acid	737ba5b9-8aec-4593-a93a-d3d0b4a5c529	2013-05-20 00:00:00	\N	\N
4126	TNKASE (Injectable)	19098548	Tenecteplase	66a1e273-ab59-4e7a-a223-a96b86501f51	2011-09-01 00:00:00	\N	\N
4127	Tobacco leaf extract (Injectable)	40162187	tobacco leaf extract	d71013ab-718c-4cb0-ae1a-31fdd6db8851	2009-12-18 00:00:00	\N	\N
4128	TOBI (Inhalant)	902722	Tobramycin	625a4499-4e46-4f5a-8d0c-d104f520d97e	2015-04-27 00:00:00	\N	\N
4129	TOBRADEX (Ophthalmic)	1518254	Dexamethasone	330ac1f7-d583-454d-96bf-37c5af31a369	2015-09-30 00:00:00	\N	\N
4130	TOBRAFLEX (Ophthalmic)	955583	Fluorometholone	cbdf11f4-d84c-4c4a-aac2-f8c23304fb02	2008-03-13 00:00:00	\N	\N
4131	Tobramycin (Inhalant)	902722	Tobramycin	da1e5afd-d707-4af1-8935-8195ba6d769f	2015-04-27 00:00:00	\N	\N
4132	Tobramycin (Injectable)	902722	Tobramycin	8cfeb84f-193a-458a-bdec-205d9274e1a4	2015-04-20 00:00:00	\N	\N
4133	Tobramycin (Ophthalmic)	902722	Tobramycin	cdd423c5-a231-47d4-bf51-00b5c29e6a60	2015-05-20 00:00:00	\N	\N
4134	TOBREX (Ophthalmic)	902722	Tobramycin	3d4be22b-7a8c-4247-ac35-143611342de1	2013-07-01 00:00:00	\N	\N
4135	Tofacitinib (Oral Pill)	42904205	tofacitinib	68e3d6b2-7838-4d2d-a417-09d919b43e13	2012-11-09 00:00:00	\N	\N
4136	TOLAZamide (Oral Pill)	1502809	Tolazamide	f82dcff5-4afa-45d8-bc8c-f0f7c0c96272	2012-01-23 00:00:00	\N	\N
4137	TOLBUTamide (Oral Pill)	1502855	Tolbutamide	3995eed8-39ec-ce5e-8cc2-062f93445c8d	2014-06-17 00:00:00	\N	\N
4138	Tolcapone (Oral Pill)	715727	tolcapone	a0e47a9d-78e7-4523-983a-aa259f221736	2015-10-09 00:00:00	\N	\N
4139	Tolmetin (Oral Pill)	1102917	Tolmetin	6e0228a8-e3d3-4ae9-8873-d7aa3e0dcfee	2015-08-06 00:00:00	\N	\N
4140	Tolnaftate (Topical)	902950	Tolnaftate	7357adcd-437d-4651-8922-6ef830f9f85a	2015-09-21 00:00:00	\N	\N
4141	Tolterodine (Oral Pill)	913782	tolterodine	304023e8-57ad-4dd7-9cf0-a4524623aa6c	2015-09-30 00:00:00	\N	\N
4142	TOPAMAX (Oral Pill)	742267	topiramate	cea5f748-3127-4d36-83af-9ab3cf58503c	2012-06-18 00:00:00	\N	\N
4143	TOPEX (Oral Gel)	917006	Benzocaine	87083cc6-fedc-4676-84e1-3134f690dfa9	2010-07-20 00:00:00	\N	\N
4144	TOPICAL HEMO-STAT (Mucosal)	957393	aluminum chloride	6223c9d2-5944-4ca1-bf6f-24047a51a5f5	2010-07-20 00:00:00	\N	\N
4145	TOPICORT (Topical)	917336	Desoximetasone	96dfac6f-540f-4b7d-bcee-7e62088ebc93	2015-10-06 00:00:00	\N	\N
4146	Topiramate (Oral Pill)	742267	topiramate	cea5f748-3127-4d36-83af-9ab3cf58503c	2015-09-30 00:00:00	\N	\N
4147	Topotecan (Injectable)	1378509	Topotecan	996430c0-ee26-4ed9-82b8-a8b645becba6	2015-09-22 00:00:00	\N	\N
4148	Toremifene (Oral Pill)	1342346	Toremifene	2cab8dd1-3a10-48e6-86ce-0e5275ed49e5	2012-11-29 00:00:00	\N	\N
4149	Torsemide (Injectable)	942350	torsemide	f95454ab-33fa-483b-bba3-91d6562765c3	2014-04-29 00:00:00	\N	\N
4150	Torsemide (Oral Pill)	942350	torsemide	cf288ad5-d4e7-4b0b-bfd0-41c5327e6984	2015-08-18 00:00:00	\N	\N
4151	TRADJENTA (Oral Pill)	40239216	Linagliptin	dfe327e8-f6ab-41e5-bdef-d520118cd83a	2014-07-22 00:00:00	\N	\N
4152	traMADol (Oral Pill)	1103314	Tramadol	d5ab4f08-1d12-4c64-b3bf-e72c705aeca8	2015-08-05 00:00:00	\N	\N
4153	TRANDATE (Oral Pill)	1386957	Labetalol	a4195473-51a9-40f1-8678-1478ebca2d84	2010-12-07 00:00:00	\N	\N
4154	Trandolapril (Oral Pill)	1342439	trandolapril	26404e50-011e-4068-9745-647d2de681a3	2015-07-28 00:00:00	\N	\N
4155	Tranexamic Acid (Injectable)	1303425	Tranexamic Acid	6f033f1e-8c78-4c87-b870-6493944315ff	2015-09-15 00:00:00	\N	\N
4156	Tranexamic Acid (Oral Pill)	1303425	Tranexamic Acid	add851b1-0f2d-46e9-b122-f4f5ff216539	2013-11-18 00:00:00	\N	\N
4157	TRANSANOSIL (Topical)	939881	Capsaicin	14b76eca-29f6-4dbd-890b-f72865877ad3	2013-08-27 00:00:00	\N	\N
4158	TRANXENE (Oral Pill)	790253	clorazepate	9c7ab45c-7461-6e4e-ee6d-f0ebe3eb4a28	2013-08-29 00:00:00	\N	\N
4159	Tranylcypromine (Oral Pill)	703470	Tranylcypromine	cd45db80-3cf3-4714-989b-de11f249bdfb	2013-10-18 00:00:00	\N	\N
4160	Trastuzumab (Injectable)	1387104	trastuzumab	492dbdb2-077e-4064-bff3-372d6af0a7a2	2015-05-07 00:00:00	\N	\N
4161	TRASYLOL (Injectable)	19000729	Aprotinin	8a5982c6-825f-4d05-90f5-1519a7291d15	2007-05-17 00:00:00	\N	\N
4162	TRAVATAN (Ophthalmic)	904501	travoprost	db08d5f3-6713-4372-a66c-fad3018ef5c6	2011-09-02 00:00:00	\N	\N
4163	TRAVEL-EASE (Oral Pill)	994341	Meclizine	c941f16b-b192-4a10-aabe-cc25ee8cc445	2014-03-27 00:00:00	\N	\N
4164	Travoprost (Ophthalmic)	904501	travoprost	db08d5f3-6713-4372-a66c-fad3018ef5c6	2011-09-02 00:00:00	\N	\N
4165	traZODone (Oral Pill)	703547	Trazodone	10124262-e443-49a5-a1cc-8cc34c74d953	2015-03-10 00:00:00	\N	\N
4166	TRETIN X (Topical)	903643	Tretinoin	1cecc7e2-00bd-4c63-af1d-723aaf892f60	2013-08-21 00:00:00	\N	\N
4167	Tretinoin (Oral Pill)	903643	Tretinoin	0f81f505-a962-414e-8612-c3ef3b159e9a	2013-07-19 00:00:00	\N	\N
4168	Tretinoin (Topical)	903643	Tretinoin	ac92dfd3-6517-43d0-b6c1-b86fdf3a761f	2015-09-14 00:00:00	\N	\N
4169	TRETTEN (Injectable)	19106100	factor XIII	8664978e-1814-4930-aca5-97a24455f6df	2014-09-22 00:00:00	\N	\N
4170	TREXALL (Oral Pill)	1305058	Methotrexate	e942f8db-510f-44d6-acb5-b822196f5e8c	2014-05-21 00:00:00	\N	\N
4171	TREZIX (Oral Pill)	1125315	Acetaminophen	63841f53-a567-4102-80b5-3565d9b52373	2011-07-18 00:00:00	\N	\N
4172	TRI-CHLOR (Topical)	987009	Trichloroacetate	d929f1d6-3234-491c-b084-644c91e61302	2010-10-08 00:00:00	\N	\N
4173	TRI-LUMA (Topical)	996541	fluocinolone	a35fa709-5eb5-4429-b38f-f1e0019bf0ee	2014-04-15 00:00:00	\N	\N
4174	TRIACIN C (Oral Liquid)	1201620	Codeine	6cc01bb7-27c5-43c4-8e21-64ecbfbb4fa2	2015-07-30 00:00:00	\N	\N
4175	Triamcinolone (Injectable)	903963	Triamcinolone	53522b35-6215-4e9c-b51d-8b81728e0817	2015-08-24 00:00:00	\N	\N
4176	Triamcinolone (Oral Paste)	903963	Triamcinolone	b353c8b1-9088-4969-8199-37876f2461cc	2014-10-15 00:00:00	\N	\N
4177	Triamcinolone (Topical)	903963	Triamcinolone	5b1d1510-118f-4b82-9119-386d572971d2	2015-09-17 00:00:00	\N	\N
4178	TRIAMINIC COLD AND ALLERGY REFORMULATED JAN 2014 (Oral Liquid)	1130863	Brompheniramine	0da4b415-6aaf-4c64-9c1c-f59e7edc4db2	2014-01-29 00:00:00	\N	\N
4179	TRIAMINIC COUGH & SORE THROAT REFORMULATED JUL 2007 (Oral Liquid)	1125315	Acetaminophen	bccbf604-768c-4e20-995a-bb0212374202	2015-09-22 00:00:00	\N	\N
4180	TRIAMINIC COUGH AND CONGESTION (Oral Liquid)	1119510	Dextromethorphan	85cdcb69-2336-4e36-9f24-711d391f3215	2014-06-20 00:00:00	\N	\N
4181	TRIAMINIC DAY TIME COLD & COUGH (Oral Liquid)	1119510	Dextromethorphan	9437b637-fb70-41dd-8ead-d79698a61e22	2015-07-06 00:00:00	\N	\N
4182	TRIAMINIC FEVER & PAIN (Oral Liquid)	1125315	Acetaminophen	d8b68434-2d0b-4431-b79d-7d6510f50e1b	2012-10-22 00:00:00	\N	\N
4183	TRIAMINIC LONG ACTING COUGH (Oral Liquid)	1119510	Dextromethorphan	83bb1f25-23e8-4827-bfc4-25ff3c87de18	2014-10-01 00:00:00	\N	\N
4184	TRIAMINIC NIGHT TIME COLD & COUGH (Oral Liquid)	1129625	Diphenhydramine	40ae8bfc-4007-4483-bb08-cf32f2e802c6	2012-11-13 00:00:00	\N	\N
4185	Triamterene (Oral Pill)	904542	Triamterene	ffe24e3d-cfe8-4d5a-8213-69f0bbc9f4d5	2015-04-29 00:00:00	\N	\N
4186	TRIANEX (Topical)	903963	Triamcinolone	cde13809-a606-12ca-aece-f2ae594baa71	2015-02-19 00:00:00	\N	\N
4187	Triazolam (Oral Pill)	704599	Triazolam	6d743386-a8e4-4a3f-ac82-c046896f35ae	2015-08-26 00:00:00	\N	\N
4188	Trichloroacetate (Topical)	987009	Trichloroacetate	1c515490-1d4a-408c-8a99-0f9b34dbe270	2014-09-25 00:00:00	\N	\N
4189	Trichophyton mentagrophytes extract (Injectable)	40167348	Trichophyton mentagrophytes extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
4190	Trichothecium roseum extract (Injectable)	40175764	Trichothecium roseum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
4191	Triclosan (Soap)	1704758	Triclosan	439c9213-b6b2-4dd6-bf5c-1d2209cb28c8	2015-09-11 00:00:00	\N	\N
4192	Triclosan (Topical)	1704758	Triclosan	3fc53a6d-15cb-44d0-8e0c-e0ab48a6f748	2015-09-17 00:00:00	\N	\N
4193	TRICOR (Oral Pill)	1551803	Fenofibrate	194cd14a-d952-4507-91be-3f1d5371d3b8	2014-06-11 00:00:00	\N	\N
4194	Trientine (Oral Pill)	19004969	Trientine	c34f77a7-996b-4470-b5df-d946a7fe5dbe	2015-01-12 00:00:00	\N	\N
4195	TRIESENCE (Injectable)	903963	Triamcinolone	3f045347-3e5e-4bbd-90f8-6c3100985ca5	2011-06-22 00:00:00	\N	\N
4196	Trifluoperazine (Oral Pill)	704984	Trifluoperazine	10b124e8-3167-4b2c-85f1-197b5aa8dabf	2014-04-15 00:00:00	\N	\N
4197	Trifluridine (Ophthalmic)	905078	Trifluridine	f3a14d86-0ff2-4535-318c-ac8bc8ede42c	2014-06-26 00:00:00	\N	\N
4198	Trihexyphenidyl (Oral Liquid)	705178	Trihexyphenidyl	d6f08000-e973-4bab-810c-b69f6c8ee4f3	2015-06-30 00:00:00	\N	\N
4199	Trihexyphenidyl (Oral Pill)	705178	Trihexyphenidyl	d25fa10c-cc9c-4d8c-9896-4ccc544bbbde	2014-08-26 00:00:00	\N	\N
4200	Triiodothyronine (Injectable)	1505346	Triiodothyronine	4cd4baf4-18d2-434f-b80b-4f4b19996cf9	2013-05-07 00:00:00	\N	\N
4201	Triiodothyronine (Oral Pill)	1505346	Triiodothyronine	fecd164d-1344-4d2f-97a7-ebe972470d2b	2015-09-28 00:00:00	\N	\N
4202	TRILEPTAL (Oral Pill)	718122	oxcarbazepine	d9741f36-0abd-49b7-9f43-e9700663122b	2012-02-27 00:00:00	\N	\N
4203	TRILIPIX (Oral Pill)	1551803	Fenofibrate	3057fc9c-ff77-43eb-b687-776660423742	2012-01-03 00:00:00	\N	\N
4204	Trilostane (Oral Pill)	19042801	trilostane	22a5e838-c9a3-40d2-84cd-15df6ada913b	2015-09-22 00:00:00	\N	\N
4205	Trimethobenzamide (Injectable)	942799	trimethobenzamide	c1d3cc1f-f990-42b1-bc42-3551c1bfa12a	2015-07-14 00:00:00	\N	\N
4206	Trimethobenzamide (Oral Pill)	942799	trimethobenzamide	760afbcd-bc81-4595-82c8-ec1cbd7c2b08	2015-02-09 00:00:00	\N	\N
4207	Trimethoprim (Oral Liquid)	1705674	Trimethoprim	a06ea7d8-a884-4b62-a87f-c36d824f2aa4	2014-09-29 00:00:00	\N	\N
4208	Trimethoprim (Oral Pill)	1705674	Trimethoprim	7d25e3f9-7b0d-452d-953e-f100bb0f2db7	2014-07-08 00:00:00	\N	\N
4209	Trimetrexate (Injectable)	1750928	Trimetrexate	ad0f8925-f817-4460-aa6b-172a043a440b	2006-09-18 00:00:00	\N	\N
4210	Trimipramine (Oral Pill)	705755	Trimipramine	0177d783-773c-41bf-9db9-eb7e5c64474a	2015-05-20 00:00:00	\N	\N
4211	TRIMOX (Oral Pill)	1713332	Amoxicillin	2f4c571b-a27e-40ef-b0cd-e6e44ac9a15e	2014-12-23 00:00:00	\N	\N
4212	TRIOSTAT (Injectable)	1505346	Triiodothyronine	4cd4baf4-18d2-434f-b80b-4f4b19996cf9	2013-05-07 00:00:00	\N	\N
4213	TRIPLE PASTE (Topical)	911064	Zinc Oxide	f9fd9395-48bc-43be-a3d9-ec7fcad339a9	2015-01-28 00:00:00	\N	\N
4214	TRIPLE PASTE AF (Topical)	907879	Miconazole	8d19b86d-b63c-485f-b143-2bc35f76c659	2013-11-18 00:00:00	\N	\N
4215	Triprolidine (Oral Liquid)	1105889	Triprolidine	cc466d33-cf3e-4f1c-a794-6d3d79903adf	2014-03-06 00:00:00	\N	\N
4216	TRISENOX (Injectable)	1333379	arsenic trioxide	dec51fab-3784-deb7-752f-2d4d5692a20f	2015-05-29 00:00:00	\N	\N
4217	TRIUMEQ (Oral Pill)	1736971	abacavir	2997739a-aa91-42aa-a206-a70e2db7b84f	2015-10-09 00:00:00	\N	\N
4218	TRIZIVIR (Oral Pill)	1736971	abacavir	3354e50f-4dc5-413f-b5ae-87353ab8913d	2014-04-28 00:00:00	\N	\N
4219	Trolamine salicylate (Topical)	943116	trolamine salicylate	e1cfadb7-7370-4735-a87a-071c6eedd87a	2015-09-08 00:00:00	\N	\N
4220	TRONOLANE ANESTHETIC (Rectal)	927478	pramoxine	0d5ba4f1-1178-490d-8524-143d0aa2f0ef	2015-03-06 00:00:00	\N	\N
4221	Tropicamide (Ophthalmic)	906072	Tropicamide	0d4f4a2e-eb00-4c65-b3fa-baf5738d468d	2015-09-04 00:00:00	\N	\N
4222	Trospium (Oral Pill)	991825	Trospium	0ac65eae-b3dd-4cda-aec2-ff1e954a93a4	2013-05-31 00:00:00	\N	\N
4223	Trovafloxacin (Oral Pill)	1712549	trovafloxacin	da9b26bb-d2d7-4113-a0f9-c6c2280f4875	2006-07-13 00:00:00	\N	\N
4224	TROVAN (Oral Pill)	1712549	trovafloxacin	da9b26bb-d2d7-4113-a0f9-c6c2280f4875	2006-07-13 00:00:00	\N	\N
4225	TROVAN IV (Injectable)	19018154	alatrofloxacin	da9b26bb-d2d7-4113-a0f9-c6c2280f4875	2006-07-13 00:00:00	\N	\N
4226	TRU-MICIN (Topical)	943116	trolamine salicylate	49c41d92-9c48-4245-b251-13226fb11c94	2013-06-10 00:00:00	\N	\N
4227	TRUSOPT (Ophthalmic)	981709	dorzolamide	26d26f80-aebf-441c-6383-327cb95eae4d	2014-02-18 00:00:00	\N	\N
4228	TRUVADA (Oral Pill)	1703069	emtricitabine	d0b3d18b-7e5d-49ea-bcaf-8408414e8094	2015-05-29 00:00:00	\N	\N
4229	TUBERSOL (Injectable)	19058274	Purified Protein Derivative of Tuberculin	96d91ba3-9dfe-4420-a835-57647ea30b40	2013-05-22 00:00:00	\N	\N
4230	TUCKS HEMORRHOIDAL (Rectal)	908523	Mineral Oil	347ff421-3ad9-409f-8731-af0183682e12	2012-08-08 00:00:00	\N	\N
4231	TUCKS SUPPOSITORIES (Rectal)	1036157	Starch	1b051fc4-bc4c-4eb6-96f8-f40e577c3072	2012-08-10 00:00:00	\N	\N
4232	TUMS (Chewable)	19035704	Calcium Carbonate	91b240f2-856c-44cf-a3de-a6ead2891f0d	2015-05-29 00:00:00	\N	\N
4233	TUSNEL C (Oral Liquid)	1201620	Codeine	403935ac-5111-4f8b-80ae-1bd47ae774c7	2013-01-31 00:00:00	\N	\N
4234	TUSNEL DIABETIC (Oral Liquid)	1119510	Dextromethorphan	66b3c094-809e-4d2c-bc15-46563de685cb	2012-04-11 00:00:00	\N	\N
4235	TUSSIGON (Oral Pill)	1101703	homatropine	6c0bba34-07db-42f5-9e5e-ad79b71b4276	2014-10-29 00:00:00	\N	\N
4236	TYBOST (Oral Pill)	42874220	cobicistat	3784c35c-e87f-410c-900b-8fd6313c6010	2014-10-09 00:00:00	\N	\N
4237	TYLENOL (Oral Liquid)	1125315	Acetaminophen	ad40b276-fbff-4b8d-9197-32345573fa80	2015-07-21 00:00:00	\N	\N
4238	TYLENOL (Oral Pill)	1125315	Acetaminophen	937d3bee-2c37-4dac-a79b-2c2b2075db7d	2015-08-27 00:00:00	\N	\N
4239	TYLENOL PM (Oral Pill)	1125315	Acetaminophen	1b6e88d7-8e18-4838-9cee-db876f14f14f	2015-08-18 00:00:00	\N	\N
4240	TYLENOL WITH CODEINE (Oral Pill)	1125315	Acetaminophen	96847717-e3ff-42ee-a25b-1df72c427572	2014-12-08 00:00:00	\N	\N
4241	TYPHIM VI (Injectable)	532881	"Typhoid Vi Polysaccharide Vaccine, S typhi Ty2 strain"	ad1fbe7f-2995-45dd-92f3-7baccaab85d9	2014-04-30 00:00:00	\N	\N
4242	"Typhoid Vi Polysaccharide Vaccine, S typhi Ty2 strain (Injectable)"	532881	"Typhoid Vi Polysaccharide Vaccine, S typhi Ty2 strain"	ad1fbe7f-2995-45dd-92f3-7baccaab85d9	2014-04-30 00:00:00	\N	\N
4243	TYZINE (Nasal)	941577	tetrahydrozoline	9bea4aec-219f-46a9-9af4-5baab2552073	2013-09-26 00:00:00	\N	\N
4244	U-CORT (Topical)	975125	Hydrocortisone	1eb217be-34f1-4b3b-a3a5-4dfb83fb6143	2012-03-06 00:00:00	\N	\N
4245	ULESFIA (Topical)	919681	Benzyl Alcohol	aeba2488-1ac3-4c02-833c-78a36859f029	2014-07-29 00:00:00	\N	\N
4246	Ulipristal (Oral Pill)	40225722	ulipristal	052bfe45-c485-49e5-8fc4-51990b2efba4	2014-07-02 00:00:00	\N	\N
4247	ULORIC (Oral Pill)	19017742	febuxostat	3803df6e-b765-4917-ab0e-4d91a23be47f	2015-08-12 00:00:00	\N	\N
4248	ULTIVA (Injectable)	19016749	remifentanil	dbc63b6e-f8c5-4fd0-8ec3-4f5e19125313	2015-03-16 00:00:00	\N	\N
4249	ULTRACET (Oral Pill)	1125315	Acetaminophen	2d20df3c-8b5b-4bdf-a49f-ec904522575d	2014-08-06 00:00:00	\N	\N
4250	ULTRAM (Oral Pill)	1103314	Tramadol	288ddb7b-29e4-46c7-9d84-38a188231710	2014-12-22 00:00:00	\N	\N
4251	ULTRASAL (Topical)	964407	Salicylic Acid	a01a3ccd-d9bc-40b6-b269-cddd6d0e47c5	2014-10-08 00:00:00	\N	\N
4252	ULTRAVATE (Topical)	949759	halobetasol	b73836e9-7ccc-41bb-b4ef-65ad2d865085	2014-02-27 00:00:00	\N	\N
4253	ULTRESA (Oral Pill)	919204	Amylases	73861076-218d-4f8e-872d-0e0690c374a8	2015-04-01 00:00:00	\N	\N
4254	UMECTA (Topical)	906914	Urea	fd7b3fe5-8ba6-4808-8ead-1b20a87a2ed2	2012-01-03 00:00:00	\N	\N
4255	UMECTA PD (Topical)	787787	hyaluronate	ce953fdf-a73a-4f7e-8946-959346990626	2011-12-02 00:00:00	\N	\N
4256	Undecylenate (Topical)	914244	Undecylenate	eaedf82d-2fae-4360-8a88-f2f62ae9a18c	2015-08-10 00:00:00	\N	\N
4257	UNISOM SLEEP (Oral Disintegrating)	1129625	Diphenhydramine	9105f4f1-7f94-408d-a025-83afb68dc9f0	2015-05-12 00:00:00	\N	\N
4258	UNISOM SLEEP (Oral Pill)	1129625	Diphenhydramine	17383d22-91cc-4d9e-a0b8-3f7d9a18af83	2012-03-12 00:00:00	\N	\N
4259	UNITHROID (Oral Pill)	1501700	Thyroxine	07562e72-7eaa-4ce6-94f0-e08814787e50	2014-07-03 00:00:00	\N	\N
4260	UNIVASC (Oral Pill)	1310756	moexipril	e16c2ad3-1ce5-48fc-96b2-5d63dc6b68d5	2012-10-04 00:00:00	\N	\N
4261	URAMAXIN (Topical)	906914	Urea	67993648-4930-4a98-8d26-5995b4e58b45	2012-04-27 00:00:00	\N	\N
4262	Urea (Topical)	906914	Urea	0e5d02d2-fa60-46e9-b45c-9fd5ee51a637	2015-01-22 00:00:00	\N	\N
4263	URECHOLINE (Oral Pill)	937439	Bethanechol	5513ddc8-90c8-4548-8188-5a807465cdc4	2013-09-23 00:00:00	\N	\N
4264	URELLE (Oral Pill)	923672	Hyoscyamine	d801fc5b-f0df-4347-9b9b-8f439328cdde	2015-01-16 00:00:00	\N	\N
4265	URIBEL (Oral Pill)	923672	Hyoscyamine	fa2cc334-bd86-46cc-bc6a-12c71303f963	2010-08-02 00:00:00	\N	\N
4266	URICALM INTENSIVE (Oral Pill)	1125315	Acetaminophen	99730efd-aa2a-4437-bef2-60aa3f349905	2013-09-30 00:00:00	\N	\N
4267	UROCIT-K XR (Oral Pill)	976545	potassium citrate	d2c923d5-85c1-4bbb-9f93-556080a5ef87	2011-04-08 00:00:00	\N	\N
4268	Urofollitropin (Injectable)	1515417	Urofollitropin	46f7740f-c879-4a77-9a16-2821fd772641	2006-09-28 00:00:00	\N	\N
4269	UROGESIC BLUE REFORMULATED APR 2012 (Oral Pill)	923672	Hyoscyamine	36527dcb-dc17-469c-8286-b752b0d8badf	2013-02-22 00:00:00	\N	\N
4270	URSO (Oral Pill)	988095	Ursodeoxycholate	e8fc4fc2-fe5c-4cba-b6e0-5ceaf2157a61	2013-06-28 00:00:00	\N	\N
4271	Ursodeoxycholate (Oral Pill)	988095	Ursodeoxycholate	c9aa0223-3ea4-4cb7-b53b-f35e5a04cec7	2015-08-03 00:00:00	\N	\N
4272	UTA CAPSULE (Oral Pill)	923672	Hyoscyamine	206ac12b-a081-4e37-aa0e-73b8794608d8	2010-07-19 00:00:00	\N	\N
4273	UVADEX (Injectable)	905223	Methoxsalen	5ad333bd-845f-43f8-9ecf-43491f26c7c7	2015-05-19 00:00:00	\N	\N
4274	VAGIFEM (Vaginal)	1548195	Estradiol	d67888ac-5041-4758-88db-845a41f67df4	2012-03-28 00:00:00	\N	\N
4275	VAGISIL ORIGINAL FORMULA (Vaginal)	917006	Benzocaine	4929a228-44bc-4f1c-b1d9-a82132c5c278	2015-09-01 00:00:00	\N	\N
4276	VAGISTAT (Vaginal)	907879	Miconazole	c91cba6b-61fc-4708-9edb-3ba086cc1038	2014-09-30 00:00:00	\N	\N
4277	valACYclovir (Oral Pill)	1717704	valacyclovir	c31fdda3-217c-c452-eb9b-aba705456aa1	2015-10-05 00:00:00	\N	\N
4278	VALCHLOR (Topical)	1394337	Mechlorethamine	706bd420-2f32-11e0-aaee-0002a5d5c51b	2013-10-21 00:00:00	\N	\N
4279	VALCYTE (Oral Liquid)	1703063	valganciclovir	dc548ff9-e8ea-4d6e-b9b4-e31f53ac4078	2015-05-07 00:00:00	\N	\N
4280	VALCYTE (Oral Pill)	1703063	valganciclovir	dc548ff9-e8ea-4d6e-b9b4-e31f53ac4078	2015-05-07 00:00:00	\N	\N
4281	Valdecoxib (Oral Pill)	1103374	valdecoxib	caf64301-262c-45ca-acd1-a9d6696c584e	2007-03-23 00:00:00	\N	\N
4282	valGANciclovir (Oral Liquid)	1703063	valganciclovir	dc548ff9-e8ea-4d6e-b9b4-e31f53ac4078	2015-05-07 00:00:00	\N	\N
4283	valGANciclovir (Oral Pill)	1703063	valganciclovir	4db6dd63-e56b-45a4-86b2-ee125a1854a0	2015-05-07 00:00:00	\N	\N
4284	VALIUM (Oral Pill)	723013	Diazepam	957f79d9-2bcb-4e6b-885d-fa34851f062d	2013-01-29 00:00:00	\N	\N
4285	Valproate (Injectable)	745466	Valproate	7a687b2f-246d-4736-a20c-92421c263268	2015-06-29 00:00:00	\N	\N
4286	Valproate (Oral Liquid)	745466	Valproate	caf12ea3-06c8-44c1-9e89-3ecaff89a22b	2015-03-05 00:00:00	\N	\N
4287	Valproate (Oral Pill)	745466	Valproate	f738ddad-fef0-43cb-b791-b046fdcec311	2015-09-14 00:00:00	\N	\N
4288	Valsartan (Oral Pill)	1308842	valsartan	8e4382de-df78-4821-b11e-c423442a7ff8	2015-09-24 00:00:00	\N	\N
4289	VALTREX (Oral Pill)	1717704	valacyclovir	b4450539-78ec-4e8a-8cfc-56dcde7984a0	2013-06-14 00:00:00	\N	\N
4290	VANACOF-8 (Oral Liquid)	1150886	chlophedianol	fc6b92e8-932a-4040-b424-c2cb5b1b503c	2014-09-10 00:00:00	\N	\N
4291	VANCOCIN (Oral Pill)	1707687	Vancomycin	b7f386c7-8b78-4751-b6ae-e171925c2d54	2012-08-06 00:00:00	\N	\N
4292	Vancomycin (Injectable)	1707687	Vancomycin	b01aaa02-8f1d-4b57-96a5-337503428af1	2015-08-18 00:00:00	\N	\N
4293	Vancomycin (Oral Pill)	1707687	Vancomycin	a078d9c2-f89c-4f9f-8ded-60ffb2983c3f	2015-04-27 00:00:00	\N	\N
4294	VANDAZOLE (Vaginal)	1707164	Metronidazole	27d71471-8f89-4a1e-8c55-020a58961454	2013-10-22 00:00:00	\N	\N
4295	Vandetanib (Oral Pill)	40238052	Vandetanib	d2a87691-c9ad-4753-97a1-311fccfe6515	2012-02-13 00:00:00	\N	\N
4296	VANIPLY (Topical)	916662	dimethicone	53f53dc6-21e3-4f55-bc0f-b0615dd8c8cf	2012-02-07 00:00:00	\N	\N
4297	VANIQA (Topical)	978236	Eflornithine	a2c3d206-b893-4f65-a2f6-c11fa9a0e486	2013-09-10 00:00:00	\N	\N
4298	VANOS (Topical)	955252	Fluocinonide	34b91547-31f6-4043-b91c-16c9ebd81349	2010-12-10 00:00:00	\N	\N
4299	VANOXIDE-HC (Topical)	918172	Benzoyl Peroxide	1f0edbd9-103e-4a49-b7a8-6552ef172c13	2014-10-24 00:00:00	\N	\N
4300	VAPRISOL (Injectable)	19010927	conivaptan	5150d9d9-01dc-4a52-9858-214c66d8caea	2015-05-01 00:00:00	\N	\N
4301	Vardenafil (Oral Disintegrating)	1311276	vardenafil	0e5139d8-bf61-4f21-a36b-81b96b9b07d1	2015-09-23 00:00:00	\N	\N
4302	Vardenafil (Oral Pill)	1311276	vardenafil	b3bbc16e-8305-469a-9dc3-8e698339a98b	2015-09-23 00:00:00	\N	\N
4303	Varenicline (Oral Pill)	780442	varenicline	2468ba8d-4c77-4ea0-88d8-b64497a72222	2014-09-29 00:00:00	\N	\N
4304	Varicella-zoster immune globulin (Injectable)	543291	varicella-zoster immune globulin	ac96a331-e2ff-4839-a4d5-fda3d858c969	2015-08-07 00:00:00	\N	\N
4305	VARITHENA (Injectable)	40175900	polidocanol	dfd6b4a0-b0dc-11e2-9e96-0800200c9a66	2015-03-23 00:00:00	\N	\N
4306	VARIZIG (Injectable)	543291	varicella-zoster immune globulin	ac96a331-e2ff-4839-a4d5-fda3d858c969	2015-08-07 00:00:00	\N	\N
4307	VASELINE (Topical)	19033354	Petrolatum	eb182cdf-985e-4039-b426-fcbaef1ef78d	2014-12-08 00:00:00	\N	\N
4308	VASOCON (Ophthalmic)	914533	Naphazoline	0f25812f-96ab-44f4-bacf-2eb012cbddc7	2006-09-18 00:00:00	\N	\N
4309	Vasopressin (USP) (Injectable)	1507835	Vasopressin (USP)	977ab16e-c2c1-4aa2-98cb-af065b37c944	2015-10-13 00:00:00	\N	\N
4310	VASOSTRICT (Injectable)	1507835	Vasopressin (USP)	b1147beb-743e-4c62-8927-91192447f8b8	2015-10-13 00:00:00	\N	\N
4311	VASOTEC (Oral Pill)	1341927	Enalapril	da4704d6-dc9e-4539-809e-4bdbc898043a	2015-10-05 00:00:00	\N	\N
4312	VECAMYL (Oral Pill)	1394333	Mecamylamine	0774cc48-7287-4093-91d6-9df41a81408a	2015-06-12 00:00:00	\N	\N
4313	VECTICAL (Topical)	19035631	Calcitriol	a1567da9-af74-4afd-9ac5-8b53ec5d7cbf	2015-03-11 00:00:00	\N	\N
4314	Vecuronium (Injectable)	19012598	Vecuronium	96e69586-e9af-4b07-990f-12d93faa7edd	2015-06-23 00:00:00	\N	\N
4315	Vedolizumab (Injectable)	45774639	vedolizumab	6e94621c-1a95-4af9-98d1-52b9e6f1949c	2014-05-23 00:00:00	\N	\N
4316	VELETRI (Injectable)	1354118	Epoprostenol	df502787-46ec-4dd1-a2c0-be90f6d95a5d	2013-07-05 00:00:00	\N	\N
4317	Velvet grass pollen extract (Injectable)	40162058	velvet grass pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
4318	Venlafaxine (Oral Pill)	743670	venlafaxine	6490e629-062b-4caa-a0aa-3d9c75c693d7	2015-09-16 00:00:00	\N	\N
4319	VENOFER (Injectable)	1395773	"ferric oxide, saccharated"	f1ab1a22-2b99-4d27-8b5a-9c3bcd5e3040	2014-01-07 00:00:00	\N	\N
4320	Verapamil (Oral Pill)	1307863	Verapamil	0c604923-4a37-45ac-ad93-3610a5eadc16	2015-09-25 00:00:00	\N	\N
4321	Verapamil XR (Oral Pill)	1307863	Verapamil	887b91f5-f117-47e6-8d59-87ac61d17175	2015-08-13 00:00:00	\N	\N
4322	VERSACLOZ (Oral Liquid)	800878	Clozapine	693cb9d4-39db-4ecf-9eae-b01f06f8d5d1	2015-09-30 00:00:00	\N	\N
4323	Verteporfin (Injectable)	912803	Verteporfin	952f4c80-50b1-4308-9ee6-311ffefb13df	2015-01-22 00:00:00	\N	\N
4324	VERTICALM (Oral Pill)	994341	Meclizine	5ce8022e-9d09-4e38-b952-9c7b118ac0fa	2012-04-16 00:00:00	\N	\N
4325	Verticillium albo-atrum extract (Injectable)	40175719	Verticillium albo-atrum extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
4326	VESICARE (Oral Pill)	916005	Solifenacin	e433dc68-6b2a-4c48-beae-4ec946f1ff1e	2015-09-15 00:00:00	\N	\N
4327	VFEND (Injectable)	1714277	voriconazole	08d08721-1f4c-478a-8abf-d9c402d50553	2015-04-07 00:00:00	\N	\N
4328	VFEND (Oral Pill)	1714277	voriconazole	ac3e3964-90c0-44dd-800c-ec9606629572	2011-11-14 00:00:00	\N	\N
4329	VIAGRA (Oral Pill)	1316262	sildenafil	1da7847b-16e4-4bf1-957f-3894d023b339	2015-05-07 00:00:00	\N	\N
4330	VIBATIV (Injectable)	40166675	telavancin	9fc67b76-9ba1-45ec-9749-ca3f3a6477d9	2014-12-15 00:00:00	\N	\N
4331	VICKS VAPODROPS (Oral Lozenge)	901656	Menthol	ff232f72-1ccd-457a-a64d-66c89fd9a510	2012-10-12 00:00:00	\N	\N
4332	VICKS VAPORUB (Topical)	938205	Camphor	e69a7c9b-fd04-4109-a7c8-6edfd83855fc	2012-10-12 00:00:00	\N	\N
4333	VICKS VAPOSTEAM (Inhalant)	938205	Camphor	196a38e2-efe5-4fc8-a5bd-eb9e9f07ba8b	2012-10-12 00:00:00	\N	\N
4334	VICODIN (Oral Pill)	1125315	Acetaminophen	496ed99b-7bce-4ade-b7c3-6c59feebce6f	2011-05-16 00:00:00	\N	\N
4335	VIDAZA (Injectable)	1314865	Azacitidine	e437efe0-9c6a-4f87-b3b4-de90443b095f	2006-12-23 00:00:00	\N	\N
4336	VIGAMOX (Ophthalmic)	1716903	moxifloxacin	68cca7e1-120c-4ac6-8851-15a17e11bd9f	2014-10-22 00:00:00	\N	\N
4337	VIIBRYD (Oral Pill)	40234834	vilazodone	bfef9e19-d0f5-40fa-954c-b73c812eb242	2015-09-17 00:00:00	\N	\N
4338	Vilazodone (Oral Pill)	40234834	vilazodone	bfef9e19-d0f5-40fa-954c-b73c812eb242	2015-09-17 00:00:00	\N	\N
4339	VIMOVO (Oral Pill)	904453	Esomeprazole	baa47781-7151-4c75-a9a2-d2eac0a7d55e	2015-06-26 00:00:00	\N	\N
4340	vinBLAStine (Injectable)	19008264	Vinblastine	f073b58e-56d6-4c8d-a2ce-b37719402d77	2012-01-25 00:00:00	\N	\N
4341	VINCASAR (Injectable)	1308290	Vincristine	01cee93f-3ab9-44fa-8c9a-dd5958fd2db9	2014-10-27 00:00:00	\N	\N
4342	vinCRIStine (Injectable)	1308290	Vincristine	01cee93f-3ab9-44fa-8c9a-dd5958fd2db9	2014-10-27 00:00:00	\N	\N
4343	Vincristine liposome (Injectable)	42874135	vincristine liposome	a1869e23-b93b-4407-843b-4b830319d82e	2013-01-14 00:00:00	\N	\N
4344	Vinorelbine (Injectable)	1343346	vinorelbine	dd3dcc9a-e40c-4677-9ee6-f318e7c7d835	2015-01-05 00:00:00	\N	\N
4345	VIOKACE (Oral Pill)	919204	Amylases	d85c7e20-4e1d-43cd-a64b-ced3bda70eed	2014-05-06 00:00:00	\N	\N
4346	VIRACEPT (Oral Pill)	1715472	Nelfinavir	84948e6a-971f-4e86-928e-7d32a1883a23	2013-03-28 00:00:00	\N	\N
4347	VIRAMUNE (Oral Pill)	1769389	Nevirapine	46fb9dbc-5345-48a4-a0ec-75039622c76c	2010-06-11 00:00:00	\N	\N
4348	VIREAD (Oral Pill)	1710281	tenofovir disoproxil	e122435e-cd0b-4c90-940a-b7a0d090d866	2010-04-15 00:00:00	\N	\N
4349	VIROPTIC (Ophthalmic)	905078	Trifluridine	f3a14d86-0ff2-4535-318c-ac8bc8ede42c	2014-06-26 00:00:00	\N	\N
4350	VISICOL (Oral Pill)	991710	"Sodium Phosphate, Dibasic"	57ccd52e-5b13-4b39-8aa0-ebecc49a7db4	2010-12-15 00:00:00	\N	\N
4351	VISINE AC (Ophthalmic)	941577	tetrahydrozoline	159f0bae-7a3d-42d8-8572-aebcabae86ba	2015-09-29 00:00:00	\N	\N
4352	VISINE ADVANCED RELIEF (Ophthalmic)	1319156	Dextran 70	619c2e09-aa29-4225-89b9-d2582f89ebe9	2011-01-03 00:00:00	\N	\N
4353	VISINE PURE TEARS (Ophthalmic)	961145	Glycerin	fe902038-7afc-4c54-93fd-1744ca9c659e	2011-09-21 00:00:00	\N	\N
4354	VISINE TIRED EYE RELIEF (Ophthalmic)	961145	Glycerin	2d3f9d75-72e8-47c9-bc73-eabc827b2a11	2015-04-27 00:00:00	\N	\N
4355	VISINE-A (Ophthalmic)	914533	Naphazoline	82500e4c-bc01-4ce0-80d8-6e9f0be99163	2014-04-25 00:00:00	\N	\N
4356	VISKEN (Oral Pill)	1345858	Pindolol	07fe9cc3-1ef2-420c-b45d-7f1e894b6ef9	2006-12-01 00:00:00	\N	\N
4357	Vismodegib (Oral Pill)	42709321	vismodegib	eb368bb6-80e3-4df9-8a85-91df0a2ada6a	2015-06-05 00:00:00	\N	\N
4358	VISTARIL (Oral Pill)	777221	Hydroxyzine	c271f97f-040e-492b-9194-2c8b74675a95	2014-05-16 00:00:00	\N	\N
4359	VISUDYNE (Injectable)	912803	Verteporfin	952f4c80-50b1-4308-9ee6-311ffefb13df	2015-01-22 00:00:00	\N	\N
4360	Vitamin B 12 (Injectable)	1308738	Vitamin B 12	74141034-87b2-4401-b100-44aee4849fe8	2015-07-08 00:00:00	\N	\N
4361	Vitamin B 12 (Nasal)	1308738	Vitamin B 12	ee2b4869-cd13-489b-b12f-1ce4fe081157	2007-05-24 00:00:00	\N	\N
4362	Vitamin B6 (Oral Pill)	1353228	Vitamin B6	a524c0ff-4893-4df0-aaca-7f690b2bbb13	2014-12-19 00:00:00	\N	\N
4363	Vitamin K 1 (Injectable)	19044727	Vitamin K 1	b08d2ba5-c3c5-47ce-a9d6-64d7cee9483b	2015-04-29 00:00:00	\N	\N
4364	Vitamin K 1 (Oral Pill)	19044727	Vitamin K 1	9b9be805-15a6-4391-96d7-062056567d5b	2014-07-07 00:00:00	\N	\N
4365	VITEKTA (Oral Pill)	42874212	elvitegravir	be87c3bc-97bb-49cb-8053-9b0c756a1965	2015-08-07 00:00:00	\N	\N
4366	VITRASE (Injectable)	19073699	Hyaluronidase	21fbd12e-4a12-4ad1-ad01-964cd5ec9996	2015-01-20 00:00:00	\N	\N
4367	VIVACAINE (Injectable)	732893	Bupivacaine	b4c60d8e-e350-45b2-9d6b-5815eeb6c994	2015-09-10 00:00:00	\N	\N
4368	VIVAGLOBIN (Injectable)	19117912	Immunoglobulin G	88eac3b8-55a5-4451-9d25-c30e43ab7068	2010-07-20 00:00:00	\N	\N
4369	VIVARIN (Oral Pill)	1134439	Caffeine	587358ab-e28c-11e3-8b68-0800200c9a66	2014-06-16 00:00:00	\N	\N
4370	VOLTAREN (Topical)	1124300	Diclofenac	2280a305-34bd-4f9c-8f31-d6bb6fad90d5	2015-09-03 00:00:00	\N	\N
4371	VORAXAZE (Injectable)	42709319	glucarpidase	acaef5a6-b740-40e3-8ffe-74a75c74745c	2013-04-08 00:00:00	\N	\N
4372	Voriconazole (Injectable)	1714277	voriconazole	08d08721-1f4c-478a-8abf-d9c402d50553	2015-04-07 00:00:00	\N	\N
4373	Voriconazole (Oral Liquid)	1714277	voriconazole	74f51144-c228-440e-8043-c3ec9cb1b42e	2015-03-27 00:00:00	\N	\N
4374	Voriconazole (Oral Pill)	1714277	voriconazole	f1889599-be14-49af-8781-5594e9bd026b	2015-10-09 00:00:00	\N	\N
4375	Vortioxetine (Oral Pill)	44507700	vortioxetine	4b0700c9-b417-4c3a-b36f-de461e125bd3	2014-09-22 00:00:00	\N	\N
4376	VUSION (Topical)	907879	Miconazole	8d8aaac5-3203-4ade-ae74-e2ea469dae18	2011-04-28 00:00:00	\N	\N
4377	VYTONE (Topical)	975125	Hydrocortisone	3d7278ee-2c8e-4df1-9372-d43403122945	2013-09-06 00:00:00	\N	\N
4378	VYTORIN (Oral Pill)	1526475	ezetimibe	65e1c3ae-a462-4345-8a28-c7d2c0388af8	2012-09-07 00:00:00	\N	\N
4379	VYVANSE (Oral Pill)	709567	Lisdexamfetamine	a310fc51-2743-4755-8398-fed5402283f6	2012-01-18 00:00:00	\N	\N
4380	WAL ZYR 24 HOUR ALLERGY (Oral Liquid)	1149196	Cetirizine	416d3ef9-7d36-4f58-815e-178e17d10521	2015-08-28 00:00:00	\N	\N
4381	WAL-ACT (Oral Pill)	1154332	Pseudoephedrine	7f1ff0eb-78e9-465d-9ec9-a900fe8bd9c4	2015-04-13 00:00:00	\N	\N
4382	WAL-DRYL (Topical)	1129625	Diphenhydramine	0c8d5ee1-96ce-407f-947f-dd98f35fc8ad	2014-03-28 00:00:00	\N	\N
4383	WAL-DRYL ALLERGY (Oral Disintegrating)	1129625	Diphenhydramine	826c5868-c9bf-42b2-a97e-2e7ae6fae057	2015-07-02 00:00:00	\N	\N
4384	WAL-DRYL ALLERGY (Oral Pill)	1129625	Diphenhydramine	b484db36-8460-4ea7-b9f5-71cc663b7d77	2015-07-27 00:00:00	\N	\N
4385	WAL-DRYL CHILDRENS (Oral Liquid)	1129625	Diphenhydramine	53e6f72d-15a4-4efe-8b1f-5753fed53df8	2015-10-01 00:00:00	\N	\N
4386	WAL-DRYL-D (Oral Pill)	1129625	Diphenhydramine	d8ed0a4f-c711-4517-b667-3698e9a5699a	2013-03-22 00:00:00	\N	\N
4387	WAL-FEX (Oral Pill)	1153428	fexofenadine	15ad58b4-4056-4602-a663-d600224ae92d	2015-08-07 00:00:00	\N	\N
4388	WAL-FINATE-D (Oral Pill)	1192710	Chlorpheniramine	6c6a8a9f-7af6-4674-9dac-e17c02759359	2015-09-23 00:00:00	\N	\N
4389	WAL-ITIN (Oral Liquid)	1107830	Loratadine	bb7392d6-77b9-42d3-82d2-8b21715774c8	2013-01-24 00:00:00	\N	\N
4390	WAL-ITIN (Oral Pill)	1107830	Loratadine	84d752d2-33e4-4b69-a015-8b744f5f8d3c	2014-10-15 00:00:00	\N	\N
4391	WAL-PHED (Oral Pill)	1154332	Pseudoephedrine	54cc6eff-a5aa-4574-97a0-c2e5295cc840	2015-10-09 00:00:00	\N	\N
4392	WAL-PHED PE (Oral Pill)	1135766	Phenylephrine	b028c23d-4527-47d8-b3e1-04dc6cb16604	2013-10-23 00:00:00	\N	\N
4393	WAL-PROFEN COLD AND SINUS (Oral Pill)	1177480	Ibuprofen	faa26964-a140-4d30-ab1e-19f49f9458ac	2011-11-10 00:00:00	\N	\N
4394	WAL-SLEEP Z (Oral Pill)	1129625	Diphenhydramine	cfb67ead-61f9-4d0f-b2db-792b8df3d148	2012-12-17 00:00:00	\N	\N
4395	WAL-TAP CHILDREN'S COLD & ALLERGY (Oral Liquid)	1130863	Brompheniramine	3f438f28-d1ad-44da-a573-f1b0824b051c	2015-04-17 00:00:00	\N	\N
4396	WAL-TUSSIN CHEST CONGESTION (Oral Liquid)	1163944	Guaifenesin	2a61f2f5-75f5-4b00-bc02-8492180f28b2	2014-08-12 00:00:00	\N	\N
4397	WAL-TUSSIN DM (Oral Liquid)	1119510	Dextromethorphan	21119906-3de1-4bee-b656-cec1f30bdd17	2015-10-02 00:00:00	\N	\N
4398	WAL-ZAN (Oral Pill)	961047	Ranitidine	94d7a63a-8df6-e260-80dd-67e8286e3ce5	2015-08-06 00:00:00	\N	\N
4399	WAL-ZYR (Oral Pill)	1149196	Cetirizine	16625a43-22c1-4754-a7bd-ccc262e2dbd5	2014-01-28 00:00:00	\N	\N
4400	WAL-ZYR ITCHY EYE (Ophthalmic)	986117	Ketotifen	123101a3-ee3c-483a-a347-7200d4c8756d	2013-12-06 00:00:00	\N	\N
4401	Warfarin (Oral Pill)	1310149	Warfarin	de5e4ed4-e9a5-4784-b512-b40199f17bd8	2015-08-14 00:00:00	\N	\N
4402	Water (Injectable)	19010309	Water	ccadcf46-6a6f-436b-9bbc-17e2983a335f	2015-05-21 00:00:00	\N	\N
4403	Water (Irrigation)	19010309	Water	fb20b834-4ca2-4ef0-ab16-8c7e1e3cd3b9	2015-08-11 00:00:00	\N	\N
4404	Water (Ophthalmic)	19010309	Water	6119892d-ce34-4b3e-9a3e-3f8a94f3fbca	2015-10-01 00:00:00	\N	\N
4405	Weakleaf bur ragweed pollen extract (Injectable)	40242456	weakleaf bur ragweed pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
4406	WELCHOL (Oral Liquid)	1518148	colesevelam	b9df447c-b65b-45b9-873a-07a2ab6e2d1f	2012-02-14 00:00:00	\N	\N
4407	WELCHOL (Oral Pill)	1518148	colesevelam	b9df447c-b65b-45b9-873a-07a2ab6e2d1f	2012-02-14 00:00:00	\N	\N
4408	WELLBUTRIN (Oral Pill)	750982	Bupropion	fb118c90-41b7-4bc9-a82f-a4a415faabbb	2014-12-17 00:00:00	\N	\N
4409	Western black willow pollen extract (Injectable)	40228767	western black willow pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
4410	Western ragweed pollen extract (Injectable)	40162070	western ragweed pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
4411	Western sycamore pollen extract (Injectable)	40162074	western sycamore pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
4412	White (mexican) dock pollen extract (Injectable)	40228792	white (mexican) dock pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
4413	White hickory pollen extract (Injectable)	40162128	white hickory pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
4414	White poplar pollen extract (Injectable)	40162140	white poplar pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
4415	White sweet clover pollen extract (Injectable)	40228755	white sweet clover pollen extract	c7d383a6-94b8-4101-8a4c-fa7747a21468	2009-11-19 00:00:00	\N	\N
4416	White sweet clover pollen extract/Yellow sweet clover pollen extract (Injectable)	40228755	white sweet clover pollen extract	c7d383a6-94b8-4101-8a4c-fa7747a21468	2009-11-19 00:00:00	\N	\N
4417	White-rot fungus extract (Injectable)	40175955	white-rot fungus extract	6d2006e2-55ea-41db-bd17-ce6d080f28a0	2009-11-23 00:00:00	\N	\N
4418	Witch Hazel (Topical)	959196	Witch Hazel	8492ef49-db8d-46a2-9a92-c4d908c02e1b	2015-07-16 00:00:00	\N	\N
4419	XALATAN (Ophthalmic)	954688	latanoprost	0f4881ec-2984-4853-bc25-5b14c3b79da7	2013-04-02 00:00:00	\N	\N
4420	XARELTO (Oral Pill)	40241331	Rivaroxaban	10db92f9-2300-4a80-836b-673e1ae91610	2015-03-25 00:00:00	\N	\N
4421	XELJANZ (Oral Pill)	42904205	tofacitinib	68e3d6b2-7838-4d2d-a417-09d919b43e13	2012-11-09 00:00:00	\N	\N
4422	XELODA (Oral Pill)	1337620	capecitabine	a732b303-9bbd-42ba-a7c5-61c21629ba93	2012-06-11 00:00:00	\N	\N
4423	XENICAL (Oral Pill)	741530	orlistat	a9c47f08-bd02-4731-aaf7-42173155b2d0	2014-06-16 00:00:00	\N	\N
4424	XERAC AC (Topical)	957393	aluminum chloride	59e37deb-01da-465f-b806-ff1a76255e71	2014-04-14 00:00:00	\N	\N
4425	XERESE (Topical)	1703687	Acyclovir	3b6ac164-0f1e-4f36-94a1-1fdb07d710f5	2014-12-29 00:00:00	\N	\N
4426	XIFAXAN (Oral Pill)	1735947	rifaximin	523f0320-cc73-445a-a48d-7a181c182307	2013-08-23 00:00:00	\N	\N
4427	XODOL (Oral Pill)	1125315	Acetaminophen	c129d9d2-5511-4e14-bd97-6b824ffe0809	2014-12-11 00:00:00	\N	\N
4428	XOFIGO (Injectable)	43526934	RADIUM CHLORIDE RA-223	a398400e-bd31-41a9-9696-4f7c06569ede	2013-05-20 00:00:00	\N	\N
4429	XOLEGEL (Topical)	985708	Ketoconazole	855e42bb-b57f-4772-bffa-d766ddcc46ce	2015-03-25 00:00:00	\N	\N
4430	XOLIDO (Topical)	989878	Lidocaine	f2b463d7-3fcf-4b2c-8ba2-8e51e3290de2	2013-08-01 00:00:00	\N	\N
4431	XOLOX (Oral Pill)	1125315	Acetaminophen	35b99e65-32d3-43bc-89d9-2e7c7838aa14	2011-04-22 00:00:00	\N	\N
4432	XOPENEX (Inhalant)	1192218	Levalbuterol	7e2644e6-36c5-4988-8e52-bec90e2cd2f0	2015-05-19 00:00:00	\N	\N
4433	XOTEN-C (Topical)	939881	Capsaicin	1dcb64fd-6bc6-4375-8d30-4462e2407934	2011-08-08 00:00:00	\N	\N
4434	XTANDI (Oral Pill)	42900250	enzalutamide	b129fdc9-1d8e-425c-a5a9-8a2ed36dfbdf	2015-10-09 00:00:00	\N	\N
4435	XYLOCAINE (Injectable)	989878	Lidocaine	57964c72-5ffe-4548-bca0-a5b0ca57ecb1	2015-09-04 00:00:00	\N	\N
4436	XYLOCAINE (Topical)	989878	Lidocaine	b2adbf5d-dccd-41ff-9f12-4e606ccb541f	2012-08-10 00:00:00	\N	\N
4437	XYLOCAINE WITH EPINEPHRINE (Injectable)	1343916	Epinephrine	14b55cf9-f7cd-4bb4-a7c5-aba61abadef1	2015-09-15 00:00:00	\N	\N
4438	Xylometazoline (Nasal)	943852	xylometazoline	b70ba985-2894-493f-a4cf-c9102fe36d97	2012-12-17 00:00:00	\N	\N
4439	XYREM (Oral Liquid)	769935	Sodium Oxybate	926eb076-a4a8-45e4-91ef-411f0aa4f3ca	2015-09-21 00:00:00	\N	\N
4440	XYZAL (Oral Pill)	1136422	levocetirizine	371ca86d-7ffd-4f20-b6c6-af0a9ff7362f	2010-05-14 00:00:00	\N	\N
4441	Yellow birch pollen extract (Injectable)	40172908	yellow birch pollen extract	3be2afc4-b2dc-4b0f-b314-5ade25922b66	2009-11-24 00:00:00	\N	\N
4442	Yellow dock pollen extract (Injectable)	40162170	yellow dock pollen extract	d2bb5f95-d146-4062-9998-8e179f0d58c9	2009-09-11 00:00:00	\N	\N
4443	Yellow sweet clover pollen extract (Injectable)	40228782	yellow sweet clover pollen extract	b8e9933d-eeb3-4379-aaa4-5dfb1179683f	2009-11-19 00:00:00	\N	\N
4444	"Yellow-Fever Virus Vaccine, 17D-204 strain (Injectable)"	532274	"Yellow-Fever Virus Vaccine, 17D-204 strain"	613aaac9-ec18-4b22-addb-599e1193e6f5	2014-06-06 00:00:00	\N	\N
4445	YF-VAX (Injectable)	532274	"Yellow-Fever Virus Vaccine, 17D-204 strain"	613aaac9-ec18-4b22-addb-599e1193e6f5	2014-06-06 00:00:00	\N	\N
4446	Z TUSS AC (Oral Liquid)	1192710	Chlorpheniramine	e61129db-2ee2-4e0c-ab2b-c5f26e62abfc	2011-10-03 00:00:00	\N	\N
4447	Z-SLEEP (Oral Liquid)	1129625	Diphenhydramine	5cd03e60-877a-41f6-a10c-1c90a29ea762	2014-11-04 00:00:00	\N	\N
4448	Z-SLEEP (Oral Pill)	1129625	Diphenhydramine	d6679628-990d-47d3-857e-d87c2a6cd860	2014-10-29 00:00:00	\N	\N
4449	ZADITOR (Ophthalmic)	986117	Ketotifen	ac66b1e4-c2b0-a4c3-09e3-ebd44a2f7c9f	2015-08-26 00:00:00	\N	\N
4450	Zafirlukast (Oral Pill)	1111706	zafirlukast	fb546f57-cd2f-4cbf-8c54-fbc23d47fe0f	2015-06-04 00:00:00	\N	\N
4451	Zaleplon (Oral Pill)	720727	zaleplon	0d1d5797-6a7f-4a25-b13d-009224cc59c1	2015-08-13 00:00:00	\N	\N
4452	ZANAFLEX (Oral Pill)	778474	tizanidine	b581d63f-61cb-41b6-a7ca-24bd0b32a8ae	2011-04-28 00:00:00	\N	\N
4453	ZANOSAR (Injectable)	19136210	Streptozocin	15d161ed-9e7b-4c92-ba45-0556d2423e67	2012-09-07 00:00:00	\N	\N
4454	ZANTAC (Injectable)	961047	Ranitidine	da7dbbe1-4f2d-4466-9573-8d239d112998	2013-07-02 00:00:00	\N	\N
4455	ZANTAC (Oral Pill)	961047	Ranitidine	4da36a98-7363-4a8a-9bfe-5dfa7d2e1268	2015-02-26 00:00:00	\N	\N
4456	ZAROXOLYN (Oral Pill)	907013	Metolazone	16026409-e821-4680-a114-24c1761d6690	2015-05-22 00:00:00	\N	\N
4457	ZAVESCA (Oral Pill)	19045272	Miglustat	817892d1-ee12-4632-85fc-57ccdf16d7b8	2015-07-30 00:00:00	\N	\N
4458	ZAZOLE (Vaginal)	941472	terconazole	f0a917c7-bcc9-4860-b0e8-c7592212f40e	2013-03-05 00:00:00	\N	\N
4459	ZEASORB (Topical)	907879	Miconazole	c8260a34-ea4d-46d9-b9de-0cdd689be5c9	2014-11-24 00:00:00	\N	\N
4460	ZEBETA (Oral Pill)	1338005	Bisoprolol	a11548a0-9c0f-4729-907c-75d8f99a6c85	2010-12-20 00:00:00	\N	\N
4461	ZEBUTAL (Oral Pill)	1125315	Acetaminophen	ac7e8ce7-088f-4d9c-ad52-2af60436d836	2014-01-27 00:00:00	\N	\N
4462	ZECUITY (Transdermal)	1140643	Sumatriptan	806a07a0-e042-11df-9548-0002a5d5c51b	2015-08-28 00:00:00	\N	\N
4463	ZEGERID REFORMULATED AUG 2006 (Oral Pill)	923645	Omeprazole	32bed6d8-8a9a-4fb0-a2f6-045892011ee4	2014-07-17 00:00:00	\N	\N
4464	ZEGERID WITH MAGNESIUM HYDROXIDE (Chewable)	992956	Magnesium Hydroxide	cc8ef530-dd8c-40f5-af7e-4622c9e01d52	2007-03-19 00:00:00	\N	\N
4465	ZELAPAR (Oral Disintegrating)	766209	Selegiline	380d7717-2a79-42f3-a712-efe5e7696ba0	2015-01-13 00:00:00	\N	\N
4466	ZENATANE (Oral Pill)	984232	Isotretinoin	517810a4-76bb-4739-893f-1f2ba94a5d0c	2014-12-24 00:00:00	\N	\N
4467	ZENCIA WASH (Soap)	1036252	Sulfacetamide	f786db9a-b8b7-4696-8e64-33749576a076	2010-08-11 00:00:00	\N	\N
4468	ZENZEDI (Oral Pill)	719311	Dextroamphetamine	d6394df5-f2c9-47eb-b57e-f3e9cfd94f84	2015-05-06 00:00:00	\N	\N
4469	ZERIT (Oral Pill)	1781406	Stavudine	8bb73c56-74cb-4602-b9a3-57bd1082b434	2010-08-13 00:00:00	\N	\N
4470	ZESTORETIC (Oral Pill)	974166	Hydrochlorothiazide	0d3a966f-f937-05a8-a90f-5aa52ebbd613	2015-09-14 00:00:00	\N	\N
4471	ZESTRIL (Oral Pill)	1308216	Lisinopril	fd4889db-5565-4a68-ac2e-3eee62ff8353	2015-09-11 00:00:00	\N	\N
4472	ZETIA (Oral Pill)	1526475	ezetimibe	d3f0f926-6014-45ab-9cad-54b22c6ff4dc	2015-05-20 00:00:00	\N	\N
4473	ZFLEX (Oral Pill)	1125315	Acetaminophen	4b04b21b-ee68-4c59-91ad-57c3d84e2b09	2010-07-20 00:00:00	\N	\N
4474	ZIAC (Oral Pill)	1338005	Bisoprolol	238176e5-df10-457b-a5cf-c950a583e748	2011-05-24 00:00:00	\N	\N
4475	ZIAGEN (Oral Pill)	1736971	abacavir	ced433cf-2acf-47ae-9b74-69992c3bc8e0	2013-04-09 00:00:00	\N	\N
4476	ZIANA (Topical)	997881	Clindamycin	78c329f9-f0c9-486d-9e54-0123699fb9e1	2014-11-19 00:00:00	\N	\N
4477	ZICAM SINUS RELIEF (Nasal)	925636	Oxymetazoline	2d8da5d3-8488-4352-b2e6-1fa4d274070f	2014-03-12 00:00:00	\N	\N
4478	Zidovudine (Oral Liquid)	1710612	Zidovudine	e4eee396-fdf4-4e4b-94c2-930af5609a7d	2013-10-25 00:00:00	\N	\N
4479	Zidovudine (Oral Pill)	1710612	Zidovudine	a3c2532a-5880-4d52-b2a1-2e6d4dbd6021	2015-08-17 00:00:00	\N	\N
4480	ZILACTIN B (Oral Gel)	917006	Benzocaine	34ce5d91-35ff-4f2c-9d6b-ac389895b6b2	2014-02-05 00:00:00	\N	\N
4481	ZILACTIN COLD SORE (Oral Gel)	919681	Benzyl Alcohol	0910d0d8-dc69-43bb-967d-08cab8ae917b	2014-02-05 00:00:00	\N	\N
4482	Zinc Acetate (Oral Pill)	979096	Zinc Acetate	a0c72bff-20f3-4241-b966-34a95178d1a3	2012-06-22 00:00:00	\N	\N
4483	Zinc Acetate (Topical)	979096	Zinc Acetate	5365f205-986d-4f67-b768-1efaa8e81168	2015-04-24 00:00:00	\N	\N
4484	Zinc Gluconate (Injectable)	19079204	Zinc Gluconate	ea577e0b-7b57-4ed5-be81-b605f6bcb296	2013-10-18 00:00:00	\N	\N
4485	Zinc Oxide (Paste)	911064	Zinc Oxide	caaac1f0-437d-4185-8670-9f11b9cefe63	2015-09-14 00:00:00	\N	\N
4486	Zinc Oxide (Topical)	911064	Zinc Oxide	4c1e279b-d4ea-46b7-973f-6b55b0665e9f	2015-09-10 00:00:00	\N	\N
4487	Zinc pyrithione (Shampoo)	944360	zinc pyrithione	8772d4e7-e3cb-4265-95f3-d9ce32d0b819	2015-10-02 00:00:00	\N	\N
4488	Zinc pyrithione (Topical)	944360	zinc pyrithione	9aeada50-2cb2-d113-126a-ddcf05f817b6	2010-10-09 00:00:00	\N	\N
4489	Zinc Sulfate (Injectable)	19044522	Zinc Sulfate	1a03fe85-fdc9-4847-960f-1fc782d7d493	2014-08-25 00:00:00	\N	\N
4490	Zinc-DTPA (Injectable)	19011565	Zinc-DTPA	9fca10ee-973e-4fe0-aaf5-a0416918a397	2007-01-05 00:00:00	\N	\N
4491	ZINCON (Shampoo)	944360	zinc pyrithione	a53e3460-df29-4313-a2bc-d0e3e7c1d4c9	2012-07-31 00:00:00	\N	\N
4492	ZINGO (Topical)	989878	Lidocaine	0fb7864f-be1c-4992-a996-556aef29981f	2015-01-08 00:00:00	\N	\N
4493	ZIOPTAN (Ophthalmic)	42709325	tafluprost	d51cbf25-003c-4ba7-86cf-921637ef37a0	2015-09-25 00:00:00	\N	\N
4494	Ziprasidone (Injectable)	712615	ziprasidone	036db1f2-52b3-42a0-acf9-817b7ba8c724	2015-02-13 00:00:00	\N	\N
4495	Ziprasidone (Oral Pill)	712615	ziprasidone	09086be1-43ee-48bf-a896-21accd485e5f	2015-09-23 00:00:00	\N	\N
4496	ZIPSOR (Oral Pill)	1124300	Diclofenac	c982eca0-fc41-11e1-a9c8-0002a5d5c51b	2015-09-02 00:00:00	\N	\N
4497	ZIRGAN (Ophthalmic)	1757803	Ganciclovir	ea25e7ac-7a93-4ec8-975b-2cec197e1c27	2015-08-17 00:00:00	\N	\N
4498	ZITHRANOL (Shampoo)	952538	Anthralin	253fdee7-5060-4b49-ad26-257eb54cccfa	2014-10-20 00:00:00	\N	\N
4499	ZITHRANOL-RR (Topical)	952538	Anthralin	45bad116-0351-442f-8e49-f11089a955fd	2010-07-20 00:00:00	\N	\N
4500	ZITHROMAX (Oral Pill)	1734104	Azithromycin	931a3c19-23d3-4b65-a422-32bd98de5de4	2013-09-19 00:00:00	\N	\N
4501	ZODRYL AC (Oral Liquid)	1192710	Chlorpheniramine	07af42d8-4b0c-4cd1-b299-42dc12980b94	2010-10-09 00:00:00	\N	\N
4502	ZODRYL DEC (Oral Liquid)	1201620	Codeine	7b0051b0-1ae1-4eb5-9328-75f7b506f7d4	2010-10-09 00:00:00	\N	\N
4503	ZOFRAN (Oral Pill)	1000560	Ondansetron	3c327aa6-a790-4262-a79b-51856976d560	2011-08-05 00:00:00	\N	\N
4504	Zoledronic acid (Injectable)	1524674	zoledronic acid	2191fccc-9f90-486c-8f30-dc828b62fe15	2015-09-15 00:00:00	\N	\N
4505	ZOLMitriptan (Oral Disintegrating)	1116031	zolmitriptan	9842232d-83bf-fa08-5c5c-ba10fe5783e8	2013-05-23 00:00:00	\N	\N
4506	ZOLMitriptan (Oral Pill)	1116031	zolmitriptan	df93b636-103f-4fb5-26b6-50f639e29b1d	2015-08-12 00:00:00	\N	\N
4507	ZOLOFT (Oral Pill)	739138	Sertraline	92278f12-0f00-4c0b-bb44-c6dd2dbb5b6c	2013-08-01 00:00:00	\N	\N
4508	Zolpidem (Oral Pill)	744740	zolpidem	b87ea23e-2d54-4d10-8f10-72d4c62f3245	2015-09-25 00:00:00	\N	\N
4509	Zolpidem (Sublingual)	744740	zolpidem	913b6cfe-1fb0-44a8-817a-26374bbce995	2015-10-02 00:00:00	\N	\N
4510	Zolpidem XR (Oral Pill)	744740	zolpidem	a85400b5-1973-46bc-b092-681ac310f280	2015-06-22 00:00:00	\N	\N
4511	ZOMIG (Oral Disintegrating)	1116031	zolmitriptan	df93b636-103f-4fb5-26b6-50f639e29b1d	2013-02-26 00:00:00	\N	\N
4512	ZOMIG (Oral Pill)	1116031	zolmitriptan	df93b636-103f-4fb5-26b6-50f639e29b1d	2013-02-26 00:00:00	\N	\N
4513	ZONALON (Topical)	738156	Doxepin	e3a51eb8-cb8b-498f-bf3e-e464cc4acdca	2012-03-28 00:00:00	\N	\N
4514	ZONATUSS (Oral Pill)	1136601	benzonatate	b85137e4-5e8b-4134-9a8e-1e6f9da63f92	2011-11-01 00:00:00	\N	\N
4515	ZONEGRAN (Oral Pill)	744798	zonisamide	d12de43e-3ac3-4335-bc85-70d7366a91eb	2015-09-24 00:00:00	\N	\N
4516	Zonisamide (Oral Pill)	744798	zonisamide	1e99efc7-cf3f-4368-7afb-41d8dfaeffcf	2015-09-24 00:00:00	\N	\N
4517	ZOOBY FLUORIDE FOAM (Oral Foam)	19069022	Sodium Fluoride	fcebb175-d412-4452-9c7c-a38571006bfc	2011-11-14 00:00:00	\N	\N
4518	ZORCAINE (Injectable)	19080512	Articaine	da242926-93db-4a2b-b68c-23af13ea747e	2011-09-01 00:00:00	\N	\N
4519	ZOSTRIX (Topical)	939881	Capsaicin	19cdf2cb-1429-49a4-b74e-fa77547f6b7f	2014-10-22 00:00:00	\N	\N
4520	ZOSTRIX COLD THERAPY (Topical)	901656	Menthol	cf1001ec-b069-4d51-82e7-646a9583a43a	2012-09-21 00:00:00	\N	\N
4521	ZOSTRIX DIABETIC JOINT & ARTHRITIS PAIN RELIEF (Topical)	939881	Capsaicin	006d3c32-0a88-4454-aa0f-5dcc2ba9a222	2013-11-20 00:00:00	\N	\N
4522	ZOSYN (Injectable)	1746114	Piperacillin	81b0bb45-ce9d-43e7-b181-64315e14be55	2013-11-12 00:00:00	\N	\N
4523	ZOVIRAX (Oral Liquid)	1703687	Acyclovir	6fe0ab86-9d81-461e-9c84-6ba724a91318	2014-02-18 00:00:00	\N	\N
4524	ZOVIRAX (Oral Pill)	1703687	Acyclovir	6fe0ab86-9d81-461e-9c84-6ba724a91318	2015-02-17 00:00:00	\N	\N
4525	ZOVIRAX (Topical)	1703687	Acyclovir	125dbe4e-94ba-45bd-a714-f9c4b8e8b5c2	2015-02-04 00:00:00	\N	\N
4526	ZUPLENZ (Oral Strip)	1000560	Ondansetron	ed036bdb-b832-440f-82c7-ade2956b73ee	2015-07-17 00:00:00	\N	\N
4527	ZUTRIPRO (Oral Liquid)	1192710	Chlorpheniramine	6b6ab0f8-fbe6-41f3-9af4-2c86cec4eaf7	2014-10-09 00:00:00	\N	\N
4528	ZYCLARA (Topical)	981691	imiquimod	28cd9b5b-680b-480f-b33d-9c5b52bbf03d	2015-03-26 00:00:00	\N	\N
4529	ZYDELIG (Oral Pill)	45776944	idelalisib	efbdafa9-d18c-4e85-b4a2-1e620fc74e50	2015-09-11 00:00:00	\N	\N
4530	ZYDONE (Oral Pill)	1125315	Acetaminophen	4aa8c5b1-d71f-4aa8-92b2-1cde266da467	2010-09-13 00:00:00	\N	\N
4531	ZYLOPRIM (Oral Pill)	1167322	Allopurinol	342832b5-1a32-4bea-bc49-ab0fd152154e	2009-12-16 00:00:00	\N	\N
4532	ZYMAXID (Ophthalmic)	1789276	gatifloxacin	1160b16c-929a-4e85-9c0b-1d8c96a7678b	2014-10-09 00:00:00	\N	\N
4533	ZyPREXA (Oral Disintegrating)	785788	olanzapine	7881c39e-0624-4c14-a6c3-7a9dc81c198c	2012-05-10 00:00:00	\N	\N
4534	ZyPREXA (Oral Pill)	785788	olanzapine	250ed608-092c-4e19-884f-a15bdea065d7	2013-09-16 00:00:00	\N	\N
4535	ZyrTEC (Oral Liquid)	1149196	Cetirizine	ee8695ac-1293-4e43-ac7c-a64e21a0ca0a	2015-05-28 00:00:00	\N	\N
4536	ZyrTEC (Oral Pill)	1149196	Cetirizine	b165db38-b302-4220-8627-77cb07bb078c	2014-10-29 00:00:00	\N	\N
4537	ZYVOX (Oral Pill)	1736887	linezolid	e57716ab-7697-46cc-b612-e0e81414128f	2013-04-05 00:00:00	\N	\N
4538	ZZZQUIL (Oral Liquid)	1129625	Diphenhydramine	e441c952-cd48-4159-ada2-271ca7541600	2015-03-25 00:00:00	\N	\N
\.


--
-- Data for Name: evidence_sources; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY evidence_sources (id, title, description, contributer, creator, creation_date, rights, source, coverage_start_date, coverage_end_date) FROM stdin;
\.


--
-- Name: evidence_sources_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('evidence_sources_sequence', 1, false);


--
-- Data for Name: exampleapp_widget; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY exampleapp_widget (id, name) FROM stdin;
\.


--
-- Data for Name: feas_study_generation_info; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY feas_study_generation_info (study_id, source_id, start_time, execution_duration, status, is_valid) FROM stdin;
\.


--
-- Data for Name: feas_study_inclusion_stats; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY feas_study_inclusion_stats (study_id, rule_sequence, name, person_count, gain_count, person_total) FROM stdin;
\.


--
-- Data for Name: feas_study_index_stats; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY feas_study_index_stats (study_id, person_count, match_count) FROM stdin;
\.


--
-- Data for Name: feas_study_result; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY feas_study_result (study_id, inclusion_rule_mask, person_count) FROM stdin;
\.


--
-- Data for Name: feasibility_inclusion; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY feasibility_inclusion (study_id, sequence, name, description, expression) FROM stdin;
\.


--
-- Data for Name: feasibility_study; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY feasibility_study (id, name, description, index_def_id, result_def_id, created_by, created_date, modified_by, modified_date) FROM stdin;
\.


--
-- Data for Name: heracles_analysis; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY heracles_analysis (analysis_id, analysis_name, stratum_1_name, stratum_2_name, stratum_3_name, stratum_4_name, stratum_5_name, analysis_type) FROM stdin;
0	Source name	\N	\N	\N	\N	\N	PERSON
1	Number of persons	\N	\N	\N	\N	\N	PERSON
2	Number of persons by gender	gender_concept_id	\N	\N	\N	\N	PERSON
3	Number of persons by year of birth	year_of_birth	\N	\N	\N	\N	PERSON
4	Number of persons by race	race_concept_id	\N	\N	\N	\N	PERSON
5	Number of persons by ethnicity	ethnicity_concept_id	\N	\N	\N	\N	PERSON
7	Number of persons with invalid provider_id	\N	\N	\N	\N	\N	PERSON
8	Number of persons with invalid location_id	\N	\N	\N	\N	\N	PERSON
9	Number of persons with invalid care_site_id	\N	\N	\N	\N	\N	PERSON
101	Number of persons by age, with age at first observation period	age	\N	\N	\N	\N	OBSERVATION
102	Number of persons by gender by age, with age at first observation period	gender_concept_id	age	\N	\N	\N	OBSERVATION
103	Distribution of age at first observation period	\N	\N	\N	\N	\N	OBSERVATION
104	Distribution of age at first observation period by gender	gender_concept_id	\N	\N	\N	\N	OBSERVATION
105	Length of observation (days) of first observation period	\N	\N	\N	\N	\N	OBSERVATION
106	Length of observation (days) of first observation period by gender	gender_concept_id	\N	\N	\N	\N	OBSERVATION
107	Length of observation (days) of first observation period by age decile	age decile	\N	\N	\N	\N	OBSERVATION
108	Number of persons by length of observation period, in 30d increments	Observation period length 30d increments	\N	\N	\N	\N	OBSERVATION
109	Number of persons with continuous observation in each year	calendar year	\N	\N	\N	\N	OBSERVATION
110	Number of persons with continuous observation in each month	calendar month	\N	\N	\N	\N	OBSERVATION
111	Number of persons by observation period start month	calendar month	\N	\N	\N	\N	OBSERVATION
112	Number of persons by observation period end month	calendar month	\N	\N	\N	\N	OBSERVATION
113	Number of persons by number of observation periods	number of observation periods	\N	\N	\N	\N	OBSERVATION
114	Number of persons with observation period before year-of-birth	\N	\N	\N	\N	\N	OBSERVATION
115	Number of persons with observation period end < observation period start	\N	\N	\N	\N	\N	OBSERVATION
116	Number of persons with at least one day of observation in each year by gender and age decile	calendar year	gender_concept_id	age decile	\N	\N	OBSERVATION
117	Number of persons with at least one day of observation in each month	calendar month	\N	\N	\N	\N	OBSERVATION
200	Number of persons with at least one visit occurrence, by visit_concept_id	visit_concept_id	\N	\N	\N	\N	VISITS
201	Number of visit occurrence records, by visit_concept_id	visit_concept_id	\N	\N	\N	\N	VISITS
202	Number of persons by visit occurrence start month, by visit_concept_id	visit_concept_id	calendar month	\N	\N	\N	VISITS
203	Number of distinct visit occurrence concepts per person	\N	\N	\N	\N	\N	VISITS
204	Number of persons with at least one visit occurrence, by visit_concept_id by calendar year by gender by age decile	visit_concept_id	calendar year	gender_concept_id	age decile	\N	VISITS
206	Distribution of age by visit_concept_id	visit_concept_id	gender_concept_id	\N	\N	\N	VISITS
207	Number of visit records with invalid person_id	\N	\N	\N	\N	\N	VISITS
208	Number of visit records outside valid observation period	\N	\N	\N	\N	\N	VISITS
209	Number of visit records with end date < start date	\N	\N	\N	\N	\N	VISITS
210	Number of visit records with invalid care_site_id	\N	\N	\N	\N	\N	VISITS
211	Distribution of length of stay by visit_concept_id	visit_concept_id	\N	\N	\N	\N	VISITS
220	Number of visit occurrence records by visit occurrence start month	calendar month	\N	\N	\N	\N	VISITS
400	Number of persons with at least one condition occurrence, by condition_concept_id	condition_concept_id	\N	\N	\N	\N	CONDITION
401	Number of condition occurrence records, by condition_concept_id	condition_concept_id	\N	\N	\N	\N	CONDITION
402	Number of persons by condition occurrence start month, by condition_concept_id	condition_concept_id	calendar month	\N	\N	\N	CONDITION
403	Number of distinct condition occurrence concepts per person	\N	\N	\N	\N	\N	CONDITION
404	Number of persons with at least one condition occurrence, by condition_concept_id by calendar year by gender by age decile	condition_concept_id	calendar year	gender_concept_id	age decile	\N	CONDITION
405	Number of condition occurrence records, by condition_concept_id by condition_type_concept_id	condition_concept_id	condition_type_concept_id	\N	\N	\N	CONDITION
406	Distribution of age by condition_concept_id	condition_concept_id	gender_concept_id	\N	\N	\N	CONDITION
409	Number of condition occurrence records with invalid person_id	\N	\N	\N	\N	\N	CONDITION
410	Number of condition occurrence records outside valid observation period	\N	\N	\N	\N	\N	CONDITION
411	Number of condition occurrence records with end date < start date	\N	\N	\N	\N	\N	CONDITION
412	Number of condition occurrence records with invalid provider_id	\N	\N	\N	\N	\N	CONDITION
413	Number of condition occurrence records with invalid visit_id	\N	\N	\N	\N	\N	CONDITION
420	Number of condition occurrence records by condition occurrence start month	calendar month	\N	\N	\N	\N	CONDITION
500	Number of persons with death, by cause_of_death_concept_id	cause_of_death_concept_id	\N	\N	\N	\N	DEATH
501	Number of records of death, by cause_of_death_concept_id	cause_of_death_concept_id	\N	\N	\N	\N	DEATH
502	Number of persons by death month	calendar month	\N	\N	\N	\N	DEATH
504	Number of persons with a death, by calendar year by gender by age decile	calendar year	gender_concept_id	age decile	\N	\N	DEATH
505	Number of death records, by death_type_concept_id	death_type_concept_id	\N	\N	\N	\N	DEATH
506	Distribution of age at death by gender	gender_concept_id	\N	\N	\N	\N	DEATH
509	Number of death records with invalid person_id	\N	\N	\N	\N	\N	DEATH
510	Number of death records outside valid observation period	\N	\N	\N	\N	\N	DEATH
511	Distribution of time from death to last condition	\N	\N	\N	\N	\N	DEATH
512	Distribution of time from death to last drug	\N	\N	\N	\N	\N	DEATH
513	Distribution of time from death to last visit	\N	\N	\N	\N	\N	DEATH
514	Distribution of time from death to last procedure	\N	\N	\N	\N	\N	DEATH
515	Distribution of time from death to last observation	\N	\N	\N	\N	\N	DEATH
600	Number of persons with at least one procedure occurrence, by procedure_concept_id	procedure_concept_id	\N	\N	\N	\N	PROCEDURE
601	Number of procedure occurrence records, by procedure_concept_id	procedure_concept_id	\N	\N	\N	\N	PROCEDURE
602	Number of persons by procedure occurrence start month, by procedure_concept_id	procedure_concept_id	calendar month	\N	\N	\N	PROCEDURE
603	Number of distinct procedure occurrence concepts per person	\N	\N	\N	\N	\N	PROCEDURE
1020	Number of condition era records by condition era start month	calendar month	\N	\N	\N	\N	CONDITION_ERA
604	Number of persons with at least one procedure occurrence, by procedure_concept_id by calendar year by gender by age decile	procedure_concept_id	calendar year	gender_concept_id	age decile	\N	PROCEDURE
605	Number of procedure occurrence records, by procedure_concept_id by procedure_type_concept_id	procedure_concept_id	procedure_type_concept_id	\N	\N	\N	PROCEDURE
606	Distribution of age by procedure_concept_id	procedure_concept_id	gender_concept_id	\N	\N	\N	PROCEDURE
609	Number of procedure occurrence records with invalid person_id	\N	\N	\N	\N	\N	PROCEDURE
610	Number of procedure occurrence records outside valid observation period	\N	\N	\N	\N	\N	PROCEDURE
612	Number of procedure occurrence records with invalid provider_id	\N	\N	\N	\N	\N	PROCEDURE
613	Number of procedure occurrence records with invalid visit_id	\N	\N	\N	\N	\N	PROCEDURE
620	Number of procedure occurrence records  by procedure occurrence start month	calendar month	\N	\N	\N	\N	PROCEDURE
700	Number of persons with at least one drug exposure, by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG
701	Number of drug exposure records, by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG
702	Number of persons by drug exposure start month, by drug_concept_id	drug_concept_id	calendar month	\N	\N	\N	DRUG
703	Number of distinct drug exposure concepts per person	\N	\N	\N	\N	\N	DRUG
704	Number of persons with at least one drug exposure, by drug_concept_id by calendar year by gender by age decile	drug_concept_id	calendar year	gender_concept_id	age decile	\N	DRUG
705	Number of drug exposure records, by drug_concept_id by drug_type_concept_id	drug_concept_id	drug_type_concept_id	\N	\N	\N	DRUG
706	Distribution of age by drug_concept_id	drug_concept_id	gender_concept_id	\N	\N	\N	DRUG
709	Number of drug exposure records with invalid person_id	\N	\N	\N	\N	\N	DRUG
710	Number of drug exposure records outside valid observation period	\N	\N	\N	\N	\N	DRUG
711	Number of drug exposure records with end date < start date	\N	\N	\N	\N	\N	DRUG
712	Number of drug exposure records with invalid provider_id	\N	\N	\N	\N	\N	DRUG
713	Number of drug exposure records with invalid visit_id	\N	\N	\N	\N	\N	DRUG
715	Distribution of days_supply by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG
716	Distribution of refills by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG
717	Distribution of quantity by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG
720	Number of drug exposure records  by drug exposure start month	calendar month	\N	\N	\N	\N	DRUG
800	Number of persons with at least one observation occurrence, by observation_concept_id	observation_concept_id	\N	\N	\N	\N	OBSERVATION
801	Number of observation occurrence records, by observation_concept_id	observation_concept_id	\N	\N	\N	\N	OBSERVATION
802	Number of persons by observation occurrence start month, by observation_concept_id	observation_concept_id	calendar month	\N	\N	\N	OBSERVATION
803	Number of distinct observation occurrence concepts per person	\N	\N	\N	\N	\N	OBSERVATION
804	Number of persons with at least one observation occurrence, by observation_concept_id by calendar year by gender by age decile	observation_concept_id	calendar year	gender_concept_id	age decile	\N	OBSERVATION
805	Number of observation occurrence records, by observation_concept_id by observation_type_concept_id	observation_concept_id	observation_type_concept_id	\N	\N	\N	OBSERVATION
806	Distribution of age by observation_concept_id	observation_concept_id	gender_concept_id	\N	\N	\N	OBSERVATION
807	Number of observation occurrence records, by observation_concept_id and unit_concept_id	observation_concept_id	unit_concept_id	\N	\N	\N	OBSERVATION
809	Number of observation records with invalid person_id	\N	\N	\N	\N	\N	OBSERVATION
810	Number of observation records outside valid observation period	\N	\N	\N	\N	\N	OBSERVATION
812	Number of observation records with invalid provider_id	\N	\N	\N	\N	\N	OBSERVATION
813	Number of observation records with invalid visit_id	\N	\N	\N	\N	\N	OBSERVATION
814	Number of observation records with no value (numeric, string, or concept)	\N	\N	\N	\N	\N	OBSERVATION
815	Distribution of numeric values, by observation_concept_id and unit_concept_id	\N	\N	\N	\N	\N	OBSERVATION
816	Distribution of low range, by observation_concept_id and unit_concept_id	\N	\N	\N	\N	\N	OBSERVATION
817	Distribution of high range, by observation_concept_id and unit_concept_id	\N	\N	\N	\N	\N	OBSERVATION
818	Number of observation records below/within/above normal range, by observation_concept_id and unit_concept_id	\N	\N	\N	\N	\N	OBSERVATION
820	Number of observation records  by observation start month	calendar month	\N	\N	\N	\N	OBSERVATION
900	Number of persons with at least one drug era, by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG_ERA
901	Number of drug era records, by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG_ERA
902	Number of persons by drug era start month, by drug_concept_id	drug_concept_id	calendar month	\N	\N	\N	DRUG_ERA
903	Number of distinct drug era concepts per person	\N	\N	\N	\N	\N	DRUG_ERA
904	Number of persons with at least one drug era, by drug_concept_id by calendar year by gender by age decile	drug_concept_id	calendar year	gender_concept_id	age decile	\N	DRUG_ERA
906	Distribution of age by drug_concept_id	drug_concept_id	gender_concept_id	\N	\N	\N	DRUG_ERA
907	Distribution of drug era length, by drug_concept_id	drug_concept_id	\N	\N	\N	\N	DRUG_ERA
908	Number of drug eras without valid person	\N	\N	\N	\N	\N	DRUG_ERA
909	Number of drug eras outside valid observation period	\N	\N	\N	\N	\N	DRUG_ERA
910	Number of drug eras with end date < start date	\N	\N	\N	\N	\N	DRUG_ERA
920	Number of drug era records  by drug era start month	calendar month	\N	\N	\N	\N	DRUG_ERA
1000	Number of persons with at least one condition era, by condition_concept_id	condition_concept_id	\N	\N	\N	\N	CONDITION_ERA
1001	Number of condition era records, by condition_concept_id	condition_concept_id	\N	\N	\N	\N	CONDITION_ERA
1002	Number of persons by condition era start month, by condition_concept_id	condition_concept_id	calendar month	\N	\N	\N	CONDITION_ERA
1003	Number of distinct condition era concepts per person	\N	\N	\N	\N	\N	CONDITION_ERA
1004	Number of persons with at least one condition era, by condition_concept_id by calendar year by gender by age decile	condition_concept_id	calendar year	gender_concept_id	age decile	\N	CONDITION_ERA
1006	Distribution of age by condition_concept_id	condition_concept_id	gender_concept_id	\N	\N	\N	CONDITION_ERA
1007	Distribution of condition era length, by condition_concept_id	condition_concept_id	\N	\N	\N	\N	CONDITION_ERA
1008	Number of condition eras without valid person	\N	\N	\N	\N	\N	CONDITION_ERA
1009	Number of condition eras outside valid observation period	\N	\N	\N	\N	\N	CONDITION_ERA
1010	Number of condition eras with end date < start date	\N	\N	\N	\N	\N	CONDITION_ERA
1100	Number of persons by location 3-digit zip	3-digit zip	\N	\N	\N	\N	LOCATION
1101	Number of persons by location state	state	\N	\N	\N	\N	LOCATION
1200	Number of persons by place of service	place_of_service_concept_id	\N	\N	\N	\N	CARE_SITE
1201	Number of visits by place of service	place_of_service_concept_id	\N	\N	\N	\N	CARE_SITE
1700	Number of records by cohort_definition_id	cohort_definition_id	\N	\N	\N	\N	COHORT
1701	Number of records with cohort end date < cohort start date	\N	\N	\N	\N	\N	COHORT
1800	Number of persons by age, with age at cohort start	age	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1801	Distribution of age at cohort start	\N	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1802	Distribution of age at cohort start by gender	gender_concept_id	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1803	Distribution of age at cohort start by cohort start year	calendar year	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1804	Number of persons by duration from cohort start to cohort end, in 30d increments	Cohort period length 30d increments	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1805	Number of persons by duration from observation start to cohort start, in 30d increments	Baseline period length 30d increments	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1806	Number of persons by duration from cohort start to observation end, in 30d increments	Follow-up period length 30d increments	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1807	Number of persons by duration from cohort end to observation end, in 30d increments	Post-cohort period length 30d increments	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1808	Distribution of duration (days) from cohort start to cohort end	\N	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1809	Distribution of duration (days) from cohort start to cohort end, by gender	gender_concept_id	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1810	Distribution of duration (days) from cohort start to cohort end, by age decile	age decile	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1811	Distribution of duration (days) from observation start to cohort start	\N	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1812	Distribution of duration (days) from cohort start to observation end	\N	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1813	Distribution of duration (days) from cohort end to observation end	\N	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1814	Number of persons by cohort start year by gender by age decile	calendar year	gender_concept_id	age decile	\N	\N	COHORT_SPECIFIC_ANALYSES
1815	Number of persons by cohort start month	calendar month	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1816	Number of persons by number of cohort periods	number of cohort periods	\N	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1820	Number of persons by duration from cohort start to first occurrence of condition occurrence, by condition_concept_id	condition_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1821	Number of events by duration from cohort start to all occurrences of condition occurrence, by condition_concept_id	condition_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1830	Number of persons by duration from cohort start to first occurrence of procedure occurrence, by procedure_concept_id	procedure_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1831	Number of events by duration from cohort start to all occurrences of procedure occurrence, by procedure_concept_id	procedure_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1840	Number of persons by duration from cohort start to first occurrence of drug exposure, by drug_concept_id	drug_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1841	Number of events by duration from cohort start to all occurrences of drug exposure, by drug_concept_id	drug_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1850	Number of persons by duration from cohort start to first occurrence of observation, by observation_concept_id	observation_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1851	Number of events by duration from cohort start to all occurrences of observation, by observation_concept_id	observation_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1860	Number of persons by duration from cohort start to first occurrence of condition era, by condition_concept_id	condition_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1861	Number of events by duration from cohort start to all occurrences of condition era, by condition_concept_id	condition_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1870	Number of persons by duration from cohort start to first occurrence of drug era, by drug_concept_id	drug_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1871	Number of events by duration from cohort start to all occurrences of drug era, by drug_concept_id	drug_concept_id	time-to-event 30d increments	\N	\N	\N	COHORT_SPECIFIC_ANALYSES
1300	Number of persons with at least one measurement occurrence, by measurement_concept_id	measurement_concept_id	\N	\N	\N	\N	MEASUREMENT
1301	Number of measurement occurrence records, by measurement_concept_id	measurement_concept_id	\N	\N	\N	\N	MEASUREMENT
1302	Number of persons by measurement occurrence start month, by measurement_concept_id	measurement_concept_id	calendar month	\N	\N	\N	MEASUREMENT
1303	Number of distinct measurement occurrence concepts per person	\N	\N	\N	\N	\N	MEASUREMENT
1304	Number of persons with at least one measurement occurrence, by measurement_concept_id by calendar year by gender by age decile	measurement_concept_id	calendar year	gender_concept_id	age decile	\N	MEASUREMENT
1305	Number of measurement occurrence records, by measurement_concept_id by measurement_type_concept_id	measurement_concept_id	measurement_type_concept_id	\N	\N	\N	MEASUREMENT
1306	Distribution of age by measurement_concept_id	measurement_concept_id	gender_concept_id	\N	\N	\N	MEASUREMENT
1307	Number of measurement occurrence records, by measurement_concept_id and unit_concept_id	measurement_concept_id	unit_concept_id	\N	\N	\N	MEASUREMENT
1309	Number of measurement records with invalid person_id	\N	\N	\N	\N	\N	MEASUREMENT
1310	Number of measurement records outside valid measurement period	\N	\N	\N	\N	\N	MEASUREMENT
1312	Number of measurement records with invalid provider_id	\N	\N	\N	\N	\N	MEASUREMENT
1313	Number of measurement records with invalid visit_id	\N	\N	\N	\N	\N	MEASUREMENT
1314	Number of measurement records with no value (numeric, string, or concept)	\N	\N	\N	\N	\N	MEASUREMENT
1315	Distribution of numeric values, by measurement_concept_id and unit_concept_id	\N	\N	\N	\N	\N	MEASUREMENT
1316	Distribution of low range, by measurement_concept_id and unit_concept_id	\N	\N	\N	\N	\N	MEASUREMENT
1317	Distribution of high range, by measurement_concept_id and unit_concept_id	\N	\N	\N	\N	\N	MEASUREMENT
1318	Number of measurement records below/within/above normal range, by measurement_concept_id and unit_concept_id	\N	\N	\N	\N	\N	MEASUREMENT
1320	Number of measurement records  by measurement start month	calendar month	\N	\N	\N	\N	MEASUREMENT
\.


--
-- Data for Name: heracles_heel_results; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY heracles_heel_results (cohort_definition_id, analysis_id, heracles_heel_warning) FROM stdin;
\.


--
-- Data for Name: heracles_results; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY heracles_results (cohort_definition_id, analysis_id, stratum_1, stratum_2, stratum_3, stratum_4, stratum_5, count_value, last_update_time) FROM stdin;
\.


--
-- Data for Name: heracles_results_dist; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY heracles_results_dist (cohort_definition_id, analysis_id, stratum_1, stratum_2, stratum_3, stratum_4, stratum_5, count_value, min_value, max_value, avg_value, stdev_value, median_value, p10_value, p25_value, p75_value, p90_value, last_update_time) FROM stdin;
\.


--
-- Data for Name: heracles_visualization_data; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY heracles_visualization_data (id, cohort_definition_id, source_id, visualization_key, drilldown_id, data, end_time) FROM stdin;
\.


--
-- Name: heracles_viz_data_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('heracles_viz_data_sequence', 0, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- Data for Name: ir_analysis; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY ir_analysis (id, name, description, created_by, created_date, modified_by, modified_date) FROM stdin;
\.


--
-- Data for Name: ir_analysis_details; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY ir_analysis_details (id, expression) FROM stdin;
\.


--
-- Data for Name: ir_analysis_dist; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY ir_analysis_dist (analysis_id, target_id, outcome_id, strata_sequence, dist_type, total, avg_value, std_dev, min_value, p10_value, p25_value, median_value, p75_value, p90_value, max_value) FROM stdin;
\.


--
-- Data for Name: ir_analysis_result; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY ir_analysis_result (analysis_id, target_id, outcome_id, strata_mask, person_count, time_at_risk, cases) FROM stdin;
\.


--
-- Data for Name: ir_analysis_strata_stats; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY ir_analysis_strata_stats (analysis_id, target_id, outcome_id, strata_sequence, person_count, time_at_risk, cases) FROM stdin;
\.


--
-- Data for Name: ir_execution; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY ir_execution (analysis_id, source_id, start_time, execution_duration, status, is_valid, message) FROM stdin;
\.


--
-- Data for Name: ir_strata; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY ir_strata (analysis_id, strata_sequence, name, description) FROM stdin;
\.


--
-- Data for Name: laertes_summary; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY laertes_summary (id, report_order, report_name, ingredient_id, ingredient, clinical_drug_id, clinical_drug, hoi_id, hoi, medline_ct_count, medline_case_count, medline_other_count, splicer_count, eu_spc_count, semmeddb_ct_count, semmeddb_case_count, semmeddb_neg_ct_count, semmeddb_neg_case_count, aers_report_count, prr, ctd_chemical_disease_count, semmeddb_other_count, semmeddb_neg_other_count) FROM stdin;
\.


--
-- Name: laertes_summary_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('laertes_summary_sequence', 1, false);


--
-- Data for Name: penelope_laertes_uni_pivot; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY penelope_laertes_uni_pivot (condition_concept_id, condition_concept_name, ingredient_concept_id, ingredient_concept_name, medline_ct, medline_case, medline_other, semmeddb_ct_t, semmeddb_case_t, semmeddb_other_t, semmeddb_ct_f, semmeddb_case_f, semmeddb_other_f, eu_spc, spl_adr, aers, aers_prr, aers_prr_original) FROM stdin;
\.


--
-- Data for Name: penelope_laertes_universe; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY penelope_laertes_universe (id, condition_concept_id, condition_concept_name, ingredient_concept_id, ingredient_concept_name, evidence_type, supports, statistic_value, evidence_linkouts) FROM stdin;
\.


--
-- Data for Name: schema_version; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY schema_version (version_rank, installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	0	<< Flyway Schema Creation >>	SCHEMA	"ohdsi"	\N	postgres	2017-10-26 19:21:55.990251	0	t
2	2	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	postgres	2017-10-26 19:21:56.144416	0	t
3	3	1.0.0.1	schema-create spring batch	SQL	V1.0.0.1__schema-create_spring_batch.sql	1254272413	postgres	2017-10-26 19:21:56.18961	79	t
4	4	1.0.0.2	schema-create jpa	SQL	V1.0.0.2__schema-create_jpa.sql	-303952977	postgres	2017-10-26 19:21:56.478587	14	t
5	5	1.0.0.3	cohort definition persistence	SQL	V1.0.0.3__cohort_definition_persistence.sql	745871256	postgres	2017-10-26 19:21:56.517796	21	t
6	6	1.0.0.3.1	cohort generation	SQL	V1.0.0.3.1__cohort_generation.sql	-27753051	postgres	2017-10-26 19:21:56.566756	19	t
7	7	1.0.0.3.2	alter foreign keys	SQL	V1.0.0.3.2__alter_foreign_keys.sql	-1786579696	postgres	2017-10-26 19:21:56.613828	15	t
8	8	1.0.0.4	cohort analysis results	SQL	V1.0.0.4__cohort_analysis_results.sql	-1284569990	postgres	2017-10-26 19:21:56.673848	524	t
9	9	1.0.0.4.1	heracles heel	SQL	V1.0.0.4.1__heracles_heel.sql	1425835180	postgres	2017-10-26 19:21:57.226291	6	t
10	10	1.0.0.4.2	measurement types	SQL	V1.0.0.4.2__measurement_types.sql	552008962	postgres	2017-10-26 19:21:57.251471	42	t
11	11	1.0.0.4.3	heracles index	SQL	V1.0.0.4.3__heracles_index.sql	-897785632	postgres	2017-10-26 19:21:57.313901	39	t
12	12	1.0.0.5	feasability tables	SQL	V1.0.0.5__feasability_tables.sql	-524018977	postgres	2017-10-26 19:21:57.374714	29	t
13	13	1.0.0.5.1	alter foreign keys	SQL	V1.0.0.5.1__alter_foreign_keys.sql	-528865590	postgres	2017-10-26 19:21:57.42399	7	t
14	14	1.0.0.6.1	schema-create laertes	SQL	V1.0.0.6.1__schema-create_laertes.sql	-593183069	postgres	2017-10-26 19:21:57.460564	150	t
15	15	1.0.0.6.2	schema-create laertes	SQL	V1.0.0.6.2__schema-create_laertes.sql	-1447827014	postgres	2017-10-26 19:21:57.631002	26	t
16	16	1.0.0.6.3	schema-create laertes	SQL	V1.0.0.6.3__schema-create_laertes.sql	-845635838	postgres	2017-10-26 19:21:57.681756	9	t
17	17	1.0.0.6.4	schema-create laertes	SQL	V1.0.0.6.4__schema-create_laertes.sql	358690557	postgres	2017-10-26 19:21:57.713292	28	t
18	18	1.0.0.6.5	schema-create penelope laertes	SQL	V1.0.0.6.5__schema-create_penelope_laertes.sql	-1254272594	postgres	2017-10-26 19:21:57.761543	24	t
19	19	1.0.0.7.0	sources.sql	SQL	V1.0.0.7.0__sources.sql.sql	-1019931789	postgres	2017-10-26 19:21:57.804486	18	t
20	20	1.0.0.7.1	cohort multihomed support	SQL	V1.0.0.7.1__cohort_multihomed_support.sql	1338461033	postgres	2017-10-26 19:21:57.844184	25	t
21	21	1.0.0.7.2	feasability multihomed support.sql	SQL	V1.0.0.7.2__feasability_multihomed_support.sql.sql	-1900927535	postgres	2017-10-26 19:21:57.889127	25	t
22	22	1.0.0.8	heracles data	SQL	V1.0.0.8__heracles_data.sql	1626592845	postgres	2017-10-26 19:21:57.939428	19	t
23	23	1.0.0.9	shiro security	SQL	V1.0.0.9__shiro_security.sql	-1443486481	postgres	2017-10-26 19:21:57.976029	83	t
24	24	1.0.0.9.1	shiro security-initial values	SQL	V1.0.0.9.1__shiro_security-initial_values.sql	-1060530912	postgres	2017-10-26 19:21:58.079418	72	t
25	25	1.0.1.0	conceptsets	SQL	V1.0.1.0__conceptsets.sql	1596904975	postgres	2017-10-26 19:21:58.178247	14	t
26	26	1.0.1.1	penelope	SQL	V1.0.1.1__penelope.sql	2122743697	postgres	2017-10-26 19:21:58.211029	34	t
27	27	1.0.1.1.1	penelope data	SQL	V1.0.1.1.1__penelope_data.sql	-1211737505	postgres	2017-10-26 19:21:58.272691	5511	t
28	28	1.0.1.2	conceptset negative controls	SQL	V1.0.1.2__conceptset_negative_controls.sql	348844206	postgres	2017-10-26 19:22:03.802566	17	t
29	29	1.0.1.3	conceptset generation info	SQL	V1.0.1.3__conceptset_generation_info.sql	2101588319	postgres	2017-10-26 19:22:03.836403	14	t
30	30	1.0.2.0	cohort feasiblity	SQL	V1.0.2.0__cohort_feasiblity.sql	912205576	postgres	2017-10-26 19:22:03.867065	13	t
31	31	1.0.3.1	comparative cohort analysis	SQL	V1.0.3.1__comparative_cohort_analysis.sql	-592293256	postgres	2017-10-26 19:22:03.897623	19	t
32	32	1.0.4.0	ir analysis	SQL	V1.0.4.0__ir_analysis.sql	-1806551670	postgres	2017-10-26 19:22:03.935433	32	t
33	33	1.0.4.1	ir dist	SQL	V1.0.4.1__ir_dist.sql	1121776342	postgres	2017-10-26 19:22:03.985408	5	t
34	34	1.0.5.0	rename system user to anonymous	SQL	V1.0.5.0__rename_system_user_to_anonymous.sql	-1519451184	postgres	2017-10-26 19:22:04.004063	7	t
\.


--
-- Data for Name: sec_permission; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY sec_permission (id, value, description) FROM stdin;
200	configuration:edit:ui	Access to 'Configuration' page
201	user:get	Get list of users
202	permission:get	Get list of permissions
203	role:post	Create role
204	role:get	Get list of roles
205	role:*:get	Get role by ID
206	role:*:permissions:get	Get list of role's permissions
207	role:*:users:get	Get list of role's users
208	role:*:users:*:put	Add users to role
209	role:*:users:*:delete	Remove users from role
210	role:1:permissions:*:put	Add permissions to public role
211	role:1:permissions:*:delete	Remove permissions from public role
30	conceptset:post	Create Concept Set
50	cohortdefinition:post	Save new Cohort Definition
51	job:execution:get	Get list of jobs
52	cohortdefinition:*:copy:get	Copy the specified cohort definition
60	cohortdefinition:get	Get list of Cohort Definitions
61	cohortdefinition:*:get	Get Cohort Definition by ID
62	cohortdefinition:*:info:get	
63	*:vocabulary:lookup:identifiers:post	Perform a lookup of an array of concept identifiers returning the matching concepts with their detailed properties.
64	cohortdefinition:sql:post	Generate SQL from Cohort expression
65	*:cohortresults:*:breakdown:get	Get breakdown with counts about people in cohort
\.


--
-- Name: sec_permission_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('sec_permission_sequence', 1000, false);


--
-- Data for Name: sec_role; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY sec_role (id, name) FROM stdin;
1	public
2	admin
3	concept set creator
5	cohort creator
6	cohort reader
\.


--
-- Data for Name: sec_role_permission; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY sec_role_permission (id, role_id, permission_id, status) FROM stdin;
1000	2	200	\N
1001	2	201	\N
1002	2	202	\N
1003	2	203	\N
1004	2	204	\N
1005	2	205	\N
1006	2	206	\N
1007	2	207	\N
1008	2	208	\N
1009	2	209	\N
1010	2	210	\N
1011	2	211	\N
1012	3	30	\N
1013	5	50	\N
1014	5	51	\N
1015	5	52	\N
1016	6	60	\N
1017	6	61	\N
1018	6	62	\N
1019	6	63	\N
1020	6	64	\N
1021	6	65	\N
\.


--
-- Name: sec_role_permission_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('sec_role_permission_sequence', 1021, true);


--
-- Name: sec_role_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('sec_role_sequence', 1000, false);


--
-- Data for Name: sec_user; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY sec_user (id, login, password, salt, name) FROM stdin;
\.


--
-- Data for Name: sec_user_role; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY sec_user_role (id, user_id, role_id, status) FROM stdin;
\.


--
-- Name: sec_user_role_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('sec_user_role_sequence', 1000, false);


--
-- Name: sec_user_sequence; Type: SEQUENCE SET; Schema: ohdsi; Owner: postgres
--

SELECT pg_catalog.setval('sec_user_sequence', 1000, false);


--
-- Data for Name: source; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY source (source_id, source_name, source_key, source_connection, source_dialect) FROM stdin;
\.


--
-- Data for Name: source_daimon; Type: TABLE DATA; Schema: ohdsi; Owner: postgres
--

COPY source_daimon (source_daimon_id, source_id, daimon_type, table_qualifier, priority) FROM stdin;
\.


--
-- Name: batch_job_execution_context batch_job_execution_context_pkey; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_job_execution_context
    ADD CONSTRAINT batch_job_execution_context_pkey PRIMARY KEY (job_execution_id);


--
-- Name: batch_job_execution batch_job_execution_pkey; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_job_execution
    ADD CONSTRAINT batch_job_execution_pkey PRIMARY KEY (job_execution_id);


--
-- Name: batch_job_instance batch_job_instance_pkey; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_job_instance
    ADD CONSTRAINT batch_job_instance_pkey PRIMARY KEY (job_instance_id);


--
-- Name: batch_step_execution_context batch_step_execution_context_pkey; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_step_execution_context
    ADD CONSTRAINT batch_step_execution_context_pkey PRIMARY KEY (step_execution_id);


--
-- Name: batch_step_execution batch_step_execution_pkey; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_step_execution
    ADD CONSTRAINT batch_step_execution_pkey PRIMARY KEY (step_execution_id);


--
-- Name: exampleapp_widget exampleapp_widget_pkey; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY exampleapp_widget
    ADD CONSTRAINT exampleapp_widget_pkey PRIMARY KEY (id);


--
-- Name: batch_job_instance job_inst_un; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_job_instance
    ADD CONSTRAINT job_inst_un UNIQUE (job_name, job_key);


--
-- Name: feasibility_study pk_clinical_trial_protocol; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY feasibility_study
    ADD CONSTRAINT pk_clinical_trial_protocol PRIMARY KEY (id);


--
-- Name: cohort_definition pk_cohort_definition; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY cohort_definition
    ADD CONSTRAINT pk_cohort_definition PRIMARY KEY (id);


--
-- Name: cohort_definition_details pk_cohort_definition_details; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY cohort_definition_details
    ADD CONSTRAINT pk_cohort_definition_details PRIMARY KEY (id);


--
-- Name: cohort_generation_info pk_cohort_generation_info; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY cohort_generation_info
    ADD CONSTRAINT pk_cohort_generation_info PRIMARY KEY (id, source_id);


--
-- Name: cohort_study pk_cohort_study; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY cohort_study
    ADD CONSTRAINT pk_cohort_study PRIMARY KEY (cohort_study_id);


--
-- Name: concept_of_interest pk_concept_of_interest; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY concept_of_interest
    ADD CONSTRAINT pk_concept_of_interest PRIMARY KEY (id);


--
-- Name: concept_set pk_concept_set; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY concept_set
    ADD CONSTRAINT pk_concept_set PRIMARY KEY (concept_set_id);


--
-- Name: concept_set_generation_info pk_concept_set_generation_info; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY concept_set_generation_info
    ADD CONSTRAINT pk_concept_set_generation_info PRIMARY KEY (concept_set_id, source_id);


--
-- Name: concept_set_negative_controls pk_concept_set_negative_controls; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY concept_set_negative_controls
    ADD CONSTRAINT pk_concept_set_negative_controls PRIMARY KEY (id);


--
-- Name: drug_hoi_evidence pk_drug_hoi_evidence; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY drug_hoi_evidence
    ADD CONSTRAINT pk_drug_hoi_evidence PRIMARY KEY (id);


--
-- Name: drug_hoi_relationship pk_drug_hoi_relationship; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY drug_hoi_relationship
    ADD CONSTRAINT pk_drug_hoi_relationship PRIMARY KEY (id);


--
-- Name: drug_labels pk_drug_labels; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY drug_labels
    ADD CONSTRAINT pk_drug_labels PRIMARY KEY (drug_label_id);


--
-- Name: evidence_sources pk_evidence_sources; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY evidence_sources
    ADD CONSTRAINT pk_evidence_sources PRIMARY KEY (id);


--
-- Name: feas_study_generation_info pk_feas_study_generation_info; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY feas_study_generation_info
    ADD CONSTRAINT pk_feas_study_generation_info PRIMARY KEY (study_id, source_id);


--
-- Name: heracles_visualization_data pk_heracles_viz_data; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY heracles_visualization_data
    ADD CONSTRAINT pk_heracles_viz_data PRIMARY KEY (id);


--
-- Name: ir_analysis pk_ir_analysis; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY ir_analysis
    ADD CONSTRAINT pk_ir_analysis PRIMARY KEY (id);


--
-- Name: ir_analysis_details pk_ir_analysis_details; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY ir_analysis_details
    ADD CONSTRAINT pk_ir_analysis_details PRIMARY KEY (id);


--
-- Name: ir_execution pk_ir_execution; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY ir_execution
    ADD CONSTRAINT pk_ir_execution PRIMARY KEY (analysis_id, source_id);


--
-- Name: laertes_summary pk_laertes_summary; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY laertes_summary
    ADD CONSTRAINT pk_laertes_summary PRIMARY KEY (id);


--
-- Name: sec_permission pk_sec_permission; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_permission
    ADD CONSTRAINT pk_sec_permission PRIMARY KEY (id);


--
-- Name: sec_role pk_sec_role; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_role
    ADD CONSTRAINT pk_sec_role PRIMARY KEY (id);


--
-- Name: sec_role_permission pk_sec_role_permission; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_role_permission
    ADD CONSTRAINT pk_sec_role_permission PRIMARY KEY (id);


--
-- Name: sec_user pk_sec_user; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_user
    ADD CONSTRAINT pk_sec_user PRIMARY KEY (id);


--
-- Name: sec_user_role pk_sec_user_role; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_user_role
    ADD CONSTRAINT pk_sec_user_role PRIMARY KEY (id);


--
-- Name: source pk_source; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY source
    ADD CONSTRAINT pk_source PRIMARY KEY (source_id);


--
-- Name: source_daimon pk_source_daimon; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY source_daimon
    ADD CONSTRAINT pk_source_daimon PRIMARY KEY (source_daimon_id);


--
-- Name: schema_version schema_version_pk; Type: CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY schema_version
    ADD CONSTRAINT schema_version_pk PRIMARY KEY (version);


--
-- Name: heracles_viz_data_idx; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX heracles_viz_data_idx ON heracles_visualization_data USING btree (cohort_definition_id, source_id, visualization_key);


--
-- Name: heracles_viz_data_unq_idx; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE UNIQUE INDEX heracles_viz_data_unq_idx ON heracles_visualization_data USING btree (cohort_definition_id, source_id, visualization_key, drilldown_id);


--
-- Name: hh_idx_cohort_id_analysis_id; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hh_idx_cohort_id_analysis_id ON heracles_heel_results USING btree (cohort_definition_id, analysis_id);


--
-- Name: hr_idx_cohort_def_id; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hr_idx_cohort_def_id ON heracles_results USING btree (cohort_definition_id);


--
-- Name: hr_idx_cohort_def_id_dt; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hr_idx_cohort_def_id_dt ON heracles_results USING btree (cohort_definition_id, last_update_time);


--
-- Name: hr_idx_cohort_id_analysis_id; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hr_idx_cohort_id_analysis_id ON heracles_results USING btree (cohort_definition_id, analysis_id);


--
-- Name: hr_idx_cohort_id_first_res; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hr_idx_cohort_id_first_res ON heracles_results USING btree (cohort_definition_id, analysis_id, count_value, stratum_1);


--
-- Name: hrd_idx_cohort_def_id; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hrd_idx_cohort_def_id ON heracles_results_dist USING btree (cohort_definition_id);


--
-- Name: hrd_idx_cohort_def_id_dt; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hrd_idx_cohort_def_id_dt ON heracles_results_dist USING btree (cohort_definition_id, last_update_time);


--
-- Name: hrd_idx_cohort_id_analysis_id; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hrd_idx_cohort_id_analysis_id ON heracles_results_dist USING btree (cohort_definition_id, analysis_id);


--
-- Name: hrd_idx_cohort_id_first_res; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX hrd_idx_cohort_id_first_res ON heracles_results_dist USING btree (cohort_definition_id, analysis_id, count_value, stratum_1);


--
-- Name: idx_penelope_laertes_uni_pivot; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX idx_penelope_laertes_uni_pivot ON penelope_laertes_uni_pivot USING btree (ingredient_concept_id, condition_concept_id);

ALTER TABLE penelope_laertes_uni_pivot CLUSTER ON idx_penelope_laertes_uni_pivot;


--
-- Name: schema_version_ir_idx; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX schema_version_ir_idx ON schema_version USING btree (installed_rank);


--
-- Name: schema_version_s_idx; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX schema_version_s_idx ON schema_version USING btree (success);


--
-- Name: schema_version_vr_idx; Type: INDEX; Schema: ohdsi; Owner: postgres
--

CREATE INDEX schema_version_vr_idx ON schema_version USING btree (version_rank);


--
-- Name: cohort_definition_details fk_cohort_definition_details_cohort_definition; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY cohort_definition_details
    ADD CONSTRAINT fk_cohort_definition_details_cohort_definition FOREIGN KEY (id) REFERENCES cohort_definition(id);


--
-- Name: cohort_generation_info fk_cohort_generation_info_cohort_definition; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY cohort_generation_info
    ADD CONSTRAINT fk_cohort_generation_info_cohort_definition FOREIGN KEY (id) REFERENCES cohort_definition(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: concept_set_generation_info fk_concept_set_generation_info_concept_set; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY concept_set_generation_info
    ADD CONSTRAINT fk_concept_set_generation_info_concept_set FOREIGN KEY (concept_set_id) REFERENCES concept_set(concept_set_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: drug_hoi_evidence fk_drug_hoi_relationship; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY drug_hoi_evidence
    ADD CONSTRAINT fk_drug_hoi_relationship FOREIGN KEY (drug_hoi_relationship) REFERENCES drug_hoi_relationship(id);


--
-- Name: drug_hoi_evidence fk_evidence_sources; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY drug_hoi_evidence
    ADD CONSTRAINT fk_evidence_sources FOREIGN KEY (evidence_source_code_id) REFERENCES evidence_sources(id);


--
-- Name: feas_study_generation_info fk_feas_study_generation_info_feasibility_study; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY feas_study_generation_info
    ADD CONSTRAINT fk_feas_study_generation_info_feasibility_study FOREIGN KEY (study_id) REFERENCES feasibility_study(id);


--
-- Name: feasibility_inclusion fk_feasibility_inclusion_feasibility_study; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY feasibility_inclusion
    ADD CONSTRAINT fk_feasibility_inclusion_feasibility_study FOREIGN KEY (study_id) REFERENCES feasibility_study(id);


--
-- Name: feasibility_study fk_feasibility_study_cohort_definition_index; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY feasibility_study
    ADD CONSTRAINT fk_feasibility_study_cohort_definition_index FOREIGN KEY (index_def_id) REFERENCES cohort_definition(id);


--
-- Name: feasibility_study fk_feasibility_study_cohort_definition_result; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY feasibility_study
    ADD CONSTRAINT fk_feasibility_study_cohort_definition_result FOREIGN KEY (result_def_id) REFERENCES cohort_definition(id);


--
-- Name: ir_analysis_details fk_irad_ira; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY ir_analysis_details
    ADD CONSTRAINT fk_irad_ira FOREIGN KEY (id) REFERENCES ir_analysis(id);


--
-- Name: sec_role_permission fk_role_permission_to_permission; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_role_permission
    ADD CONSTRAINT fk_role_permission_to_permission FOREIGN KEY (permission_id) REFERENCES sec_permission(id);


--
-- Name: sec_role_permission fk_role_permission_to_role; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_role_permission
    ADD CONSTRAINT fk_role_permission_to_role FOREIGN KEY (role_id) REFERENCES sec_role(id);


--
-- Name: sec_user_role fk_user_role_to_role; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_user_role
    ADD CONSTRAINT fk_user_role_to_role FOREIGN KEY (role_id) REFERENCES sec_role(id);


--
-- Name: sec_user_role fk_user_role_to_user; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY sec_user_role
    ADD CONSTRAINT fk_user_role_to_user FOREIGN KEY (user_id) REFERENCES sec_user(id);


--
-- Name: batch_job_execution_context job_exec_ctx_fk; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_job_execution_context
    ADD CONSTRAINT job_exec_ctx_fk FOREIGN KEY (job_execution_id) REFERENCES batch_job_execution(job_execution_id);


--
-- Name: batch_job_execution_params job_exec_params_fk; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_job_execution_params
    ADD CONSTRAINT job_exec_params_fk FOREIGN KEY (job_execution_id) REFERENCES batch_job_execution(job_execution_id);


--
-- Name: batch_step_execution job_exec_step_fk; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_step_execution
    ADD CONSTRAINT job_exec_step_fk FOREIGN KEY (job_execution_id) REFERENCES batch_job_execution(job_execution_id);


--
-- Name: batch_job_execution job_inst_exec_fk; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_job_execution
    ADD CONSTRAINT job_inst_exec_fk FOREIGN KEY (job_instance_id) REFERENCES batch_job_instance(job_instance_id);


--
-- Name: batch_step_execution_context step_exec_ctx_fk; Type: FK CONSTRAINT; Schema: ohdsi; Owner: postgres
--

ALTER TABLE ONLY batch_step_execution_context
    ADD CONSTRAINT step_exec_ctx_fk FOREIGN KEY (step_execution_id) REFERENCES batch_step_execution(step_execution_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: cloudsqlsuperuser
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
