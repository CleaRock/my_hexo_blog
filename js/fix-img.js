hexo.extend.filter.register('after_render:html', function (str) {
  const root = hexo.config.root || '/';
  return str.replace(/src="\/images\//g, `src="${root}images/`);
});
