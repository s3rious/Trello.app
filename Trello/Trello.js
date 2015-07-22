window.injected = true;

var css = '\
#header { position: fixed; z-index: 10; top: 0; left: 0; right: 0 }\
#content { padding-top: 40px }\
a.header-btn.header-boards.js-boards-menu { margin-left: 64px }\
.header-btn { background: none!important }\
.header-btn:active { box-shadow: 0 0 8px 4px rgba(0, 0, 0, 0.32) inset }\
.js-boards-menu.header-btn { min-width: 30px; box-sizing: border-box } \
.js-boards-menu.header-btn .header-btn-text { display: none } \
span.header-btn-text.js-member-name { display: none }\
a.header-btn.header-member.js-open-header-member-menu { -webkit-order: 3; }\
div.header-user { display: -webkit-flex; left: 104px; width: 106px }\
.pinned-drawer div.header-user { left: 5px }\
a.header-btn.open-search-btn.js-open-search-page { position: absolute; right: 5px; margin: 0 }\
.boards-drawer { top: 40px; bottom: 0px; border-radius: 0 }\
.boards-drawer-pinned.boards-drawer { top: 0 }\
.boards-drawer-pinned.boards-drawer .boards-drawer-header { text-align: center }\
.pinned-drawer #surface { margin-left: 280px }\
.header-search { position: absolute; top: 5px; right: 5px; margin: 0 }\
input.header-search-input { width: 261px!important; transition: all 0s linear!important }\
div.board-widgets{ top: 0; border-radius: 0 }\
.sidebar-hide-btn { top: 40px }\
div.board-widgets-container { margin-top: 40px; top: 0; right: 0; bottom: 0; left: 0 }\
div.board-widgets-content-wrapper { padding-left: 8px; padding-top: 8px; width: 278px }\
.board-widgets-content { width: 255px; margin-right: 0 }\
.board-widgets-title.in-frame { margin-top: 8px }\
.board-menu-header.js-board-menu-title.is-in-frame { margin-top: 40px }\
@media only screen and (max-width: 750px) {\
  a.header-logo.js-home-via-logo { position: absolute; left: 69px; margin-left: 0;\
    width: 30px; overflow: hidden; display: inline-block; font-family: trellicons;\
    -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; font-style: normal;\
    font-weight: 400; text-align: center; text-decoration: none;\
    font-size: 16px; line-height: 30px; color: #fff; text-decoration: none;\
    opacity: 1; transition: all 0s linear; border-radius: 3px \
  }\
  a.header-logo.js-home-via-logo:active { box-shadow: 0 0 8px 4px rgba(0, 0, 0, 0.32) inset }\
  a.header-logo.js-home-via-logo:before { content:"\\e606" }\
  .header-logo-default { display: none!important }\
  .header-logo-loading { display: none!important }\
  a.header-btn.header-boards.js-boards-menu { visibility: hidden }\
  .u-gutter { margin-left: 0 }\
}'

var style = document.createElement('style');
style.type = 'text/css';
if (style.styleSheet){
    style.styleSheet.cssText = css;
}
else {
    style.appendChild(document.createTextNode(css));
}

var head = document.head || document.getElementsByTagName('head')[0];
head.appendChild(style);