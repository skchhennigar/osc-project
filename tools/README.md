# OSC Project Document Conversion Tools

This directory contains Python tools for converting various document formats to Markdown for processing with Claude Code.

## 📋 Overview

The `doc_converter.py` script can convert the following formats to Markdown:
- **Word Documents**: `.docx`, `.doc`
- **Excel Spreadsheets**: `.xlsx`, `.xls`
- **PDF Files**: `.pdf`
- **Text Files**: `.txt`
- **CSV Files**: `.csv`
- **HTML Files**: `.html`
- **RTF Files**: `.rtf`
- **Markdown Files**: `.md` (copies with metadata)

## 🚀 Installation

1. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Minimal installation** (for basic functionality):
   ```bash
   pip install python-docx pandas openpyxl
   ```

3. **Full installation** (for all features):
   ```bash
   pip install -r requirements.txt
   ```

## 📖 Usage

### Convert a Single File

```bash
python tools/doc_converter.py path/to/document.docx
```

Options:
- `-o, --output`: Specify output directory (default: `converted_docs`)
- `-n, --name`: Custom output filename
- `-v, --verbose`: Enable verbose logging

Example:
```bash
python tools/doc_converter.py "Project Charter.docx" -o src/docs/project/charter -n project-charter
```

### Convert Multiple Files

Convert all documents in a directory:
```bash
python tools/doc_converter.py path/to/documents/ -r
```

Options:
- `-r, --recursive`: Process subdirectories recursively

### Convert Specific Document Types

Convert only Excel files in a directory:
```bash
find documents -name "*.xlsx" -exec python tools/doc_converter.py {} \;
```

## 📂 Output Structure

Converted files include YAML frontmatter with metadata:

```markdown
---
file_type: "document"
title: "Project Charter"
author: "John Doe"
created: "2024-01-15T10:30:00"
converted_date: "2024-01-20T14:22:00"
status: converted
needs_review: true
---

# Document Content Here
```

## 🔧 Features by Format

### Word Documents (.docx, .doc)
- Preserves heading hierarchy (H1-H6)
- Converts tables to Markdown tables
- Extracts document metadata (author, dates, etc.)
- Uses Mammoth for better HTML conversion if available

### Excel Files (.xlsx, .xls)
- Converts each sheet to a separate section
- Tables formatted as Markdown tables
- Includes sheet metadata (rows, columns, names)
- Handles multiple sheets automatically

### PDF Files (.pdf)
- Text extraction with page markers
- Uses pdfplumber for better accuracy
- Falls back to PyPDF2 if needed
- Notes if content cannot be extracted

### CSV Files (.csv)
- Direct conversion to Markdown tables
- Preserves column headers
- Includes row/column count metadata

### HTML Files (.html)
- Converts common HTML tags to Markdown
- Preserves headings, bold, italic formatting
- Strips unnecessary HTML elements

## 🎯 Integration with Documentation Structure

The converter is designed to work with the OSC project documentation structure:

1. **Convert project documents**:
   ```bash
   python tools/doc_converter.py "legacy_docs/Project Charter.docx" -o src/docs/project/charter
   ```

2. **Convert meeting notes**:
   ```bash
   python tools/doc_converter.py "Meeting Notes 2024-01-15.docx" -o src/docs/meetings/standups
   ```

3. **Convert requirements**:
   ```bash
   python tools/doc_converter.py "Requirements.xlsx" -o src/docs/requirements/functional
   ```

## 🛠️ Troubleshooting

### Import Errors
If you get import errors, install the missing package:
```bash
# For Word documents
pip install python-docx mammoth

# For Excel/CSV
pip install pandas openpyxl

# For PDFs
pip install pdfplumber PyPDF2
```

### Encoding Issues
The converter uses UTF-8 encoding by default. For files with different encodings, you may need to convert them first.

### Large Files
For very large files, consider:
- Breaking PDFs into smaller chunks
- Processing Excel sheets individually
- Using the verbose flag to monitor progress

## 📝 Best Practices

1. **Review converted content**: Always review the converted Markdown, especially for complex documents
2. **Check formatting**: Tables and special formatting may need manual adjustment
3. **Update metadata**: The frontmatter includes a `needs_review: true` flag as a reminder
4. **Organize by type**: Use the documentation structure directories for proper organization

## 🔄 Workflow Example

1. **Gather legacy documents**:
   ```bash
   mkdir legacy_docs
   # Copy all project documents here
   ```

2. **Convert all documents**:
   ```bash
   python tools/doc_converter.py legacy_docs/ -r -o converted_docs
   ```

3. **Review and organize**:
   ```bash
   # Review converted files
   ls converted_docs/
   
   # Move to appropriate directories
   mv converted_docs/project-charter.md src/docs/project/charter/
   mv converted_docs/requirements.md src/docs/requirements/functional/
   ```

4. **Update cross-references**:
   - Update links in the converted documents
   - Add to appropriate index files
   - Remove the `needs_review: true` flag after review

## 🤝 Contributing

To add support for new formats:
1. Add the extension to `supported_formats` dictionary
2. Implement a `_convert_[format]` method
3. Add any required dependencies to `requirements.txt`
4. Update this README with the new format

## 📄 License

This tool is part of the OSC Project and follows the project's licensing terms.