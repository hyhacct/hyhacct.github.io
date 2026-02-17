---
title: about
date: 2026-02-15 19:27:16
---

<style>
  /* 基础容器 - 适配暗色系文本 */
  .about-wrapper-dark {
    max-width: 850px;
    margin: 0 auto;
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    color: #cbd5e1; /* 浅灰蓝色正文 */
    line-height: 1.6;
  }

  /* 个人信息与留言区 - 毛玻璃 + 浅蓝微渐变 */
  .profile-section-dark {
    text-align: center;
    padding: 50px 20px;
    border-radius: 20px;
    margin-bottom: 40px;
    
    /* 毛玻璃核心代码 */
    background: linear-gradient(135deg, rgba(56, 189, 248, 0.05) 0%, rgba(15, 23, 42, 0.4) 100%);
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    
    /* 浅蓝高光边框与发光阴影 */
    border: 1px solid rgba(56, 189, 248, 0.15);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3), inset 0 0 20px rgba(56, 189, 248, 0.03);
  }
  
  .profile-avatar-dark {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 2px solid rgba(56, 189, 248, 0.4);
    box-shadow: 0 0 20px rgba(56, 189, 248, 0.2);
    object-fit: cover;
    transition: all 0.4s ease;
  }
  
  .profile-avatar-dark:hover {
    transform: rotate(5deg) scale(1.05);
    box-shadow: 0 0 30px rgba(56, 189, 248, 0.4);
    border-color: rgba(56, 189, 248, 0.8);
  }

  .profile-name-dark {
    font-size: 2em;
    font-weight: 700;
    margin: 20px 0 10px;
    color: #f8fafc;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
  }
  
  .profile-bio-dark {
    font-size: 1.1em;
    color: #94a3b8;
    max-width: 100%;
    margin: 0 auto;
  }

  /* 模块标题 */
  .section-title-dark {
    font-size: 1.3em;
    font-weight: 600;
    color: #f8fafc;
    padding-bottom: 12px;
    margin: 40px 0 24px;
    position: relative;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    letter-spacing: 1px;
  }
  
  /* 标题下方的极客风浅蓝光柱 */
  .section-title-dark::after {
    content: '';
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 80px;
    height: 2px;
    background: linear-gradient(90deg, #38bdf8, transparent);
    box-shadow: 0 0 10px rgba(56, 189, 248, 0.5);
  }

  /* 技术栈标签 - 毛玻璃晶体风格 */
  .tech-tags-dark {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
  }
  
  .tech-tag-dark {
    background: rgba(15, 23, 42, 0.6);
    color: #e2e8f0;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 0.95em;
    font-weight: 500;
    
    /* 标签毛玻璃 */
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 1px solid rgba(56, 189, 248, 0.15);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    cursor: default;
  }
  
  .tech-tag-dark:hover {
    background: rgba(56, 189, 248, 0.1);
    color: #38bdf8;
    border-color: rgba(56, 189, 248, 0.6);
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(56, 189, 248, 0.2);
  }

  /* 推荐网站栅格网格 */
  .site-grid-dark {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 20px;
  }
  
  /* 卡片毛玻璃风格 */
  .site-card-dark {
    display: flex;
    flex-direction: column;
    padding: 24px;
    border-radius: 12px;
    text-decoration: none !important;
    color: inherit;
    
    /* 默认状态下的暗色毛玻璃底色 */
    background: linear-gradient(135deg, rgba(30, 41, 59, 0.4) 0%, rgba(15, 23, 42, 0.6) 100%);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    border: 1px solid rgba(56, 189, 248, 0.1);
    
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }
  
  /* 卡片悬浮：增强浅蓝渐变发光 */
  .site-card-dark:hover {
    transform: translateY(-5px);
    background: linear-gradient(135deg, rgba(56, 189, 248, 0.08) 0%, rgba(15, 23, 42, 0.8) 100%);
    border-color: rgba(56, 189, 248, 0.5);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5), 0 0 20px rgba(56, 189, 248, 0.15);
  }
  
  .site-title-dark {
    font-weight: 600;
    font-size: 1.15em;
    margin-bottom: 10px;
    color: #f8fafc;
  }
  
  .site-desc-dark {
    font-size: 0.9em;
    color: #94a3b8;
    line-height: 1.5;
    flex-grow: 1;
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
  </div>
</div>
