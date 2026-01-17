#!/usr/bin/env python3
"""
Confluence Setup Helper - Interactive Configuration
"""

import os
import sys
import platform

def get_shell_config_file():
    """Determine which shell config file to use"""
    shell = os.getenv('SHELL', '')
    
    if 'zsh' in shell:
        return os.path.expanduser('~/.zprofile')
    elif 'bash' in shell:
        return os.path.expanduser('~/.bash_profile')
    else:
        return os.path.expanduser('~/.profile')


def setup_confluence_config():
    """Interactive setup for Confluence configuration"""
    
    print("="*60)
    print("🔧 Confluence Configuration Setup")
    print("="*60)
    print()
    print("This wizard will help you configure Confluence integration.")
    print()
    
    # Get configuration
    print("📝 Please provide the following information:")
    print()
    
    confluence_url = input("1. Confluence URL (e.g., https://company.atlassian.net): ").strip()
    if not confluence_url:
        print("❌ Confluence URL is required!")
        sys.exit(1)
    
    confluence_email = input("2. Your Confluence email: ").strip()
    if not confluence_email:
        print("❌ Email is required!")
        sys.exit(1)
    
    print()
    print("3. API Token:")
    print("   Get it from: https://id.atlassian.com/manage-profile/security/api-tokens")
    api_token = input("   Enter API Token: ").strip()
    if not api_token:
        print("❌ API Token is required!")
        sys.exit(1)
    
    space_key = input("4. Confluence Space Key (e.g., QA, DEV): ").strip().upper()
    if not space_key:
        print("❌ Space Key is required!")
        sys.exit(1)
    
    parent_page_id = input("5. Parent Page ID (optional, press Enter to skip): ").strip()
    
    # Confirm
    print()
    print("="*60)
    print("📋 Configuration Summary:")
    print("="*60)
    print(f"Confluence URL: {confluence_url}")
    print(f"Email: {confluence_email}")
    print(f"API Token: {'*' * (len(api_token) - 4) + api_token[-4:]}")
    print(f"Space Key: {space_key}")
    if parent_page_id:
        print(f"Parent Page ID: {parent_page_id}")
    print("="*60)
    print()
    
    confirm = input("Is this correct? (yes/no): ").strip().lower()
    
    if confirm not in ['yes', 'y']:
        print("❌ Setup cancelled")
        sys.exit(1)
    
    # Save configuration
    system = platform.system()
    
    if system == "Windows":
        # Windows - use setx
        print("\n📝 Setting environment variables (Windows)...")
        
        os.system(f'setx CONFLUENCE_URL "{confluence_url}"')
        os.system(f'setx CONFLUENCE_EMAIL "{confluence_email}"')
        os.system(f'setx CONFLUENCE_API_TOKEN "{api_token}"')
        os.system(f'setx CONFLUENCE_SPACE_KEY "{space_key}"')
        
        if parent_page_id:
            os.system(f'setx CONFLUENCE_PARENT_PAGE_ID "{parent_page_id}"')
        
        print("\n✅ Configuration saved!")
        print("\n⚠️  IMPORTANT: Close and reopen Command Prompt for changes to take effect")
        
    else:
        # Mac/Linux
        config_file = get_shell_config_file()
        
        print(f"\n📝 Adding to {config_file}...")
        
        with open(config_file, 'a') as f:
            f.write('\n# Confluence Configuration (Test Plan Generator)\n')
            f.write(f'export CONFLUENCE_URL="{confluence_url}"\n')
            f.write(f'export CONFLUENCE_EMAIL="{confluence_email}"\n')
            f.write(f'export CONFLUENCE_API_TOKEN="{api_token}"\n')
            f.write(f'export CONFLUENCE_SPACE_KEY="{space_key}"\n')
            
            if parent_page_id:
                f.write(f'export CONFLUENCE_PARENT_PAGE_ID="{parent_page_id}"\n')
        
        print("✅ Configuration saved!")
        print(f"\n⚠️  Run this command to reload: source {config_file}")
        print("   Or close and reopen your terminal")
    
    # Test connection
    print("\n🔍 Testing connection...")
    
    # Set environment variables for this session
    os.environ['CONFLUENCE_URL'] = confluence_url
    os.environ['CONFLUENCE_EMAIL'] = confluence_email
    os.environ['CONFLUENCE_API_TOKEN'] = api_token
    os.environ['CONFLUENCE_SPACE_KEY'] = space_key
    if parent_page_id:
        os.environ['CONFLUENCE_PARENT_PAGE_ID'] = parent_page_id
    
    # Try to import and test
    try:
        import requests
        from requests.auth import HTTPBasicAuth
        
        auth = HTTPBasicAuth(confluence_email, api_token)
        url = f"{confluence_url}/wiki/rest/api/space/{space_key}"
        
        response = requests.get(url, auth=auth, timeout=10)
        
        if response.status_code == 200:
            print("✅ Connection successful!")
            print(f"   Connected to space: {space_key}")
        elif response.status_code == 401:
            print("⚠️  Authentication failed - check email and API token")
        elif response.status_code == 404:
            print(f"⚠️  Space '{space_key}' not found")
        else:
            print(f"⚠️  Unexpected response: {response.status_code}")
            
    except ImportError:
        print("⚠️  Cannot test connection (requests library not installed)")
        print("   Install with: pip install requests")
    except Exception as e:
        print(f"⚠️  Connection test failed: {e}")
    
    print("\n" + "="*60)
    print("✅ Setup Complete!")
    print("="*60)
    print("\nNext steps:")
    print("1. Reload your terminal (or run the source command above)")
    print("2. Generate and upload a test plan:")
    print("   python3 generate_and_upload.py requirements.pdf \"Project Name\"")
    print("\n" + "="*60)


if __name__ == "__main__":
    setup_confluence_config()
