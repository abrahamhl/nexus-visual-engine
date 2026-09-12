const puppeteer = require('puppeteer');
(async () => {
  const browser = await puppeteer.launch({ args: ['--no-sandbox'] });
  const page = await browser.newPage();
  await page.setViewport({ width: 390, height: 844, isMobile: true });
  await page.goto('file://' + __dirname + '/index.html', { waitUntil: 'domcontentloaded' });
  const rootCause = await page.evaluate(() => {
    // We want elements outside typical mobile bounds, starting from direct children of body/ui-layer
    const allElements = Array.from(document.querySelectorAll('body *'));
    return allElements.filter(el => {
      // Find element which has width bigger than viewport explicitly
      const style = window.getComputedStyle(el);
      const rect = el.getBoundingClientRect();
      return (rect.width > 390 || el.scrollWidth > 390) &&
        el.tagName !== 'SCRIPT' && el.tagName !== 'STYLE' &&
        el.tagName !== 'HTML' && el.tagName !== 'BODY';
    }).map(e => ({id: e.id, class: e.className, rectWidth: e.getBoundingClientRect().width, scrollWidth: e.scrollWidth}));
  });
  console.log(rootCause);
  await browser.close();
})();
