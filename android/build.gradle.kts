allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
// At the top of your app/build.gradle.kts file
val Properties = properties()
if (rootProject.file("local.properties").exists()) {
    properties.load(rootProject.file("local.properties").inputStream())
}

android {
    ndkVersion = "27.0.12077973"

    defaultConfig {
        // This line makes the key available in your code
        buildConfigField("String", "GOOGLE_API_KEY", properties.getProperty("GOOGLE_API_KEY", ""))
    }
}

