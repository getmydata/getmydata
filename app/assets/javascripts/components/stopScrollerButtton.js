function stopScrollerButton() {
    if (document.documentElement.scrollTop > 100) {
      console.log("MORE THAN 500")
        document.getElementById("stickybutton-left").className = "wizzard-button btn-left-absolut";
        document.getElementById("stickybutton-right").className = "wizzard-button btn-right-absolut";
    } else {
        document.getElementById("stickybutton-left").className = "wizzard-button btn-left";
        document.getElementById("stickybutton-right").className = "wizzard-button btn-right";
    }
}
window.onscroll = stopScrollerButton;
