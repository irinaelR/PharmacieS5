# Pharmacie S5

## Requirements

- Java 19 or higher
- Apache Tomcat 10
- NodeJS (for TailwindCSS)
- PostgreSQL JDBC driver (I used postgresql-42.6.0.jar)
- Jakarta servlet API jar (I used my tomcat/lib/servlet-api.jar)

## Install and run project

### Setup

1. Go to project location > terminal > run `npm install`. This will install TailwindCSS in your project, you should notice a `node_modules/` folder created after running the command.
2. Make sure to copy the two necessary jars into `lib/`
3. Connect to your postgres user and copy paste the content of `schema.sql`.

### Deployment

1. Update the `deploy.bat` file to fit your environment:
    - Replace `ABSOLUTE\PATH\TO\PROJECT` (the `work_dir` variable) to the actual path to the project on your PC (e.g. "C:\Users\climi\Documents\PharmacieS5-Repo") 
    - Replace `ABSOLUTE\PATH\TO\TOMCAT` (the `web_apps` variable) with the actual path to your Tomcat's webapps folder (e.g. "C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps")
    - Replace `ABSOLUTE\PATH\TO\JAVA\bin\javac.exe` (the `java_home` variable) with the actual path to your Java's javac command (e.g. "C:\Program Files\Java\jdk-19\bin\javac.exe")
2. Run the bat file
3. Start your tomcat server. The project will be accessible at `localhost:8080/pharmacys5/`.

## Development

Before deploying the project, always make sure the CSS is up to date. Run `npx tailwindcss -i ./src/main/resources/input.css -o ./src/main/webapp/assets/css/output.css --watch` in the terminal at the project's location to update the `output.css` file.