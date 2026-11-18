import streamlit as st

st.set_page_config(
    page_title="Jira Project Portal",
    page_icon="📊",
    layout="wide",
    initial_sidebar_state="expanded",
)

BASE = (
    "https://dbc-9bb5c5af-f660.cloud.databricks.com/"
    "dashboardsv3/01f1e315857913f6892b4087acaf12ad/published"
)
ORG = "7474656692638299"
DATE_FILTER = "&f_global_filters%7Eg_date=_all_"

SECTIONS = [
    {
        "icon": "📁",
        "name": "Project Portfolio",
        "description": "Project-level delivery status, issue distribution and workload.",
        "url": f"{BASE}?o={ORG}{DATE_FILTER}",
    },
    {
        "icon": "🏃",
        "name": "Sprint Performance",
        "description": "Sprint progress, completion and delivery trends.",
        "url": f"{BASE}/pages/sprint_delivery?o={ORG}{DATE_FILTER}",
    },
    {
        "icon": "👥",
        "name": "Developer Insights",
        "description": "Developer activity, contributions and work distribution.",
        "url": f"{BASE}/pages/developer_performance?o={ORG}{DATE_FILTER}",
    },
    {
        "icon": "🎯",
        "name": "Epic & Feature Tracking",
        "description": "Story, epic and feature delivery reporting.",
        "url": f"{BASE}/pages/story_report?o={ORG}{DATE_FILTER}",
    },
    {
        "icon": "🚚",
        "name": "Service Delivery",
        "description": "Service delivery reporting and performance.",
        "url": f"{BASE}/pages/service_delivery?o={ORG}{DATE_FILTER}",
    },
    {
        "icon": "📚",
        "name": "KEDB",
        "description": "Knowledge Error Database and known issue reference.",
        "url": f"{BASE}/pages/ec255aee?o={ORG}{DATE_FILTER}",
    },
    {
        "icon": "🔮",
        "name": "Predictive Analysis",
        "description": "Predictive analysis reporting from your dashboard.",
        "url": f"{BASE}/pages/a621f203?o={ORG}{DATE_FILTER}",
    },
]

st.markdown("""
<style>
    .stApp {
        background: #f4f7fb;
    }

    .block-container {
        max-width: 1500px;
        padding-top: 2rem;
        padding-bottom: 2rem;
    }

    /* Sidebar: dark background with readable text and transparent containers */
    section[data-testid="stSidebar"] {
        background: #142b46 !important;
        min-width: 340px;
    }
    section[data-testid="stSidebar"] > div {
        background: #142b46 !important;
    }
    section[data-testid="stSidebar"] [data-testid="stMarkdownContainer"],
    section[data-testid="stSidebar"] [data-testid="stMarkdownContainer"] * ,
    section[data-testid="stSidebar"] p,
    section[data-testid="stSidebar"] span,
    section[data-testid="stSidebar"] label {
        color: #f8fafc !important;
    }
    section[data-testid="stSidebar"] [data-testid="stVerticalBlockBorderWrapper"],
    section[data-testid="stSidebar"] [data-testid="stVerticalBlock"] {
        background: transparent !important;
        border-color: rgba(255,255,255,.15) !important;
    }
    section[data-testid="stSidebar"] div.stLinkButton > a {
        background: #ffffff !important;
        color: #173657 !important;
        border: 0 !important;
        border-radius: 8px !important;
        font-weight: 600 !important;
    }

    .hero {
        padding: 1.5rem 1.7rem;
        border-radius: 18px;
        background: linear-gradient(115deg, #142b46, #28679d);
        color: white;
        margin-bottom: 1.3rem;
    }
    .hero h1 {
        color: white !important;
        margin: 0 0 .4rem 0;
        font-size: 2.15rem;
    }
    .hero p {
        color: #dbeafe !important;
        margin: 0;
        font-size: 1.05rem;
    }
    div[data-testid="stVerticalBlockBorderWrapper"] {
        background: #ffffff !important;
        border: 1px solid #e2e8f0 !important;
        border-radius: 14px !important;
    }
    div.stLinkButton > a {
        width: 100%;
        border-radius: 9px;
        font-weight: 600;
        justify-content: center;
    }
</style>
""", unsafe_allow_html=True)

# Left navigation panel: all seven sections with a short explanation and direct link.
with st.sidebar:
    st.markdown("## 📊 JIRA PROJECT PORTAL")
    st.caption("PROJECT DELIVERY • ANALYTICS")
    st.divider()
    st.markdown("### Explore all 7 sections")

    for section in SECTIONS:
        st.markdown(
            f"""
            <div style="
                padding: 9px 0 3px 0;
                border-bottom: 1px solid rgba(255,255,255,.16);
                margin-bottom: 7px;">
              <div style="font-size: 15px; font-weight: 700; color: #ffffff;">
                {section['icon']} {section['name']}
              </div>
              <div style="font-size: 12px; line-height: 1.4; color: #d6e3f1;
                          margin: 4px 0 8px 25px;">
                {section['description']}
              </div>
            </div>
            """,
            unsafe_allow_html=True,
        )
        st.link_button(
            f"Open {section['name']}",
            section["url"],
            use_container_width=True,
        )

    st.divider()
    st.caption("Source: Published Databricks AI/BI dashboard")
    st.caption("Powered by Databricks")

# Main landing page
st.markdown("""
<div class="hero">
  <h1>Jira Project Intelligence</h1>
  <p>
    Your central workspace for project portfolio, sprint delivery,
    developer insights, epics, features, knowledge and predictive analysis.
  </p>
</div>
""", unsafe_allow_html=True)

st.subheader("Welcome to your Jira workspace")
st.write(
    "Use the left navigation panel to explore any of the seven reporting "
    "areas. Each Open button takes you directly to its matching page in "
    "the existing published Databricks dashboard."
)

st.info(
    "The dashboard remains the single source of truth. This portal provides "
    "organized navigation and descriptions; it does not duplicate metrics "
    "or query additional tables."
)

st.markdown("### Available reporting areas")
left, right = st.columns(2, gap="large")

for index, section in enumerate(SECTIONS):
    target = left if index % 2 == 0 else right
    with target:
        with st.container(border=True):
            st.markdown(f"#### {section['icon']} {section['name']}")
            st.write(section["description"])
            st.link_button(
                f"Open {section['name']}",
                section["url"],
                use_container_width=True,
                type="primary",
            )

st.caption(
    "Each report opens in a new browser tab, using the page-specific "
    "published dashboard URL."
)
