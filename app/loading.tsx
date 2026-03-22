export default function Loading() {
  return (
    <div className="min-h-screen p-6 lg:p-10">
      {/* Header skeleton */}
      <div className="mb-10">
        <div className="skeleton w-24 h-3 mb-3 rounded" />
        <div className="skeleton w-64 h-9 mb-2 rounded" />
        <div className="skeleton w-40 h-4 rounded" />
      </div>

      {/* Stats grid skeleton */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 mb-8">
        {[...Array(4)].map((_, i) => (
          <div key={i} className="card p-4">
            <div className="skeleton w-20 h-2.5 mb-3 rounded" />
            <div className="skeleton w-32 h-7 mb-2 rounded" />
            <div className="skeleton w-16 h-2.5 rounded" />
          </div>
        ))}
      </div>

      {/* Content skeleton */}
      <div className="grid lg:grid-cols-3 gap-6">
        <div className="lg:col-span-2 card p-6 space-y-4">
          {[...Array(6)].map((_, i) => (
            <div key={i} className="flex items-center gap-4">
              <div className="skeleton w-28 h-3 rounded" />
              <div className="skeleton w-24 h-3 rounded" />
              <div className="skeleton w-16 h-5 rounded" />
              <div className="skeleton w-24 h-3 rounded ml-auto" />
            </div>
          ))}
        </div>
        <div className="card p-6 space-y-3">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="p-3 rounded" style={{ border: "1px solid #152035" }}>
              <div className="flex justify-between mb-2">
                <div className="skeleton w-28 h-3 rounded" />
                <div className="skeleton w-20 h-3 rounded" />
              </div>
              <div className="skeleton w-full h-0.5 rounded" />
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
