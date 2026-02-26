# 🛡️ SafePathAI

> **Empowering safer navigation through real-time AI environmental analysis.**
> *Aligning with UN Sustainable Development Goal 11: Sustainable Cities and Communities.*

## 📌 Project Overview
SafePathAI is a mobile application designed to [TYPE YOUR 1 SENTENCE DESCRIPTION HERE]. 

**Hackathon Criteria Fulfillment:**
* ✅ **Google AI Technology:** Powered by **Google AI Studio / Gemini** for real-time environmental analysis.
* ✅ **Google Technology (Non-AI):** Built completely on the **Flutter Framework** (and compiled via Android Studio) for a high-performance, cross-platform mobile experience.



## 1. Technical Architecture
SafePathAI uses a streamlined client-server model to ensure fast processing and low latency on mobile devices:

* **Frontend User Interface:** Developed in **Flutter** (Dart), ensuring a responsive, native-feeling app for Android.
* **Device Hardware Integration:** Utilizes the native Android Camera/Device APIs to capture environmental data.
* **AI Processing Engine:** The app communicates directly with **Google AI Studio** via API. The Gemini model acts as the "brain," processing the visual/text inputs and returning actionable safety insights to the user.
* **Build Environment:** Compiled and optimized using **Android Studio** and the Gradle build system for a polished `.apk` release.



## 2. Implementation Details
The current submission is a fully functional prototype deployed as a Release-ready Android APK. Key implementation highlights include:

* **Fast Optimization:** The app was compiled Ahead-Of-Time (AOT) in Release Mode (`flutter build apk --release`) to strip out debug overhead and ensure the AI response latency remains under our target metric.
* **Native Configuration:** Custom configurations were implemented at the Android Native layer (`AndroidManifest.xml`) to ensure proper branding and system-level permissions for hardware access.
* **Core Flow:** 1. User initiates a scan via the minimalist UI.
    2. Data is sent asynchronously to the Google AI Studio endpoint.
    3. The AI processes the data and returns a safety classification.
    4. The Flutter UI updates state dynamically to alert the user.



## 3. Challenges Faced
Building a hardware-to-AI pipeline came with several technical hurdles:

* **Build System Resource Locking:** During rapid iteration, we encountered persistent file-locking issues with the Gradle Daemon on Windows. We solved this by implementing manual process-killing scripts to force clean the build environment.
* **Cross-Platform UI Consistency:** Ensuring the custom minimalist branding required diving into native Android asset configurations rather than just Flutter code.
* **Prompt Engineering for Speed:** Tuning the Google AI Studio prompts to return *only* the necessary data without conversational fluff, ensuring the app reacts fast enough for real-world scenarios.



## 4. Future Roadmap
As we move toward the final round and public release, SafePathAI will be expanded with the following features:

* **Phase 1 (Final Round Goal):** Integrate the **Google Maps API** (Adding a second Google Technology) to overlay the AI's hazard detection onto a live GPS routing system.
* **Phase 2:** Implement text-to-speech (TTS) features for hands-free auditory alerts, deeply integrating with Android's native accessibility services.
* **Phase 3:** Compile and release the iOS version (thanks to our Flutter codebase) to expand our user base and impact.
