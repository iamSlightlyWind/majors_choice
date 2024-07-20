
function handleFormSubmission(formID) {
    const form = document.getElementById(formID);
    const error = form.querySelector(".error");

    form.addEventListener("submit", function (event) {
        event.preventDefault();
        const response = grecaptcha.getResponse();
        if (window.location.href.includes("localhost")) {
            form.submit();
        }
        if (response) {
            form.submit();
        } else {
            error.innerHTML = "Complete Captcha to continue";
        }
    });
}
