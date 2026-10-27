# IST 210 Relational Database Lab

A local web app for the four-table university student database from the attached Microsoft Learn SSMS tutorial. It connects to Azure SQL and supports `Person`, `Student`, `Course`, and `Credit` records. The database remains the system of record; the local PowerShell bridge only serves the app and forwards SQL requests.

The interface includes EdgeHTML compatibility fallbacks for Microsoft Edge Legacy, including a custom CRUD dialog instead of the newer native `<dialog>` element and layouts that do not depend on newer CSS grid behavior.

## Start the app

Run `start-server.bat`, then open [http://localhost:8080](http://localhost:8080). The login screen uses the Azure SQL server, database, and username listed in `LOGIN_INFO.txt`; enter the password from that document when connecting. The bridge uses encrypted Azure SQL connections.

## Database tables

The app expects the four tables from the Microsoft Learn tutorial in the connected database. `schema.sql` contains the same table definitions for reference or for creating the schema in an empty lab database. Run it only if those tables do not already exist. The app does not apply schema changes automatically.

- `Person`: first name, middle initial, last name, and date of birth.
- `Student`: optional link to a person and an email address.
- `Course`: course name and teacher.
- `Credit`: student/course links, grade, and attempt.

If a delete is blocked by a foreign key, remove dependent credit/student records first. The app does not cascade-delete related data.
