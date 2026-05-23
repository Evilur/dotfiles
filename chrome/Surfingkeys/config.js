'use strict'

const HOMEPAGE = 'file:///usr/share/HomePage/index.html';
const HINT_CHARS = 'jklhgfdsayuionmertcvbpx';
const LANG = 'ru-RU';

const {
    mapkey, map, cmap, imap, unmap, cunmap, iunmap, injectJS, postMessage,
    CustomJS, Hints, Front, RUNTIME, tabOpenLink, removeSearchAlias
} = api;

CustomJS.ApiValidator.setApi(api);
const {
    Remap,
    Images
} = CustomJS;

const {
    remap,
    iremap,
    cremap,
    vremap
} = Remap;

/* Exec command only for specific url */
const exec_on = (host, f) => {
    if (window.location.host == host) f();
}

/* Swap two key commands */
const swap = (k1, k2) => {
    map(';temp', k1);
    map(k1, k2);
    map(k2, ';temp');
    unmap(';temp');
};

/* Unmap all unnecessary commands */
[
    'cp', ';pa', ';pb', ';pd', ';ps', ';pc', ';cp', ';ap', 'on',
    'gT', 'gt', 'B', 'e', 'sd', 'sb', 'sw', 'sh', 'ss', '[[', ']]', 'C',
    '<Ctrl-i>', 'od', 'ob', 'ow', 'os', 'H', ';ql', '<Alt-s>'
].forEach((e) => unmap(e));

/* ################## */
/* # Search Aliases # */
/* ################## */
removeSearchAlias('d');
removeSearchAlias('b');
removeSearchAlias('w');
removeSearchAlias('s');

/* ########### */
/* # Omnibar # */
/* ########### */
remap('gO', 't');  // Open a URL
remap('ow', 'oe');
remap('sw', 'se');

/* ######## */
/* # Tabs # */
/* ######## */
remap('cJ', 'gx0');  // Close all tabs on left
remap('cj', 'gxt');  // Close tab on left
remap('cK', 'gx$');  // Close all tabs on right
remap('ck', 'gxT');  // Close tab on right
remap('ca', 'gxx');  // Close all tabs except current one
remap('cp', 'gxp');  // Close playing tab
remap('J', 'E');  // Go one tab left
remap('K', 'R');  // Go one tab righ
remap('<', '<<');  // Move current tab to left
remap('>', '>>');  // Move current tab to right
mapkey('t', 'Open a new tab', () =>
    tabOpenLink(HOMEPAGE, 1));  // Open a new tab

/* ################### */
/* # Page Navigation # */
/* ################### */
swap('gu', 'gU'); // Go up / to the root of the URL hierarchy
swap(';u', ';U');  // Edit current URL with vim editor, and open in new tab / reload
remap('^', '<Ctrl-6>');  // Go to last used tab
remap('H', 'S');  // Go back in history
remap('L', 'D');  // Go forward in history

/* ######################### */
/* # Scroll Page / Element # */
/* ######################### */
remap('D', 'P');  // Scroll full page down
remap('ss', 'cS');  //Reset scroll target

/* ############### */
/* # Mouse Click # */
/* ############### */
remap('F', 'gf'); // Open a link in a new tab
remap('<Ctrl-j>', '<Ctrl-h>'); // Mouse over elements
remap('e', 'q'); // Click on an Image or a button
remap('as', ';fs');  //Display hints to focus scrollable elements

/* ############# */
/* # Clipboard # */
/* ############# */
mapkey('yI', 'Copy the image to the clipboard', Images.copyImage)

/* ######## */
/* # Help # */
/* ######## */
remap('P', '<Alt-i>');  // Enter PassThrough mode to suppress SurfingKeys
remap('<Alt-s>', '<Ctrl-s>');  //Toggle SurfingKeys on current site

/* ############ */
/* # Settings # */
/* ############ */
settings.showModeStatus = false;
settings.showProxyInStatusBar = false;
//settings.richHintsForKeystroke =
//settings.useLocalMarkdownAPI =
settings.focusOnSaved = true;
//settings.omnibarMaxResults =
//settings.omnibarHistoryCacheSize =
//settings.omnibarPosition =
//settings.omnibarSuggestion =
//settings.omnibarSuggestionTimeout =
//settings.focusFirstCandidate =
//settings.tabsThreshold = 0;
//settings.verticalTabs =
//settings.clickableSelector =
//settings.clickablePat =
//settings.editableSelector =
settings.smoothScroll = true;
settings.modeAfterYank = 'Normal';
settings.scrollStepSize = 70;
settings.scrollFriction = 0;
settings.nextLinkRegex = '';
settings.prevLinkRegex = '';
settings.hintAlign = 'left';
settings.hintExplicit = false;
settings.hintShiftNonActive = false;
settings.defaultSearchEngine = 'g';
//settings.blocklistPattern =
settings.focusAfterClosed = 'right';
settings.repeatThreshold = 100;
//settings.tabsMRUOrder =
//settings.historyMUOrder =
settings.newTabPosition = 'last';
settings.interceptedErrors = [];
settings.enableEmojiInsertion = false;
settings.startToShowEmoji = 0;
settings.language = LANG;
settings.stealFocusOnLoad = true;  ////////////////////////////////////////////////////
settings.enableAutoFocus = false;  ////////////////////////////////////////////////////
settings.caseSensitive = false;  ///////////////////////////////////////////////////
settings.smartCase = true;  ////////////////////////////////////////////////
settings.cursorAtEndOfInput = true;
settings.digitForRepeat = true;  /////////////////////////////////////////
settings.editableBodyCare = true;
settings.ignoredFrameHosts = [];
settings.aceKeybindings = 'vim';
//settings.caretViewport =
settings.mouseSelectToQuery = [];
settings.autoSpeakOnInlineQuery = false;
settings.blocklist = {
  "https://example.com": 1
};

/* ######### */
/* # Hints # */
/* ######### */
Hints.setCharacters(HINT_CHARS);

/* ################ */
/* # Inline Query # */
/* ################ */
const getTranslation = data => `<div id='sk_translation'>${data}</div>`;
const getError = () => getTranslation(
    'Error: The remote server was unable to complete the translation'
);
const getWordTranslation = content => {
    /* Clear Elements: images, audio, empty table lines */
    for (const e of content.querySelectorAll(
        'audio,img,tr[height],tr:not(:has(td:not(:empty)))')) e.remove();

    /* Delete links */
    for (const e of content.querySelectorAll('a')) {
        e.outerHTML = e.outerHTML
        .replace(/<a/g, '<span class="link"')
        .replace(/<\/a>/g, '</span>');
    }

    /* Return the result */
    return getTranslation(content.outerHTML);
}

api.Front.registerInlineQuery({
    url: 'https://www.multitran.com/m.exe?ll1=2&ll2=1&s=',
    parseResult: function(html) {
        /* Parse the html */
        const parser = new DOMParser();
        const content = parser
            .parseFromString(html.text, "text/html")
            .querySelector('#start > :last-child > table');

        /* If it is not a word translation */
        if (!content) return getError();

        /* If all is OK */
        return getWordTranslation(content);
    }
});

/* ##################### */
/* # Custom Stie Rules # */
/* ##################### */
const pM = postMessage;
exec_on('www.youtube.com', () => {
    injectJS('youtube');
    mapkey(',F', 'Focus the player', () => pM('focus'));
    mapkey(',f', 'Toggle fullscreen mode', () => pM('toggleFullscreen'));
    mapkey(',t', 'Toggle wide mode', () => pM('toggleWide'));
    mapkey(',l', 'Like the video', () => pM('like'));
    mapkey(',q', 'Set the best video quality', () => pM('setMaxQuality'));
    mapkey(',d', 'Decrease the video quality', () => pM('decreaseQuality'));
    mapkey(',i', 'Decrease the video quality', () => pM('increaseQuality'));
    mapkey(',r', 'Reset the playback rate', () => pM('setRate', 1));
    mapkey(',2', 'Set the playback rate to 2x', () => pM('setRate', 2));
    mapkey(',,', 'Decrease the playback rate', () => pM('decreaseRate'));
    mapkey(',.', 'Increase the playback rate', () => pM('increaseRate'));
});
