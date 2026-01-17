#!/usr/bin/env python3
"""
Complete QA Documentation Generator
Generates: Test Plan + Test Cases + Optional Confluence Upload
Usage: python3 generate_complete_qa_docs.py requirements.pdf "Project Name"
"""

import os
import sys
import subprocess

def main():
    print("="*60)
    print("🚀 Complete QA Documentation Generator")
    print("   Test Plan + Test Cases + Confluence Upload")
    print("="*60)
    
    # Check arguments
    if len(sys.argv) < 2:
        print("\n❌ Usage: python3 generate_complete_qa_docs.py <requirements.pdf> [project_name]")
        print("\nExample:")
        print("  python3 generate_complete_qa_docs.py requirements.pdf \"My Project\"")
        print("\nWhat this generates:")
        print("  ✅ Test Plan (Word document)")
        print("  ✅ Test Cases (Excel file)")
        print("  ✅ Optional: Confluence upload")
        sys.exit(1)
    
    pdf_path = sys.argv[1]
    project_name = sys.argv[2] if len(sys.argv) > 2 else "Test Project"
    
    # Check if PDF exists
    if not os.path.exists(pdf_path):
        print(f"\n❌ Error: PDF file not found: {pdf_path}")
        sys.exit(1)
    
    print(f"\n📄 Input PDF: {pdf_path}")
    print(f"📋 Project: {project_name}")
    
    # Ask what to generate
    print("\n" + "="*60)
    print("What would you like to generate?")
    print("="*60)
    print("1. Test Plan only")
    print("2. Test Cases only")
    print("3. Both Test Plan and Test Cases (Recommended)")
    print("="*60)
    
    choice = input("\nEnter your choice (1/2/3) [default: 3]: ").strip() or "3"
    
    # Ask about Confluence upload
    confluence_url = os.getenv('CONFLUENCE_URL')
    upload_to_confluence = False
    
    if confluence_url and confluence_url != 'https://your-domain.atlassian.net':
        upload_choice = input("\nUpload to Confluence? (y/n) [default: n]: ").strip().lower()
        upload_to_confluence = upload_choice in ['y', 'yes']
    
    print("\n" + "="*60)
    print("Starting generation...")
    print("="*60)
    
    generated_files = []
    
    # Generate Test Plan
    if choice in ['1', '3']:
        print("\n" + "="*60)
        print("STEP 1: Generating Test Plan")
        print("="*60)
        
        try:
            subprocess.run([
                'python3',
                'generate_test_plan.py',
                pdf_path,
                project_name
            ], check=True)
            
            docx_file = f"{project_name.replace(' ', '_')}_Test_Plan.docx"
            if os.path.exists(docx_file):
                generated_files.append(docx_file)
                print("\n✅ Test Plan generated successfully!")
            
        except subprocess.CalledProcessError as e:
            print(f"\n❌ Error generating test plan: {e}")
    
    # Generate Test Cases
    if choice in ['2', '3']:
        print("\n" + "="*60)
        print(f"STEP {'2' if choice == '3' else '1'}: Generating Test Cases")
        print("="*60)
        
        try:
            subprocess.run([
                'python3',
                'generate_test_cases.py',
                pdf_path,
                project_name
            ], check=True)
            
            xlsx_file = f"{project_name.replace(' ', '_')}_Test_Cases.xlsx"
            if os.path.exists(xlsx_file):
                generated_files.append(xlsx_file)
                print("\n✅ Test Cases generated successfully!")
            
        except subprocess.CalledProcessError as e:
            print(f"\n❌ Error generating test cases: {e}")
    
    # Upload to Confluence
    if upload_to_confluence and generated_files:
        print("\n" + "="*60)
        print(f"STEP 3: Uploading to Confluence")
        print("="*60)
        
        for file in generated_files:
            if file.endswith('.docx'):
                try:
                    subprocess.run([
                        'python3',
                        'confluence_upload.py',
                        file
                    ], check=True)
                    print(f"\n✅ Uploaded {file} to Confluence")
                except subprocess.CalledProcessError as e:
                    print(f"\n⚠️  Failed to upload {file}: {e}")
    
    # Summary
    print("\n" + "="*60)
    print("✅ GENERATION COMPLETE!")
    print("="*60)
    
    if generated_files:
        print("\n📁 Generated Files:")
        for file in generated_files:
            file_size = os.path.getsize(file) / 1024
            print(f"   ✅ {file} ({file_size:.2f} KB)")
    
    print("\n" + "="*60)
    print("Next Steps:")
    print("  1. Review generated documents")
    print("  2. Customize as needed")
    print("  3. Share with team")
    if not upload_to_confluence and confluence_url:
        print("  4. Upload to Confluence (optional):")
        for file in generated_files:
            if file.endswith('.docx'):
                print(f"     python3 confluence_upload.py {file}")
    print("="*60)


if __name__ == "__main__":
    main()
