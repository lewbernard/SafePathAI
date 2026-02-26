# 🛡️ SafePathAI

## Project Overview
SafePathAI is a mobile application designed to assist the visually impaired in navigating daily tasks using AI. 

**Hackathon Criteria Fulfillment:**
* ✅ **Google AI Technology:** Powered by **Google AI Studio / Gemini** for real-time environmental analysis.
* ✅ **Google Technology (Non-AI):** Built completely on the **Flutter Framework** (and compiled via the Android SDK) for a high-performance, cross-platform mobile experience.

---

### 1. Technical Architecture
SafePathAI uses a streamlined client-server model to ensure fast processing and low latency on mobile devices:

* **Frontend User Interface:** Developed in **Flutter** (Dart), ensuring a responsive, native-feeling app for Android.
* **Device Hardware Integration:** Utilizes the native Android Camera and Device APIs to capture real-time environmental data.
* **AI Processing Engine:** The app communicates directly with **Google AI Studio** via API, where the Gemini model acts as the "brain" to process visual inputs and return safety insights.
* **Build Environment:** Compiled and optimized using the **Android SDK** and the Gradle build system for a polished, production-ready `.apk` release.

### 2. Implementation Details
The current submission is a fully functional prototype deployed as a Release-ready Android APK. Key implementation highlights include:

* **Fast Optimization:** The app was compiled Ahead-Of-Time (AOT) in Release Mode (`flutter build apk --release`) to strip out debug overhead and ensure AI response latency remains under our target metric of < 3 seconds.
* **Native Configuration:** Custom configurations were implemented at the Android Native layer (`AndroidManifest.xml`) to ensure proper branding and necessary system-level permissions for hardware access.
* **Core Flow:** 1. **User Interaction:** The user taps the screen to activate environmental scanning.
    2. **Image Capture:** The smartphone camera captures the surrounding scene.
    3. **AI Processing:** The vision model (Gemini) processes the image in real time via Google AI Studio.
    4. **Environmental Analysis:** The system analyzes objects, obstacles, and environmental context.
    5. **Description Generation:** The AI generates a clear, concise description of all detected elements.
    6. **Audio Conversion:** The app converts the text description into instant audio feedback.
    7. **Voice Guidance:** The user receives real-time voice guidance for safer navigation.


### Challenges Faced
Building a hardware-to-AI pipeline came with several technical hurdles:

* **User Testing & Iteration Constraints:** As a fast-paced hackathon project, finding visually impaired individuals for real-world beta testing was highly challenging. To iterate on the UX, we had to rely on simulated testing (e.g., blindfolded navigation) and standard accessibility heuristics. This taught us that while the underlying AI works, true validation requires partnering with accessibility organizations in the future.
* **Defining Success Metrics:** Initially, quantifying "safety" was a major challenge. We realized that standard technical metrics weren't enough. We had to design a rigorous comparative testing matrix to measure actual human impact. We defined our success by directly comparing traditional navigation (white cane alone) against augmented navigation (white cane + SafePathAI). Our core metrics focused on three physical realities: reducing the number of bodily collisions with objects, the accuracy of reading contextual environmental text (like signboards and groceries), and the vital detection of head-level objects that traditional canes completely miss.
* **Prompt Engineering for Speed:** Tuning the Google AI Studio prompts to return *only* the necessary data without conversational fluff, ensuring the app reacts fast enough for real-world scenarios.



### Future Roadmap
As we move toward the final round and public release, SafePathAI will be expanded with the following features:

* **Phase 1 (Final Round Goal):** Implement text-to-speech (TTS) features for hands-free auditory alerts, deeply integrating with Android's native accessibility services.
* **Phase 2:** Integrate the **Google Maps API** (Adding a second Google Technology) to overlay the AI's hazard detection onto a live GPS routing system.
* **Phase 3:** Compile and release the iOS version (thanks to our Flutter codebase) to expand our user base and impact.
