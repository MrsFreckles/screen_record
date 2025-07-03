# Screen Recording with wf-recorder and Monitor Selection

This Bash script makes screen recording easy using `wf-recorder`. It checks if a recording is already running and stops it if requested. When starting a new recording, it asks you to pick which monitor to record.

---

## How it works

* Checks if `wf-recorder` is already running.

  * If yes, it stops the running recording gracefully and shows a “Finished Recording” notification.
* If no recording is running:

  * Lists all available monitors using `hyprctl`.
  * Opens a selection menu (via `wofi`) to choose the monitor to record.
  * Starts recording on the selected monitor.
  * Saves the recording in `~/Videos/Recordings/` with a timestamp in the filename.
  * Shows a “Recording Started” notification.

---

## Requirements

* `wf-recorder` (for screen recording)
* `hyprctl` (to list monitors)
* `wofi` (for the monitor selection menu)
* `libnotify` (for desktop notifications)
* Linux with Hyprland (Wayland)

---

## Usage

1. Make the script executable, e.g.

   ```bash
   chmod +x screen_record.sh
   ```

2. Run the script:

   ```bash
   ./screen_record.sh
   ```

3. If a recording is active, it will be stopped. If not, a monitor selection menu will appear.

4. After selecting a monitor, the recording starts and the file is saved under `~/Videos/Recordings/`.

---

## Notes

* If you cancel the monitor selection, a “Recording Cancelled” notification appears.
* The script sends an interrupt signal (`-INT`) to `wf-recorder` for a clean stop.
* The recording filename contains the current date and time for easy sorting.
