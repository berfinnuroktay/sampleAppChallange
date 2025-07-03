# Hierarchical JSON Viewer App

A SwiftUI app that loads and displays nested hierarchical JSON (pages, sections, text and image questions) with offline support.

---

## Setup Instructions

**Requirements**
- Xcode 15 or later
- iOS 16.0 or later
- Swift Package Manager (SPM) for dependencies

**Getting Started**

1. **Clone the repository:**
    ```sh
    git clone https://github.com/berfinnuroktay/sampleAppChallange.git
    cd sampleAppChallange
    ```

2. **Open the project in Xcode:**
    - Open `SampleAppChallange.xcodeproj`.

3. **Wait for package dependencies to be resolved:**
    - On first open, Xcode will resolve them automatically.
    - Main external dependency: [Nuke](https://github.com/kean/Nuke) (for image loading and disk cache).

4. **Build and run:**
    - Select the `SampleAppChallange` target and run.

---

## Project Overview

This app demonstrates:
- **Clean SwiftUI architecture**
- **Decoding and recursive rendering** of arbitrary JSON hierarchies (pages, sections, text, images)
- **Offline support**

---

## Project Structure

- `Sources/`
    - `Models/` – Data models (with custom Codable/Equatable)
    - `Views/` – Main UI (including HomeView, HierarchyNodeView, etc.)
    - `ViewModels/` – Presentation logic and state
    - `Services/` – Networking and local caching (JSON + images)
- `Resources/` – Assets, icons
- `Tests/` – Unit and UI tests (if included)

---

## Technical Highlights

- **SwiftUI:** Uses latest patterns (StateObject, async/await, modifiers)
- **Recursive rendering:** Supports arbitrary hierarchy depth using recursion
- **Type-safe JSON decoding:** Models support robust parsing with meaningful errors
- **Offline support:**  
  - JSON responses are saved as `Library/Caches/hierarchy.json` after every fetch.
  - On startup or network failure, cached data is loaded automatically.
- **Image caching:**  
  - [Nuke](https://github.com/kean/Nuke) manages memory/disk cache for all images.  
  - Any image seen once is available offline on the next app launch.
- **Error handling:**  
  - All errors are surfaced to the user via alerts.
  - Graceful fallback to cached data on network error.

---

## Dependencies

- **[Nuke](https://github.com/kean/Nuke):** For efficient, reliable image loading and caching.
