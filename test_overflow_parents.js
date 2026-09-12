const puppeteer = require('puppeteer');
(async () => {
  const browser = await puppeteer.launch({ args: ['--no-sandbox'] });
  const page = await browser.newPage();
  await page.setViewport({ width: 390, height: 844, isMobile: true });
  await page.goto('file://' + __dirname + '/index.html', { waitUntil: 'domcontentloaded' });
  const docScrollWidth = await page.evaluate(() => document.documentElement.scrollWidth);
  console.log(`Doc scrollWidth: ${docScrollWidth}`);

  const topLevelExceeding = await page.evaluate(() => {
    return Array.from(document.body.children).filter(el => {
        return el.getBoundingClientRect().right > 390 || el.scrollWidth > 390;
    }).map(el => ({
        id: el.id,
        className: el.className,
        right: el.getBoundingClientRect().right,
        width: el.getBoundingClientRect().width,
        scrollWidth: el.scrollWidth
    }));
  });
  console.log('Top level elements exceeding 390px:');
  console.log(topLevelExceeding);
  await browser.close();
})();
