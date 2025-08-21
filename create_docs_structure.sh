#!/bin/bash
# Create documentation directory structure for OSC-Proj
# Usage: ./create_docs_structure.sh [base_directory]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Get base directory (default to src/docs)
BASE_DIR="${1:-src/docs}"

echo -e "${BLUE}📁 Creating documentation structure in: ${BASE_DIR}${NC}"

# Create main documentation directory
mkdir -p "$BASE_DIR"

# Create main documentation sections
echo -e "${CYAN}📋 Creating main sections...${NC}"

# Project management and governance
mkdir -p "$BASE_DIR/project"
mkdir -p "$BASE_DIR/project/charter"
mkdir -p "$BASE_DIR/project/governance"
mkdir -p "$BASE_DIR/project/planning"
mkdir -p "$BASE_DIR/project/reports"

# Team and people
mkdir -p "$BASE_DIR/team"
mkdir -p "$BASE_DIR/team/members"
mkdir -p "$BASE_DIR/team/roles"
mkdir -p "$BASE_DIR/team/stakeholders"

# Meetings and communication
mkdir -p "$BASE_DIR/meetings"
mkdir -p "$BASE_DIR/meetings/standups"
mkdir -p "$BASE_DIR/meetings/planning"
mkdir -p "$BASE_DIR/meetings/reviews"
mkdir -p "$BASE_DIR/meetings/stakeholder"
mkdir -p "$BASE_DIR/meetings/working-sessions"

# Tasks and work management
mkdir -p "$BASE_DIR/tasks"
mkdir -p "$BASE_DIR/tasks/epics"
mkdir -p "$BASE_DIR/tasks/stories"
mkdir -p "$BASE_DIR/tasks/completed"

# Requirements
mkdir -p "$BASE_DIR/requirements"
mkdir -p "$BASE_DIR/requirements/functional"
mkdir -p "$BASE_DIR/requirements/non-functional"
mkdir -p "$BASE_DIR/requirements/user-stories"

# Architecture and technical
mkdir -p "$BASE_DIR/architecture"
mkdir -p "$BASE_DIR/architecture/decisions"
mkdir -p "$BASE_DIR/architecture/diagrams"
mkdir -p "$BASE_DIR/architecture/patterns"
mkdir -p "$BASE_DIR/architecture/apis"

# Systems and infrastructure
mkdir -p "$BASE_DIR/systems"
mkdir -p "$BASE_DIR/systems/environments"
mkdir -p "$BASE_DIR/systems/configurations"
mkdir -p "$BASE_DIR/systems/monitoring"

# Risk, Assumptions, Issues, Decisions (RAID)
mkdir -p "$BASE_DIR/raid"
mkdir -p "$BASE_DIR/raid/risks"
mkdir -p "$BASE_DIR/raid/assumptions"
mkdir -p "$BASE_DIR/raid/issues"
mkdir -p "$BASE_DIR/raid/decisions"

# Processes and procedures
mkdir -p "$BASE_DIR/processes"
mkdir -p "$BASE_DIR/processes/development"
mkdir -p "$BASE_DIR/processes/deployment"
mkdir -p "$BASE_DIR/processes/testing"
mkdir -p "$BASE_DIR/processes/support"

# Knowledge base
mkdir -p "$BASE_DIR/knowledge"
mkdir -p "$BASE_DIR/knowledge/guides"
mkdir -p "$BASE_DIR/knowledge/troubleshooting"
mkdir -p "$BASE_DIR/knowledge/faqs"
mkdir -p "$BASE_DIR/knowledge/lessons-learned"

# External documents and artifacts
mkdir -p "$BASE_DIR/artifacts"
mkdir -p "$BASE_DIR/artifacts/contracts"
mkdir -p "$BASE_DIR/artifacts/presentations"
mkdir -p "$BASE_DIR/artifacts/external-docs"

# Templates and examples
mkdir -p "$BASE_DIR/templates"
mkdir -p "$BASE_DIR/templates/meetings"
mkdir -p "$BASE_DIR/templates/technical"
mkdir -p "$BASE_DIR/templates/project"

# Archive for old/completed items
mkdir -p "$BASE_DIR/archive"
mkdir -p "$BASE_DIR/archive/completed-sprints"
mkdir -p "$BASE_DIR/archive/old-decisions"
mkdir -p "$BASE_DIR/archive/legacy-docs"

echo -e "${CYAN}📝 Creating index files...${NC}"

# Create main README
cat > "$BASE_DIR/README.md" << 'EOF'
# OSC Project Documentation

Welcome to the OSC project documentation repository. This directory contains all project documentation organized for easy navigation and maintenance.

## 📁 Directory Structure

### 📋 Project Management
- **[project/](project/)** - Project governance, charter, and planning documents
- **[team/](team/)** - Team member profiles, roles, and stakeholder information
- **[meetings/](meetings/)** - Meeting notes, agendas, and action items

### 🔧 Development
- **[requirements/](requirements/)** - Functional and non-functional requirements
- **[architecture/](architecture/)** - System architecture, decisions, and diagrams
- **[systems/](systems/)** - Environment and infrastructure documentation

### 📊 Work Management
- **[tasks/](tasks/)** - Epics, user stories, and task documentation
- **[raid/](raid/)** - Risks, Assumptions, Issues, and Decisions

### 📚 Knowledge Base
- **[processes/](processes/)** - Development, deployment, and operational processes
- **[knowledge/](knowledge/)** - Guides, troubleshooting, and lessons learned
- **[artifacts/](artifacts/)** - External documents and deliverables

### 🛠️ Utilities
- **[templates/](templates/)** - Document templates for consistency
- **[archive/](archive/)** - Completed and legacy documentation

## 🚀 Quick Navigation

### For Developers
- [Getting Started Guide](knowledge/guides/getting-started.md)
- [Development Process](processes/development/README.md)
- [Architecture Overview](architecture/README.md)
- [API Documentation](architecture/apis/README.md)

### For Project Managers
- [Project Charter](project/charter/README.md)
- [Current Sprint](tasks/README.md)
- [RAID Log](raid/README.md)
- [Status Reports](project/reports/README.md)

### For Stakeholders
- [Project Overview](project/README.md)
- [Team Structure](team/README.md)
- [Meeting Notes](meetings/README.md)
- [Key Decisions](raid/decisions/README.md)

## 📝 Contributing

When adding documentation:
1. Use the appropriate directory based on content type
2. Follow naming conventions (see [templates/](templates/))
3. Create cross-references using relative links
4. Update relevant index files

## 🔍 Finding Information

- **By topic**: Navigate through directory structure
- **By date**: Check meeting notes and decision logs
- **By person**: Search team member pages and meeting attendance
- **By system**: Check systems and architecture sections

## 📊 Document Status

| Section | Last Updated | Status | Maintainer |
|---------|-------------|--------|------------|
| Project | TBD | 🟡 In Progress | PM Team |
| Architecture | TBD | 🟡 In Progress | Tech Lead |
| Requirements | TBD | 🟡 In Progress | BA Team |
| Processes | TBD | 🟢 Current | DevOps Team |

---

*This documentation is maintained by the OSC Platform Team*
*Last updated: $(date +'%Y-%m-%d')*
EOF

# Create section index files
echo -e "${CYAN}📄 Creating section indexes...${NC}"

# Project section index
cat > "$BASE_DIR/project/README.md" << 'EOF'
# Project Documentation

## 📋 Project Charter & Governance
- [Project Charter](charter/) - Project authorization and scope
- [Governance](governance/) - Decision-making processes and structure
- [Planning](planning/) - Project plans, timelines, and milestones

## 📊 Reports & Status
- [Status Reports](reports/) - Weekly and monthly project updates
- [Metrics](reports/metrics/) - KPIs and performance indicators
- [Dashboards](reports/dashboards/) - Visual project health indicators

## 🎯 Quick Links
- [Current Objectives](planning/current-objectives.md)
- [Project Timeline](planning/timeline.md)
- [Success Criteria](charter/success-criteria.md)
- [Stakeholder Map](../team/stakeholders/README.md)
EOF

# Team section index
cat > "$BASE_DIR/team/README.md" << 'EOF'
# Team Documentation

## 👥 Team Structure
- [Team Members](members/) - Individual team member profiles
- [Roles & Responsibilities](roles/) - Role definitions and RACI matrix
- [Stakeholders](stakeholders/) - External stakeholder profiles

## 🏗️ Organization
- [Org Chart](roles/org-chart.md)
- [Communication Plan](roles/communication-plan.md)
- [Escalation Matrix](roles/escalation-matrix.md)

## 📞 Contact Information
- [Team Directory](members/directory.md)
- [On-Call Schedule](roles/on-call.md)
- [Meeting Schedule](../meetings/schedule.md)
EOF

# Architecture section index
cat > "$BASE_DIR/architecture/README.md" << 'EOF'
# Architecture Documentation

## 🏗️ System Architecture
- [Overview](overview.md) - High-level system architecture
- [Decisions](decisions/) - Architecture Decision Records (ADRs)
- [Diagrams](diagrams/) - System diagrams and visualizations
- [Patterns](patterns/) - Architectural patterns and principles

## 🔌 Integration
- [APIs](apis/) - API documentation and specifications
- [Data Flow](diagrams/data-flow.md) - Data architecture and flow
- [Security](security/) - Security architecture and guidelines

## 📐 Design Principles
- [Coding Standards](patterns/coding-standards.md)
- [Design Guidelines](patterns/design-guidelines.md)
- [Technology Stack](technology-stack.md)
EOF

# RAID section index
cat > "$BASE_DIR/raid/README.md" << 'EOF'
# RAID Log

Risk, Assumption, Issue, and Decision tracking for the OSC project.

## 🚨 Current Status
- **Open Risks**: [View all](risks/)
- **Active Issues**: [View all](issues/)
- **Key Decisions**: [View all](decisions/)
- **Assumptions**: [View all](assumptions/)

## 📊 Summary Dashboard
| Type | Open | Closed | Total |
|------|------|--------|-------|
| Risks | TBD | TBD | TBD |
| Issues | TBD | TBD | TBD |
| Decisions | TBD | TBD | TBD |
| Assumptions | TBD | TBD | TBD |

## 🔥 High Priority Items
*Items requiring immediate attention*

## 📈 Trends
*Monthly tracking of RAID items*

## 📋 Templates
- [Risk Template](../templates/raid/risk-template.md)
- [Issue Template](../templates/raid/issue-template.md)
- [Decision Template](../templates/raid/decision-template.md)
- [Assumption Template](../templates/raid/assumption-template.md)
EOF

# Meetings section index
cat > "$BASE_DIR/meetings/README.md" << 'EOF'
# Meeting Documentation

## 📅 Regular Meetings
- [Daily Standups](standups/) - Daily team sync meetings
- [Sprint Planning](planning/) - Sprint planning sessions
- [Sprint Reviews](reviews/) - Sprint demos and reviews
- [Stakeholder Meetings](stakeholder/) - Executive and stakeholder updates

## 💼 Working Sessions
- [Technical Sessions](working-sessions/) - Architecture and design discussions
- [Problem Solving](working-sessions/problem-solving/) - Issue resolution sessions

## 📋 Meeting Resources
- [Schedule](schedule.md) - Recurring meeting schedule
- [Templates](../templates/meetings/) - Meeting note templates
- [Guidelines](guidelines.md) - Meeting best practices

## 🔍 Recent Meetings
*Last 10 meetings across all types*

## 📊 Meeting Metrics
- Average attendance
- Action item completion rate
- Meeting frequency by type
EOF

# Create .gitkeep files for empty directories
echo -e "${CYAN}📌 Creating .gitkeep files...${NC}"

find "$BASE_DIR" -type d -empty -exec touch {}/.gitkeep \;

# Create a simple navigation script
cat > "$BASE_DIR/navigate.sh" << 'EOF'
#!/bin/bash
# Simple navigation helper for documentation

echo "OSC Project Documentation Navigator"
echo "=================================="
echo ""
echo "Available sections:"
echo "1. Project (project/)"
echo "2. Team (team/)"
echo "3. Architecture (architecture/)"
echo "4. Requirements (requirements/)"
echo "5. Meetings (meetings/)"
echo "6. Tasks (tasks/)"
echo "7. RAID Log (raid/)"
echo "8. Knowledge Base (knowledge/)"
echo "9. Processes (processes/)"
echo ""
echo "Usage: cd [section]/ to navigate to that section"
echo "       cat [section]/README.md to see section overview"
EOF

chmod +x "$BASE_DIR/navigate.sh"

# Create a documentation maintenance script
cat > "$BASE_DIR/maintain.sh" << 'EOF'
#!/bin/bash
# Documentation maintenance utilities

case "$1" in
    "check-links")
        echo "Checking for broken internal links..."
        find . -name "*.md" -exec grep -l "\[.*\](.*\.md)" {} \; | while read file; do
            echo "Checking $file..."
            # Basic link checking - can be enhanced
        done
        ;;
    "update-dates")
        echo "Updating last modified dates..."
        find . -name "README.md" -exec sed -i "s/Last updated: .*/Last updated: $(date +'%Y-%m-%d')/" {} \;
        ;;
    "stats")
        echo "Documentation Statistics:"
        echo "========================"
        echo "Total markdown files: $(find . -name "*.md" | wc -l)"
        echo "Total directories: $(find . -type d | wc -l)"
        echo "Largest files:"
        find . -name "*.md" -exec wc -l {} \; | sort -nr | head -5
        ;;
    *)
        echo "Documentation maintenance script"
        echo "Usage: ./maintain.sh [check-links|update-dates|stats]"
        ;;
esac
EOF

chmod +x "$BASE_DIR/maintain.sh"

# Summary output
echo ""
echo -e "${GREEN}✅ Documentation structure created successfully!${NC}"
echo ""
echo -e "${BLUE}📁 Created in: ${BASE_DIR}${NC}"
echo -e "${YELLOW}📋 Main sections:${NC}"
echo "   • project/        - Project management and governance"
echo "   • team/           - Team members and stakeholders"
echo "   • architecture/   - Technical architecture and decisions"
echo "   • requirements/   - Functional and non-functional requirements"
echo "   • meetings/       - Meeting notes and agendas"
echo "   • tasks/          - Work items and epics"
echo "   • raid/           - Risks, assumptions, issues, decisions"
echo "   • knowledge/      - Guides and troubleshooting"
echo "   • processes/      - Development and operational processes"
echo "   • artifacts/      - External documents and deliverables"
echo "   • templates/      - Document templates"
echo "   • archive/        - Completed and legacy items"
echo ""
echo -e "${CYAN}🚀 Quick start:${NC}"
echo "   cd $BASE_DIR"
echo "   cat README.md              # Overview and navigation"
echo "   ./navigate.sh              # Section browser"
echo "   ./maintain.sh stats        # Documentation statistics"
echo ""
echo -e "${YELLOW}💡 Next steps:${NC}"
echo "   1. Review the main README.md for navigation"
echo "   2. Start adding your converted markdown files"
echo "   3. Use the section READMEs as guides"
echo "   4. Update index files as you add content"
echo ""
echo -e "${GREEN}📚 Happy documenting!${NC}"