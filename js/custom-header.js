document.addEventListener("DOMContentLoaded", function () {
  const header = document.querySelector('#banner .site-info');
  if (header) {
    header.innerHTML = `
      <div class="custom-index-header">
        <h1>CleaRock 的博客试验站</h1>
        <p id="typed-subtitle"></p>
      </div>
    `;
  }

  // 打字机效果
  const subtitles = [
    "技术 · Minecraft · 数字生活",
    "4thjunji · 审计 · Mac · 服务器",
    "Coding · Server · Audit · Life"
  ];

  let index = 0;
  let charIndex = 0;

  function type() {
    let current = subtitles[index];
    document.getElementById("typed-subtitle").innerText = current.substring(0, charIndex);

    charIndex++;
    if (charIndex > current.length) {
      charIndex = 0;
      index = (index + 1) % subtitles.length;
      setTimeout(type, 1200);
    } else {
      setTimeout(type, 120);
    }
  }

  type();
});
