import { getCachedGlobal } from '@/utilities/getGlobals'

import type { Footer } from '@/payload-types'

import { CMSLink } from '@/components/Link'
import { ThemeSelector } from '@/providers/Theme/ThemeSelector'

export async function Footer() {
  let footer: Footer | null = null
  try {
    footer = await getCachedGlobal('footer')()
  } catch (error) {
    console.error(error)
  }

  const navItems = footer?.navItems || []

  return (
    <footer className="border-t border-border bg-black dark:bg-card text-white">
      <div className="container py-8 gap-8 flex flex-col md:flex-row md:justify-between">
        <div className="flex flex-col-reverse items-start md:flex-row gap-4 md:items-center">
          <ThemeSelector />
          <nav className="flex flex-col md:flex-row gap-4">
            {navItems.map(({ link }, i) => {
              return <CMSLink className="text-white" key={i} {...link} />
            })}
          </nav>
        </div>
      </div>
    </footer>
  )
}
