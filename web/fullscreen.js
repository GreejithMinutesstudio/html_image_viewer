function toggleFullScreen() {
    if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen();
    } else {
        if (document.exitFullscreen) {
            document.exitFullscreen();
        }
    }
}
function enterFullScreen() {
    if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen();
    }
}

function exitFullScreen() {
    if (document.fullscreenElement) {
        document.exitFullscreen();
    }
}
