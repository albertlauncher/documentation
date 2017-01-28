main();

/**
 * This is the begining.
 */
function main() {
    initClipboard();

    // Get all inputs with the 'style' class and add an event listener
    var inputs = [].slice.call(document.querySelectorAll('.style'));
    inputs.forEach(function (input) {
        input.addEventListener('input', function () {
            updateTheme(input);
        });

        // Update the theme for the first time so the pre area is filled with the values
        updateTheme(input);
    });
}

/**
 * Update the theme with the user's changes.
 *
 * @param el
 */
function updateTheme(el) {
    var name = el.name,
        value = el.value;

    if (name == 'item_selected_color' || name == 'action_list_selected_color') {
        value = lightenDarkenColor(value, 100);
    }

    // Update the style in realtime
    document.documentElement.style.setProperty('--' + name, value, "");

    // Update the to be qss file
    var els = document.querySelectorAll('.' + name);
    for (var i = 0; i < els.length; i++) {
        value = value.replace(/#/g, '');
        els[i].innerHTML = value;
    }
}

/**
 * Init the clipboard plugin.
 */
function initClipboard() {
    var clipboard = new Clipboard(".theme button", {
        text: function () {
            return document.getElementById("result").innerText;
        }
    });

    clipboard.on('success', function (e) {
        var trigger = e.trigger,
            original = trigger.innerHTML;

        trigger.innerHTML = "Copied!";
        setTimeout(function () {
            trigger.innerHTML = original;
        }, 1000);
    });
}

/**
 * https://css-tricks.com/snippets/javascript/lighten-darken-color/
 * @returns {string}
 */
function lightenDarkenColor(col, amt) {
    var usePound = false;
    if (col[0] == "#") {
        col = col.slice(1);
        usePound = true;
    }

    var num = parseInt(col, 16);
    var r = (num >> 16) + amt;
    if (r > 255) r = 255;
    else if (r < 0) r = 0;
    var b = ((num >> 8) & 0x00FF) + amt;
    if (b > 255) b = 255;
    else if (b < 0) b = 0;
    var g = (num & 0x0000FF) + amt;
    if (g > 255) g = 255;
    else if (g < 0) g = 0;
    return (usePound ? "#" : "") + (g | (b << 8) | (r << 16)).toString(16);
}