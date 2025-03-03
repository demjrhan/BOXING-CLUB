# BOXING CLUB
Winter Semester 2024, SBD Project

<p align="center">
    <img src="https://github.com/demjrhan/BoxingClub/blob/main/schema/Boxing_Club%20Vertabelo.png" alt="BOXING CLUB VERTABELO PNG" width="500"/>
</p>

The Boxing Club SQL project is a relational database designed to manage and analyze the operations of a boxing club. It handles critical aspects such as boxer records, sponsors, trainers, matches, and weight classes, providing a robust platform for managing data and generating insights.

## Project Overview

The Boxing Club SQL project is crafted to streamline boxing club management by organizing data through a structured SQL schema. It facilitates efficient storage, retrieval, and analysis of essential data, supporting better decision-making and operational efficiency.

## Features

- **Boxer Management**: Store detailed information about boxers, including their weight class, trainer assignments, and performance records.
- **Trainer and Sponsor Tracking**: Maintain profiles for trainers and sponsors, tracking their contributions and relationships with boxers.
- **Match Organization**: Record match details such as participants, location, date, results, and win types.
- **Weight Classes and Leagues**: Manage boxing weight classes and their associated leagues with descriptions and limits.
- **Data Relationships**: Ensure referential integrity across the database through foreign key constraints.
- **Query Capabilities**: Predefined SQL queries provide insights such as match statistics, sponsor contributions, and boxer performance metrics.

## Database Schema

The Boxing Club schema includes the following tables:

- **Trainer**: Stores information about trainers, including their name, surname, and age.
- **Boxer**: Contains boxer-specific details such as age, weight, assigned trainer, and weight class.
- **Record**: Tracks the performance of boxers, including wins, losses, matches played, and draws.
- **Sponsor**: Manages sponsors and their details, such as name, description, and sponsorship amounts.
- **Boxer_Sponsor**: Tracks the relationships between boxers and their sponsors, including signing dates.
- **Match**: Records match details like date, location, participants, winner, and win type.
- **Weight_Class**: Defines weight classes with limits and descriptions.
- **League**: Stores information about boxing leagues, including their duration and description.
- **Weight_Class_League**: Links weight classes to specific leagues.
- **Win_Type**: Categorizes match outcomes (e.g., knockout, technical decision).

## Installation

1. Clone this repository:
   `git clone https://github.com/demirhanylcn/BoxingClub.git`
2. Import the SQL scripts into your preferred SQL database environment to create the schema.

## Usage

1. Run the `create_and_insert.sql` script (available for both Microsoft SQL and Oracle) to set up the database schema and populate it with sample data.
2. Use the `queries.sql` file for executing predefined queries, such as retrieving match results, sponsor contributions, or boxer statistics.

## Additional Information

- The schema diagram (`boxing_club_schema.png`) is available in the `schema/` directory for visual reference.
- Documentation files explaining the schema and usage instructions are included in the `docs/` directory.
