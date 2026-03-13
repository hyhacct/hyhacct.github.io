---
title: about
date: 2026-02-15 19:27:16
---

<style>
  /* 全局与极客风点阵背景 */
  .about-wrapper-dark {
    max-width: 850px;
    margin: 0 auto;
    font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    color: #94a3b8;
    line-height: 1.7;
    /* 微弱的点阵背景增加科技感 */
    background-image: radial-gradient(rgba(56, 189, 248, 0.15) 1px, transparent 1px);
    background-size: 24px 24px;
    padding: 20px;
  }

  /* 个人卡片 - 拟态终端风格 */
  .profile-section-dark {
    position: relative;
    padding: 60px 30px 40px;
    border-radius: 16px;
    margin-bottom: 50px;
    background: rgba(15, 23, 42, 0.75);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(56, 189, 248, 0.15);
    box-shadow: 0 20px 40px -10px rgba(0, 0, 0, 0.5);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    overflow: hidden;
  }

  /* 终端控制按钮 (macOS风格细节) */
  .profile-section-dark::before {
    content: '';
    position: absolute;
    top: 18px;
    left: 20px;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background: #ef4444;
    box-shadow: 20px 0 0 #eab308, 40px 0 0 #22c55e;
    opacity: 0.8;
  }

  /* 现代圆角头像 */
  .profile-avatar-dark {
    width: 110px;
    height: 110px;
    border-radius: 30%; /* 超椭圆感 */
    padding: 3px;
    background: linear-gradient(135deg, #38bdf8, #818cf8, #1e293b);
    object-fit: cover;
    transition: transform 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
    margin-bottom: 20px;
  }
  
  .profile-avatar-dark:hover {
    transform: translateY(-5px) scale(1.05) rotate(3deg);
  }

  /* 渐变文本名字 */
  .profile-name-dark {
    font-size: 2.2em;
    font-weight: 800;
    margin: 0 0 12px;
    background: linear-gradient(to right, #f8fafc, #38bdf8);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    letter-spacing: -0.5px;
  }
  
  .profile-bio-dark {
    font-size: 1.05em;
    max-width: 650px;
    margin: 0 auto;
    color: #cbd5e1;
  }

  /* 模块标题 - 命令行提示符风格 */
  .section-title-dark {
    font-size: 1.3em;
    font-weight: 700;
    color: #e2e8f0;
    margin: 50px 0 25px;
    display: flex;
    align-items: center;
    gap: 12px;
  }
  
  .section-title-dark::before {
    content: '❯';
    color: #38bdf8;
    font-family: "Fira Code", Consolas, monospace;
    font-weight: 900;
  }

  .section-title-dark::after {
    content: '';
    flex-grow: 1;
    height: 1px;
    background: linear-gradient(90deg, rgba(56, 189, 248, 0.2), transparent);
  }

  /* 技术栈标签 - 代码块风格 */
  .tech-tags-dark {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
  }
  
  .tech-tag-dark {
    background: rgba(30, 41, 59, 0.5);
    color: #cbd5e1;
    padding: 6px 14px;
    border-radius: 6px;
    font-size: 0.9em;
    font-family: "Fira Code", "JetBrains Mono", Consolas, monospace; /* 程序员等宽字体 */
    border: 1px solid rgba(255, 255, 255, 0.05);
    transition: all 0.2s ease;
    cursor: default;
  }
  
  .tech-tag-dark:hover {
    background: rgba(56, 189, 248, 0.1);
    color: #38bdf8;
    border-color: rgba(56, 189, 248, 0.4);
    box-shadow: 0 0 15px rgba(56, 189, 248, 0.15);
    transform: translateY(-2px);
  }

  /* 推荐网站栅格 */
  .site-grid-dark {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 16px;
  }
  
  .site-card-dark {
    position: relative;
    display: flex;
    flex-direction: column;
    padding: 20px;
    border-radius: 12px;
    text-decoration: none !important;
    background: rgba(15, 23, 42, 0.4);
    border: 1px solid rgba(255, 255, 255, 0.05);
    transition: all 0.3s ease;
    overflow: hidden;
  }
  
  /* 卡片左侧的品牌色指示条 */
  .site-card-dark::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background: #38bdf8;
    transform: scaleY(0);
    transition: transform 0.3s ease;
    transform-origin: bottom;
  }

  .site-card-dark:hover {
    background: rgba(30, 41, 59, 0.8);
    border-color: rgba(56, 189, 248, 0.25);
    transform: translateY(-3px);
  }

  .site-card-dark:hover::before {
    transform: scaleY(1);
  }
  
  .site-title-dark {
    font-weight: 600;
    font-size: 1.1em;
    color: #f8fafc;
    margin-bottom: 8px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  /* 悬浮时的箭头动画 */
  .site-title-dark::after {
    content: '↗';
    font-family: system-ui;
    font-size: 1.1em;
    color: #38bdf8;
    opacity: 0;
    transform: translate(-10px, 10px);
    transition: all 0.3s ease;
  }

  .site-card-dark:hover .site-title-dark::after {
    opacity: 1;
    transform: translate(0, 0);
  }
  
  .site-desc-dark {
    font-size: 0.85em;
    line-height: 1.6;
    color: #64748b;
  }
</style>

<div class="about-wrapper-dark">

  <div class="profile-section-dark">
    <img src="https://via.placeholder.com/150" alt="Avatar" class="profile-avatar-dark">
    <h1 class="profile-name-dark">Reverse</h1>
    <p class="profile-bio-dark">
      你好，我是一名热衷于全栈开发与自动化探索的开发者。日常游走于前后端开发、RPA 脚本与 AI 工作流之间。喜欢折腾新奇的技术，致力于用代码提升效率。在这里记录我的数字生活与技术心得。
    </p>
  </div>

  <h2 class="section-title-dark">技术栈</h2>
  <div class="tech-tags-dark">
    <span class="tech-tag-dark">Go / Gin</span>
    <span class="tech-tag-dark">Vue 3 / TypeScript</span>
    <span class="tech-tag-dark">Python / RPA</span>
    <span class="tech-tag-dark">Docker</span>
    <span class="tech-tag-dark">PostgreSQL</span>
    <span class="tech-tag-dark">ComfyUI / Dify</span>
    <span class="tech-tag-dark">Ollama</span>
    <span class="tech-tag-dark">SaaS</span>
    <span class="tech-tag-dark">Zabbix</span>
    <span class="tech-tag-dark">夜莺</span>
    <span class="tech-tag-dark">自动化运维</span>
    <span class="tech-tag-dark">AI</span>
  </div>

  <h2 class="section-title-dark">常用与推荐站点</h2>
  <div class="site-grid-dark">
    <a href="https://github.com" target="_blank" class="site-card-dark">
      <div class="site-title-dark">GitHub</div>
      <div class="site-desc-dark">全球最大的代码托管平台与开源社区。</div>
    </a>
    <a href="https://cn.vuejs.org/" target="_blank" class="site-card-dark">
      <div class="site-title-dark">Vue.js</div>
      <div class="site-desc-dark">易学易用，性能出色的渐进式前端框架。</div>
    </a>
    <a href="https://go.dev/" target="_blank" class="site-card-dark">
      <div class="site-title-dark">Go Language</div>
      <div class="site-desc-dark">构建简单、可靠且高效的后端服务。</div>
    </a>
    <a href="https://www.svgviewer.dev/" target="_blank" class="site-card-dark">
      <div class="site-title-dark">SVG Viewer</div>
      <div class="site-desc-dark">在线 SVG 查看/编辑器。</div>
    </a>
    <a href="https://products.aspose.app/pdf/zh/conversion/png-to-svg#" target="_blank" class="site-card-dark">
      <div class="site-title-dark">图片转SVG</div>
      <div class="site-desc-dark">支持 png,jpg 等图片转SVG格式。</div>
    </a>
    <a href="https://gh-proxy.com/" target="_blank" class="site-card-dark">
      <div class="site-title-dark">GitHub代理</div>
      <div class="site-desc-dark">国内访问GitHub拉不下来项目时,可以使用这个代理。</div>
    </a>
    <a href="https://transform.tools/json-to-go" target="_blank" class="site-card-dark">
      <div class="site-title-dark">JSON结构体转换</div>
      <div class="site-desc-dark">支持 JSON 到 Go 结构体转换,也支持其他格式。</div>
    </a>
    <a href="https://www.713dm.com/" target="_blank" class="site-card-dark">
      <div class="site-title-dark">刷剧网站</div>
      <div class="site-desc-dark">支持各种电视剧、电影、综艺等资源的在线观看。</div>
    </a>
    <a href="https://ikuuu.nl/auth/register?code=SFU2" target="_blank" class="site-card-dark">
      <div class="site-title-dark">机场推荐</div>
      <div class="site-desc-dark">目前我自己在使用,比较可靠,100元左右1年,每月300G流量。</div>
    </a>
    <a href="https://github.com/alienator88/Pearcleaner" target="_blank" class="site-card-dark">
      <div class="site-title-dark">MacOS卸载工具</div>
      <div class="site-desc-dark">支持卸载应用的同时清理缓存，清理Homebrew缓存，清理开发环境等，免费开源。</div>
    </a>
  </div>
</div>
