'use client'

import React from 'react'

import { SearchIcon } from 'lucide-react'
import Link from 'next/link'

export const HeaderNav: React.FC = () => {
  return (
    <nav className="flex gap-3 items-center">
      <Link href="/search">
        <span className="sr-only">Search</span>
        <SearchIcon className="w-5 text-primary" />
      </Link>
    </nav>
  )
}
