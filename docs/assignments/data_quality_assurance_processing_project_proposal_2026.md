---
title: "Data Quality Assurance and Processing Project Proposal"
date: today
---

PSYC 859 Spring 2026

### Due dates

- Proposal: 1/29/2026
- Project submission: 2/12/2026

### Proposal guidelines

Please submit a brief proposal (6-8 pages) describing the data import, processing, and quality assurance
steps to prepare datasets under a conceptual umbrella (e.g., a research project) for data visualization
and analysis. Ideally, please use a dataset that will help you in current and/or future projects.
Use multiple files from the same project that can be merged or aligned (shared IDs, time points, or measures)
to support a coherent visualization/analysis goal.

For the proposal document, feel free to be concise, make use of lists, etc. 
For example, under section 6 (processing scripts proposal), this may look more like a numbered outline than prose. 
Note that when you submit the project, data (if provided) should be deidentified.

### Key ingredients of the proposal

1. Background and rationale for project (1-2 paragraphs)
2. Description of data structure:
   - Types of data/data source. Please provide enough detail about the measures
     and collection procedures that a scientific reader understands the basics.
     For example: ECG data collected at 1000Hz using BIOPAC equipment over the
     course of a 5-minute Treer social stress test.
   - Names and brief descriptions of key variables
   - Original data storage format: file type, number of files, storage on file
     system (i.e., subdirectory structure)
3. Proposed file system structure for project
   - Plan for maintaining unadulterated original data source
   - Plan for organizing code, output, figures, and data on file system
   - For processed data, how will they be stored? Why is this optimal?
   - Rationale for how this plan will support understanding and accessibility for
     collaborators (or other researchers in the future)
   - How will you document decisions about the data processing and analysis for
     the project? How will you document the basic file system structure of the
     project?
4. Description of any data preprocessing steps that need to be performed
     outside of R (e.g., large existing codebase for denoising EEG data etc.)
5. Data quality assurance plan
   - What are the potential sources of artifacts or errors in the data?
   - What checks can be conducted to mitigate these problems using algorithmic
     methods (i.e., automated code that walks through a dataset diagnosing and
     reporting problems)?
   - How will missing data be identified and resolved? Resolution of missing
     values includes
     - When possible, finding the missing data and entering it.
     - Documenting the missingness and, when possible, having a mechanism for
       quieting your QA script so that it does not perpetually yell at you.
   - Are there QA steps that can only be conducted by a trained human (e.g., ECG
     artifact correction)? If so, briefly document why these cannot be automated
     or codified.
   - Relatedly, can simple algorithms be included to enhance error detection for
     human follow-up? For example, in ECG data, consecutive changes of > 300ms in
     the inter-beat interval may be indicative of an artifact to be checked by a
     human. Or in fMRI, a shift in the global mean of the signal 3SD+ above/below
     the temporal mean may be indicative of an artifact.
6. Data QA and processing scripts proposal: Building on the QA plan above, write
   out a simple algorithm (cookbook-style, roughly like a simple outline) for
   the order of steps in your data processing pipeline. Note that the number and
   organization of scripts will depend on your project. In general, try to write
   reasonably modular (functionally specialized) scripts. Core steps include:
   - Setting the working directory (or how you will use an Rstudio project)
   - Defining any variables that will be used throughout the script (e.g.,
     absolute paths to output data)
   - Import of original data
   - Basic tidying of data, if necessary
   - Basic QA checks on each dataset. What are the expected outputs that will
     document data quality?
   - Dataset merging, including fidelity checks on merge
   - Data manipulation/wrangling of merged data for analysis and visualization
7. Briefly document functions that you anticipate writing to automate
     repetitive steps in the QA process (e.g., a function that checks for invalid
     data by looking for values outside of a given range).
8. Briefly document functions that exist in publicly available R packages
     (e.g., `dplyr`, `tidyr`, `purrr`, `editrules`, `validate`) that you anticipate using
     to accomplish your project.
