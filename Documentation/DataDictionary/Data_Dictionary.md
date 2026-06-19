# Mars Colonization Database Data Dictionary

This data dictionary details the structure, data types, lengths, constraints, and descriptions for all tables in the Mars Colonization Database Management System.

## Data Dictionary For Colonist Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| mars_coloni_id | varchar | 10 | primary key | Unique code for each colonist |
| first_name | varchar | 10 | not null | First Name of the colonist |
| middle_name | varchar | 10 | not null | middle Name of the colonist |
| sure_name | varchar | 20 | not null, | Sure Name of the colonist |
| age | int | _ | not null, | The Age of colonist |
| earth_address | varchar | 10 | not null, | Each Colonist earth address |
| contact_number | int | _ | not null, | The contact number of colonist |
| date_of_birth | date | _ | not null, | The Date of birth of the colonist |
| gender | varchar | 10 | _ | The colonist Gender |
| civil_status | varchar | 10 | not null | The civil statues of the colonist |
| qualification | varchar | 10 | _ | The Colonist qualifications |
| Num_of_family | int | _ | not null | The colonist family members count |
| Trip_id | varchar | 10 | _ | The trip id of colonist |
| colony_lot_number | varchar | 10 | not null | The lot number of colonist |

## Data Dictionary For Trip Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| Trip_id | Varchar | 20 | primary key | The Id of each trips |
| Lanuch_date | date | _ | not null | The trips launching date |
| Return date | date | _ | not null | Returning date of the trips |
| Jet_unique_code | varchar | 10 | not null | The trips jets unique codes |

## Data Dictionary For House Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| Colony_lot_number | varchar | 10 | primary key | The lot number of colonist house |
| Num_of_rooms | int | _ | not null | The number of rooms for house |
| square_feet | int | _ | not null | The square feet of the houses |

## Data Dictionary For Job Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| jop_id | varchar | 10 | primary key | The id of job |
| jop_title | varchar | 20 | not null | The tittle of job |

## Data Dictionary For E Jet Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| jet_uniqe_code | varchar | 10 | primary key | The unique code of E jet |
| weight | float | _ | not null | The weight of E jet |
| engine_type | varchar | 50 | not null | The engine type of E jet |
| made_year | int | _ | not null | The made year of E jet |
| Nuclear_en_power | varchar | 50 | not null | The Power source for  E jet |
| Num_of_seats | int | _ | not null, | Number of seats of the E jet |

## Data Dictionary For Dependents Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| Mars_coloni_id | varchar | 10 | Not null | The Mars colonist id |
| name | varchar | 50 | not null | The dependent name |
| gender | varchar | 10 | not null | The dependents gender |
| relationship | varchar | 50 | Not null | Dependents relationships |
| date_of_birth | date | _ | not null | Date of birth of dependents |
| age | int | _ | not null | The age of dependents |

## Data Dictionary For Astronomers Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| Astronomers_id | varchar | 10 | primary key | The astronomers id |
| name | varchar | 10 | not null | The astronomers name |
| rank | varchar | 10 | not null | Rank of astronomers |
| Qualification | varchar | 50 | Not null | The Qualification of astronomers |
| jet_unique_code | varchar | 10 | not null | Astronomers jet id |

## Data Dictionary For Colonist_Job Details

| Field name | Data type | Field Size | Constraints | Description |
| --- | --- | --- | --- | --- |
| Mars_coloni_id | varchar | 10 | _ | The  colonist mars id |
| job_id | varchar | 10 | _ | The job id for colonist |
| rank | varchar | 10 | not null | The rank of colonist |
| Qualification | varchar | 50 | Not null | The qualification of colonist |
| jet_unique_code | varchar | 10 | not null | The jet unique code of colonist |
