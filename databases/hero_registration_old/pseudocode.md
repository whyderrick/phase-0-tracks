# Hero Registration Pseudocode
## Building the Seed Known Database with Ruby
- Set the required dependencies (gather your materials)
- Initialize the database (create persistent storage)
- Create the known_heroes table
- Create some 50 random records with Faker data
-- Doing this will require iterating over the command to create a random row 50 times
- Update several of those records to use familiar, real names for testing purposes.

## Building the public nominations
- Create the suspected_heroes table
- Seed it with 1000 fake records

## Building the personal interface
- Prompt for a first name, store it as a variable
  - IF the entered value is "inspctr"
    - BREAK
    - RUN inspector
- Prompt for a last name, store it as a variable
- Prompt for the hero whose identity they think they've discovered, store it.
- Prompt for who they think said hero is.
- Query the known hero database.
  - IF the superhero is present
    - Compare the name to what's present in the known table
    - IF it matches:
      - Query the database for the address of that hero. Store it as `address`
      - Thank the reporter and say "We knew that #{hero} was #{identity}. They live at #{address}"
    - ELSE:
      - "Thanks for reporting, we have on good authority that #{hero} is actually #{identity}".
- ELSE
  -  WRITE to suspected_heroes
  -  "Thank you for your suggestion. We'll keep a close eye on #{name}."


## Building the inspector interface
- Prompt for the inspector's credential and password
- Authenticate that against the database
- IF id and password authenticate
  - Prompt inspector for the name of the hero they've discovered. Store it as `alias`
  - Prompt inspector for the identity of the hero. Store it as `secret_identity`
  - Prompt inspector for address
  - Continue prompting FOR EACH field in the known heroes table.
- IF inspector wants to add another hero (prompt to find out)
  - repeat steps between prompt and the add more step

[comment]: #(I'm realizing that it anything with "repeat several steps" is probably best defined as it's own method.)
- ELSE
  - Exit the program