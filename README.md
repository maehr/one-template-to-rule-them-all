# One Template to Rule Them All: Interactive Research Data Documentation with Quarto

This repository contains the presentation materials for **"One Template to Rule Them All: Interactive Research Data Documentation with Quarto"** presented by Moritz Mähr and Moritz Twente at the **Digital Humanities Tech Symposium** (DHTech), held during DH2025 at NOVA University, Lisbon, Portugal.

The DHTech Symposium, a mini-conference embedded within DH2025 (July 14–18, 2025), provides a venue to foreground technical innovation and infrastructure in digital humanities research. Unlike typical DH conferences that prioritize research outcomes over technical process, the DHTech Symposium emphasizes the tools, platforms, and methodologies that underpin digital scholarship.

Our contribution introduces the **Open Research Data Template**, a GitHub-based framework designed to streamline the publication and reuse of open research data through executable, interactive documentation using Quarto. The template supports integration of narrative, metadata, and code in Python, R, Julia, and ObservableJS, enabling researchers to publish cohesive, reproducible, and FAIR-compliant websites directly from their project repositories.

We discuss how the template lowers barriers to reuse and sustainable archiving of research workflows by automating documentation pipelines and facilitating seamless publishing. Real-world applications from projects such as **DigiHistCH24**, **Stadt.Geschichte.Basel**, **DHBern**, and **Decoding Inequality 2025** are presented to demonstrate its flexibility across domains and use cases.

The presentation covers:

- The motivation and need for executable research data documentation in DH.
- The structure and technical implementation of the template using Quarto and GitHub Actions.
- Automation strategies for multi-language code integration and metadata harmonization.
- Sustainable publishing practices for archiving and interoperability.
- Live demonstrations and case studies.

**Links**

- [Digital Humanities Tech Symposium Agenda](https://dhtech.github.io)
- [DH2025, NOVA University Lisbon](https://dh2025.pt)

This repository includes slides, demo notebooks, and reference materials to support the talk and foster adoption of the Open Research Data Template in DH and adjacent fields.

[![GitHub issues](https://img.shields.io/github/issues/maehr/one-template-to-rule-them-all.svg)](https://github.com/maehr/one-template-to-rule-them-all/issues)
[![GitHub forks](https://img.shields.io/github/forks/maehr/one-template-to-rule-them-all.svg)](https://github.com/maehr/one-template-to-rule-them-all/network)
[![GitHub stars](https://img.shields.io/github/stars/maehr/one-template-to-rule-them-all.svg)](https://github.com/maehr/one-template-to-rule-them-all/stargazers)
[![Code license](https://img.shields.io/github/license/maehr/one-template-to-rule-them-all.svg)](https://github.com/maehr/one-template-to-rule-them-all/blob/main/LICENSE-AGPL.md)
[![Data license](https://img.shields.io/github/license/maehr/one-template-to-rule-them-all.svg)](https://github.com/maehr/one-template-to-rule-them-all/blob/main/LICENSE-CCBY.md)
[![DOI](https://zenodo.org/badge/ZENODO_RECORD.svg)](https://zenodo.org/badge/latestdoi/ZENODO_RECORD)

## Repository Structure

The structure of this repository follows the [Advanced Structure for Data Analysis](https://the-turing-way.netlify.app/project-design/project-repo/project-repo-advanced.html) of _The Turing Way_ and is organized as follows:

- `analysis/`: scripts and notebooks used to analyze the data
- `assets/`: images, logos, etc. used in the README and other documentation
- `build/`: scripts and notebooks used to build the data
- `data/`: data files
- `docs/`: documentation for the data and the repository
- `project-management/`: project management documents (e.g., meeting notes, project plans, etc.)
- `src/`: source code for the data (e.g., scripts used to collect or process the data)
- `test/`: tests for the data and source code
- `report.md`: a report describing the analysis of the data

## Data Description

- TODO Describe the data in this repository, including what it represents, how it was collected or obtained, any preprocessing or cleaning that was done, and any limitations or potential biases.
- TODO Data models, including field names, descriptions, and controlled values, should be clearly documented in a static document that is maintained with the data and is part of the products.
- TODO All rights and intellectual property issues should be clearly documented. Where possible, data and products should be released under open licenses (Creative Commons, GNU, BSD, MPL).

## Use

These data are openly available to everyone and can be used for any research or educational purpose. If you use this data in your research, please cite as specified in [CITATION.cff](CITATION.cff). The following citation formats are also available through _Zenodo_:

- [BibTeX](https://zenodo.org/record/ZENODO_RECORD/export/hx)
- [CSL](https://zenodo.org/record/ZENODO_RECORD/export/csl)
- [DataCite](https://zenodo.org/record/ZENODO_RECORD/export/dcite4)
- [Dublin Core](https://zenodo.org/record/ZENODO_RECORD/export/xd)
- [DCAT](https://zenodo.org/record/ZENODO_RECORD/export/dcat)
- [JSON](https://zenodo.org/record/ZENODO_RECORD/export/json)
- [JSON-LD](https://zenodo.org/record/ZENODO_RECORD/export/schemaorg_jsonld)
- [GeoJSON](https://zenodo.org/record/ZENODO_RECORD/export/geojson)
- [MARCXML](https://zenodo.org/record/ZENODO_RECORD/export/xm)

_Zenodo_ provides an [API (REST & OAI-PMH)](https://developers.zenodo.org/) to access the data. For example, the following command will return the metadata for the most recent version of the data

```bash
curl -i https://zenodo.org/api/records/ZENODO_RECORD
```

## Support

This project is maintained by [@maehr](https://github.com/maehr). Please understand that we can't provide individual support via email. We also believe that help is much more valuable when it's shared publicly, so more people can benefit from it.

| Type                                   | Platforms                                                                                |
| -------------------------------------- | ---------------------------------------------------------------------------------------- |
| 🚨 **Bug Reports**                     | [GitHub Issue Tracker](https://github.com/maehr/one-template-to-rule-them-all/issues)    |
| 📊 **Report bad data**                 | [GitHub Issue Tracker](https://github.com/maehr/one-template-to-rule-them-all/issues)    |
| 📚 **Docs Issue**                      | [GitHub Issue Tracker](https://github.com/maehr/one-template-to-rule-them-all/issues)    |
| 🎁 **Feature Requests**                | [GitHub Issue Tracker](https://github.com/maehr/one-template-to-rule-them-all/issues)    |
| 🛡 **Report a security vulnerability** | See [SECURITY.md](SECURITY.md)                                                           |
| 💬 **General Questions**               | [GitHub Discussions](https://github.com/maehr/one-template-to-rule-them-all/discussions) |

## Roadmap

No changes are currently planned.

## Contributing

All contributions to this repository are welcome! If you find errors or problems with the data, or if you want to add new data or features, please open an issue or pull request. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Versioning

We use [SemVer](http://semver.org/) for versioning. The available versions are listed in the [tags on this repository](https://github.com/maehr/one-template-to-rule-them-all/tags).

## Authors and acknowledgment

- **Moritz Mähr** - _Initial work_ - [maehr](https://github.com/maehr)
- **Moritz Twente** - _Initial work_ - [mtwente](https://github.com/mtwente)

See also the list of [contributors](https://github.com/maehr/one-template-to-rule-them-all/graphs/contributors) who contributed to this project.

## License

The data in this repository is released under the Creative Commons Attribution 4.0 International (CC BY 4.0) License - see the [LICENSE-CCBY](LICENSE-CCBY.md) file for details. By using this data, you agree to give appropriate credit to the original author(s) and to indicate if any modifications have been made.

The code in this repository is released under the GNU Affero General Public License v3.0 - see the [LICENSE-AGPL](LICENSE-AGPL.md) file for details. By using this code, you agree to make any modifications available under the same license.
