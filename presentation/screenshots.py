from playwright.sync_api import sync_playwright
from pathlib import Path

# ↪️ Define URLs and filenames
urls = [
    "https://github.com/maehr/open-research-data-template/",
    # "https://github.com/new?template_name=open-research-data-template&template_owner=maehr",
    # "https://codespaces.new/maehr/dh25-showcase",
    "https://dokumentation.stadtgeschichtebasel.ch/",
    "https://dokumentation.stadtgeschichtebasel.ch/sgb-figures/",
    "https://mtwente.github.io/maxvogt-analysis/",
    "https://mtwente.github.io/nordatlantisk-ft/report.html",
    "https://mtwente.github.io/modelling-marti/",
    "https://digihistch24.github.io/",
    "https://dhbern.github.io/",
    "https://dhbern.github.io/decoding-inequality-2025/",
    "https://maehr.github.io/diskriminierungsfreie-metadaten/",
    "https://maehr.github.io/one-template-to-rule-them-all/"
]
filenames = [
    "open_research_data_template.png",
    # "open_research_data_template_repo.png",
    # "open_research_data_template_codespace.png",
    "dokumentation_stadtgeschichtebasel_ch.png",
    "dokumentation_stadtgeschichtebasel_ch_sgb_figures.png",
    "maxvogt_analysis.png",
    "nordatlantisk_ft_report.png",
    "modelling_marti.png",
    "digihistch24.png",
    "dhbern.png",
    "decoding_inequality_2025.png",
    "diskriminierungsfreie_metadaten.png",
    "one_template_to_rule_them_all.png"
]

assert len(urls) == len(filenames), "URLs and filenames must match"

output_dir = Path("presentation/images/")
output_dir.mkdir(exist_ok=True)

# Use MacBook Pro's native resolution and scale factor 2 for Retina
viewport = {"width": 2940, "height": 1654}
scale = 2  # high-resolution (Retina)

with sync_playwright() as p:
    browser = p.chromium.launch()
    context = browser.new_context(viewport=viewport, device_scale_factor=scale)
    for url, fname in zip(urls, filenames):
        page = context.new_page()
        page.goto(url, wait_until="networkidle")
        page.evaluate("document.body.style.zoom=2.0")

        # Example: Click a button
        # Replace 'button_selector' with the actual selector for the button
        # page.click('button_selector')
        
        # Example: Scroll down to a specific element
        # Replace 'element_selector' with the actual selector for the element
        # page.scroll_into_view('element_selector')
        
        # Example: Scroll down by a certain amount
        # page.evaluate("window.scrollBy(0, 1000)")  # Scroll down by 1000 pixels

        path = output_dir / fname
        page.screenshot(path=path)
        print(f"✅ Saved {path} for {url}")
    browser.close()