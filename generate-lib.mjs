// @ts-check
import { execSync } from "child_process";
import * as fs from "fs/promises";

await fs.copyFile("libs/dailyzap_api/pubspec.yaml", "libs/dailyzap_api/pubspec.yaml.bak");
execSync("dart run build_runner build --delete-conflicting-outputs", { stdio: "inherit" });
const hardcodedPathFile = "libs/dailyzap_api/lib/api_client.dart";
await fs.writeFile(
    hardcodedPathFile,
    (
        await fs.readFile(hardcodedPathFile, "utf-8")
    )
        .replace("final String basePath", "String basePath")
        .replace("final Authentication? authentication", "Authentication? authentication")
        .replace(/  this.basePath = '.*'/, "  this.basePath = ''")
);
await fs.rename("libs/dailyzap_api/pubspec.yaml.bak", "libs/dailyzap_api/pubspec.yaml");
