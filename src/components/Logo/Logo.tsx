import { LayoutDashboard } from 'lucide-react'

export const Logo = ({ title }: { title: string }) => {
  return (
    <div className="flex flex-row items-center gap-2">
      <LayoutDashboard className="w-6 h-6" />
      <p>{title || 'Server Dashboard'}</p>
    </div>
  )
}
